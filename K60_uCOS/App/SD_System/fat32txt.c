/******************************************************************************

* fat32txt.c

* fat32文件系统操作（写单个大的TXT文件） 

* 第一作者：  纪成   (第四届摄像头)
  完善与整理：孙文健 (第六届摄像头)
* 版本：V1.15 (与V1.13、v1.14版相兼容,不使能双缓存时与V1.10之后的版本相兼容)
* 版本更新时间：2012年1月30日
 
******************************************************************************/

#include "./SD_System.h"
                                  
#if EN_SDCard != 0                

static byte_sd const dir_sd[32]=                             /************By Sword************/
{
0x41,0x2c,0x7b,0x8c,0x4e,0xe3,0x4e,0x0a,0x4e,0x4d,0x4f,0x0f,0x00,0x31,0x3a,0x67,
0x2e,0x00,0x6c,0x00,0x6e,0x00,0x6b,0x00,0x00,0x00,0x00,0x00,0xff,0xff,0xff,0xff 
};
//卷标属性,当检测到根目录的第一个单元为空时写入该内容
static byte_sd const file_property[15]=
{0x20,0x18,0x00,0x00,0x00,0x64,0x3b,0x64,0x3b,0x00,0x00,0x00,0x00,0x64,0x3b};
//文件属性
static byte_sd  file_name[11]=                               /************By Sword************/
{'C','A','R','-','-','0','0','0',0x54,0x58,0x54};
//文件名称(含扩展名)
//注,英文字母必须大写，否则文件打不开！！！

static dword_sd add_sta,add_dir,add_f1,add_f2;               /************By Sword************/
//启动扇区、根目录、fat1、fat2的首地址（初始值）
static dword_sd p_datasector;      //数据扇区指针            /************By Sword************/
static word_sd  p_sector;  //扇区指针                        /************By Sword************/
static dword_sd file_size=0;
static byte_sd  sector_cluster; //每扇区对应的簇数
static dword_sd sector_sta;     //启动扇区扇区数
static dword_sd sector_fat;     //fat表扇区数
static word_sd  cluster_number,ram_number;
static word_sd  cnt_cluster;
static word_sd  p_segcluster;     //簇组的指针
static byte_sd  num_segcluster;   //当前簇组的长度
static byte_sd  p_cluster;        //指向当前簇组中簇的位置的指针
static byte_sd  DBUF[512];        //定义512字节缓冲区
static dword_sd  next_cluster[SD_MAX_segment]; 
//标记下一个簇组:低24位表示该簇组的起始地址,高8位表示簇的个数   
/************By Sword************/ 


#ifdef EN_SDbuf   //双缓冲模式

static byte_sd  DBUF2[512];   //SD卡第二缓冲区
static dword_sd Sector_SDbuf; //第二缓存中数据对应的目的扇区
static byte_sd  Stat_SDbuf;   //第二缓存状态标志(=0表示为空)

static byte_sd *pBuf_Now,*pBuf_2; //当前缓存与第二缓存指针
/*
注意：将数据存入第二缓冲的过程并不是将数据复制过去,
而是交换两个缓冲区的指针,从而可以大大加快程序执行速度
*/

#ifdef EN_Cnt_SDbuf
word_sd Cnt_SDbufS1,Cnt_SDbufS2,Cnt_SDbufS3,Cnt_SDbufS4,Cnt_SDbufS5;
/*缓存使用状况统计变量*/
/*
Cnt_SDbufS1:正常情况的数量(SD卡非忙,缓存为空)
Cnt_SDbufS2:SD卡非忙,缓存非空,且写入缓存后可继续写入新数据
Cnt_SDbufS3:SD卡非忙,缓存非空,但写入缓存后等待超时,不能继续写入新数据
Cnt_SDbufS4:SD卡忙,但缓存为空,可以将新数据存入缓存
Cnt_SDbufS5:SD卡忙,且缓存非空,只能干等
*/
#endif

/***********************************************************
* function:SD_WriteBlock_UserBuf
* description:sd卡双缓冲读写函数
************************************************************/
static byte_sd SD_WriteBlock_UserBuf(void)
{
  byte_sd r1=0,retry;
  byte_sd *pTmp;
  
  Wait_SDRdy(SD_SHORT_Wait);
  if(Flag_SDRdy == 0)
  { //SD卡忙
    if(Stat_SDbuf == 0)
    { //缓存为空
    //将数据先存入缓存(所谓存入就是交换两个缓存的指针)
      pTmp=pBuf_Now;
      pBuf_Now=pBuf_2;
      pBuf_2=pTmp;
      Sector_SDbuf=p_datasector;
      Stat_SDbuf=1; //置位缓存标志
#ifdef EN_Cnt_SDbuf      
      Cnt_SDbufS4++;
#endif
    }
    else
    { //缓存非空(最无语的情况,目前的算法没有办法优化)
    //缓存非空,只能干等  
      Wait_SDRdy(SD_LONG_Wait);
      retry=0;
      do //将缓存中存的数据写入SD卡
      {  
        r1=sd_writesingleblock(pBuf_2,Sector_SDbuf);
      } while(r1!=0 && (++retry)<3);
    //将数据再存入缓存
      pTmp=pBuf_Now;
      pBuf_Now=pBuf_2;
      pBuf_2=pTmp;
      Sector_SDbuf=p_datasector;
#ifdef EN_Cnt_SDbuf   
      Cnt_SDbufS5++;
#endif      
    }
  }
  else
  { //SD卡非忙
    if(Stat_SDbuf == 0)
    { //缓存为空(最理想的状况)
      retry=0;
      do //将数据写入SD卡
      {  
        r1=sd_writesingleblock(pBuf_Now,p_datasector);
      } while(r1!=0 && (++retry)<3);
#ifdef EN_Cnt_SDbuf      
      Cnt_SDbufS1++;
#endif
    }
    else
    { //缓存非空
      retry=0;
      do //将缓存中存的数据写入SD卡
      {  
        r1=sd_writesingleblock(pBuf_2,Sector_SDbuf);
      } while(r1!=0 && (++retry)<3);
     //写完缓存中数据进行极短时间的等待,根据等待后的结果判定是否写入新数据
      Wait_SDRdy(SD_VST_Wait);
      if(Flag_SDRdy == 0)
      { //SD卡忙
      //将数据再存入缓存
        pTmp=pBuf_Now;
        pBuf_Now=pBuf_2;
        pBuf_2=pTmp;
        Sector_SDbuf=p_datasector;
#ifdef EN_Cnt_SDbuf        
        Cnt_SDbufS3++;
#endif
      }
      else
      { //SD卡非忙
      //缓存终于解脱了,进入正常情况
        Stat_SDbuf=0; //清除缓存标志
        retry=0;
        do //将数据写入SD卡
        {  
          r1=sd_writesingleblock(pBuf_Now,p_datasector);
        } while(r1!=0 && (++retry)<3);
#ifdef EN_Cnt_SDbuf        
        Cnt_SDbufS2++;
#endif
      }
    }
  }
  
  return r1;
}
/***********************************************************
* function:SD_ClrBuf
* description:清空缓存中数据(将缓存中数据写入SD卡)
************************************************************/
static void SD_ClrBuf(void)
{
  byte_sd r1=0,retry=0;
  
  if(Stat_SDbuf != 0)
  {
    Wait_SDRdy(SD_LONG_Wait);
    do //将缓存中存的数据写入SD卡
    {  
      r1=sd_writesingleblock(pBuf_2,Sector_SDbuf);
    } while(r1!=0 && (++retry)<5);
    Stat_SDbuf=0; //清除缓存标志
  }
}

#endif

/*********************************************************/
//function:write_dir
//description:写根目录函数
//修改： Sword
/***********************************************************/
void write_dir(void)
{
  word_sd i=0,j,k,flag,retry=0;
  word_sd h_add,l_add,sum;
  word_sd addr=0,addh=0,max=0;
  byte_sd r1; 

  do     //看根目录的第一个单元(卷标)是否为空
   {
     r1=sd_readsingleblock(DBUF,add_dir);
     C_WDOG();
     retry++;
   } while(r1!=0x00&&retry<100);
  retry=0;
  
  if(DBUF[0]==0x00)   //如果根目录第一个单元为空则写入卷标
   {
     for(i=0;i<32;i++) DBUF[i]=dir_sd[i];
     while(sd_writesingleblock(DBUF,add_dir)&&retry<1000) //写卷标
      {                            
        C_WDOG(); //清开门狗 
        retry++;
      } 
   }
  
  for(i=0;i<sector_cluster;i++)
   { 
     do     //先读根目录再改写,从而保证不会更改原来的文件
      {
        r1=sd_readsingleblock(DBUF,add_dir+i);
        C_WDOG();
        retry++;
      } while(r1!=0x00&&retry<100);
     retry=0;
    
     for(k=0;k<512;k+=32)
      {
       
        if(addr==0&&addh==0&&DBUF[k]==0x00||DBUF[k]==0xE5) 
         { addh=i;addr=k; }  //寻找一个空白的32字节区间
       
        for(j=0,flag=1;j<5;j++)  //决策文件序号
          if(DBUF[k+j]!=file_name[j]) flag=0;
        if(flag)
         {
           if(DBUF[k+5]>'9'||DBUF[k+5]<'0') continue;
           if(DBUF[k+6]>'9'||DBUF[k+6]<'0') continue;
           if(DBUF[k+7]>'9'||DBUF[k+7]<'0') continue;
           sum=(DBUF[k+7]-'0')+(DBUF[k+6]-'0')*10+(DBUF[k+5]-'0')*100;
           if(sum>max) max=sum;
         }
      }
   }
  
  if(addh==0&&addr==0)
   {     //没有在根目录找到空闲位置
     CloseSD();
     return;
   }
  
  do     //先读根目录再改写,从而保证不会更改原来的文件
   {
     r1=sd_readsingleblock(DBUF,add_dir+addh);
     C_WDOG();
     retry++;
   } while(r1!=0x00&&retry<100);
  retry=0; 
   
  file_name[7]=(max+1)%10+'0';   //生成文件名
  file_name[6]=(max+1)/10%10+'0'; 
  file_name[5]=(max+1)/100+'0';

  h_add=(next_cluster[0]&0x00FF0000)>>16;
  l_add=next_cluster[0]&0x0000FFFF;   
  
  for(i=0,j=0;i<11;i++,j++)
   {
     DBUF[addr+i]=file_name[j];    //文件名
   }
  for(j=0;i<26;i++,j++)
   {
     DBUF[addr+i]=file_property[j];         //文件属性
   }
  DBUF[addr+26]=(byte_sd)(l_add&0x00FF);      //写入文件起始簇的低16位
  DBUF[addr+27]=(byte_sd)((l_add>>8)&0x00FF);  
    
  file_size=ram_number+(((dword_sd)(cnt_cluster*sector_cluster+p_sector))<<9L);
  if(ram_number!=0) file_size-=512; 
  DBUF[addr+28]=(byte_sd)(file_size&0x000000ff);        //文件大小
  DBUF[addr+29]=(byte_sd)((file_size&0x0000ff00)>>8);
  DBUF[addr+30]=(byte_sd)((file_size&0x00ff0000)>>16);
  DBUF[addr+31]=(byte_sd)((file_size&0xff000000)>>24);

  while(sd_writesingleblock(DBUF,add_dir+addh)&&retry<1000) //写根目录
   {
     C_WDOG(); //清开门狗 
     retry++;
   }
}
/***********************************************************************/
//function:write_fat
//description:写SD卡的fat1，fat2表(算法很复杂，须仔细思考分析)
//修改： Sword
/***********************************************************************/
void write_fat(void)
{
  dword_sd sector=0,cluster;        
  word_sd  i=0,p,retry=0,num,k,j;
  byte_sd  r1;
                                       
  num=cnt_cluster;
  if(p_sector!=0) num++;
  
  k=j=0;
  num_segcluster=(next_cluster[0]&0xFF000000)>>24;
  cluster=next_cluster[0]&0x00FFFFFF;
  
  for(i=0;i<num;i++)
   {
     if((cluster>>7)!=sector||i==0)
      { 
        if(i!=0) 
         {  //写fat表
           while(sd_writesingleblock(DBUF,add_f1+sector)&&(retry<1000))
            {
               C_WDOG(); //清开门狗 
               retry++;
            }
           retry=0;
           while(sd_writesingleblock(DBUF,add_f2+sector)&&(retry<1000)) 
            {
              C_WDOG(); //清开门狗 
              retry++;
            }
           retry=0;
         }
      
        sector=(cluster>>7);
        
        do     //先读再把用到的新簇改写,从而保证不会更改原来的文件
         {
           r1=sd_readsingleblock(DBUF,add_f1+sector);
           C_WDOG();
           retry++;
         } while(r1!=0x00&&retry<100);
        retry=0;
      }
     
     p=((cluster&0x007F)<<2);      //找到当前簇对应的FAT表的位置
     
     j++;        //找到下一个有用簇
     if(j==num_segcluster)
      {
        j=0;
        num_segcluster=(next_cluster[++k]&0xFF000000)>>24;
        cluster=next_cluster[k]&0x00FFFFFF; 
      }
     else
      {
        cluster++;
      }
     
     DBUF[p]=(byte_sd)(cluster&0x00FF); //写入文件的下一个簇
     DBUF[p+1]=(byte_sd)((cluster>>8)&0x00FF);
     DBUF[p+2]=(byte_sd)((cluster>>16)&0x00FF);
     
     if(i==(num-1))
      {
        DBUF[p]=0xff;
        DBUF[p+1]=0xff;
        DBUF[p+2]=0xff;
        DBUF[p+3]=0x0f;
        while(sd_writesingleblock(DBUF,add_f1+sector)&&(retry<1000))
         {
            C_WDOG(); //清开门狗 
            retry++;
         }
        retry=0;
        while(sd_writesingleblock(DBUF,add_f2+sector)&&(retry<1000)) 
         {
           C_WDOG(); //清开门狗 
           retry++;
         }
        retry=0;
      }
   }
}

/*********************************************************/
//function:writeram_sd
//description:写ram512字节数据到sd卡扇区函数
//修改： Sword
/***********************************************************/
void writeram_sd(void)
{
  word_sd retry=0;
#ifdef EN_SDbuf
  while(SD_WriteBlock_UserBuf()&&(retry<300)) 
   {
     C_WDOG(); //清开门狗 
     retry++;
   }
#else                  
  while(sd_writesingleblock(DBUF,p_datasector)&&(retry<300)) 
   {
     C_WDOG(); //清开门狗 
     retry++;
   }
#endif   
  if((++p_sector)==sector_cluster)  //写完一簇的处理
   {
     p_sector=0;
     p_cluster++;
     cnt_cluster++;
     if(p_cluster==num_segcluster)
      {       //如果一个簇组写完,将写入指针指向下一簇组的起始地址
        p_datasector=((dword_sd)((next_cluster[++p_segcluster]&0x00FFFFFF)-2))*sector_cluster+add_dir; 
        num_segcluster=(next_cluster[p_segcluster]&0xFF000000)>>24;
        p_cluster=0;
      }
     else
      {
        p_datasector++;
      }
   }
  else
   {
     p_datasector++;
   }
}
/*********************************************************/
//function:write_ram
//description:写字节数据到ram函数（主函数与fat32文件系统函数的接口）
//修改： Sword
/***********************************************************/
void writebyte_ram(byte_sd wdata)
{
  
  if(cnt_cluster<cluster_number)
   {
#ifdef EN_SDbuf
     pBuf_Now[ram_number]=wdata;
#else
     DBUF[ram_number]=wdata;
#endif     
     ram_number++;
     if(ram_number==512) 
      {
        ram_number=0;
        writeram_sd();
      }
   }
}
/*********************************************************/
//function:write_stop
//description:写SD卡结束，完成后续工作，即写FAT表与根目录
//修改： Sword
/*********************************************************/
void write_stop(void)
{
  if(cnt_cluster==0&&p_sector==0&&ram_number==0) 
  {
    return; //如果没有写过数据,则不写fat表和根目录
  }
   
   if(ram_number!=0) writeram_sd(); 
 //把最后不够一个完整扇区的数据写入
 
#ifdef EN_SDbuf
   SD_ClrBuf();
#endif
   
   write_dir();
   write_fat(); 

   Wait_SDRdy(SD_LONG_Wait);   //等待最后一个扇区数据写入SD卡

   CloseSD();//关闭SD卡  
}

/*
函数名称：search_addr_sd
函数功能：寻找sd卡启动扇区,根目录,数据扇区,fat1和fat2的首地址
编 写 者：Sword
*/
void search_addr_sd(void)
{
  word_sd  retry;
  byte_sd  r1,flag_yes=1;
  
  retry=0;
  do
   {  //读取第0物理扇区内容
     r1=sd_readsingleblock(DBUF,0);
     C_WDOG();
     retry++;
   } while(r1!=0x00&&retry<100);
 
  if(retry>=100) 
   {
     flag_err_sd=SDERR_ReadOverTime;
     flag_yes=0; //超时出错
   }
     
  if(DBUF[0]!=0xeb||DBUF[1]!=0x58||DBUF[2]!=0x90)   
 //通过第0物理扇区的前3字节是否是跳转指令来判定是不是启动扇区    
   {
     add_sta=DBUF[454]+((dword_sd)DBUF[455]<<8)+((dword_sd)DBUF[456]<<16)+((dword_sd)DBUF[457]<<24);
  //如果物理的第0扇区不是启动扇区,则由第454-457byte_sd来计算启动扇区的偏移量   
     retry=0;   
     do
      {  //读取启动扇区内容
        r1=sd_readsingleblock(DBUF,add_sta);
        C_WDOG();
        retry++;
      } while(r1!=0x00&&retry<100);
     
     if(retry>=100) 
      {
        flag_err_sd=SDERR_ReadOverTime;
        flag_yes=0; //超时出错
      }
     else if(DBUF[0]!=0xeb||DBUF[1]!=0x58||DBUF[2]!=0x90)
      {
        flag_err_sd=SDERR_StartSector;
        flag_yes=0; //启动扇区出错
      }
   }
  else
   {
     add_sta=0;
   }
  
  sector_cluster=DBUF[13];    //读取每簇对应的扇区数
  sector_sta=DBUF[14]+((dword_sd)DBUF[15]<<8);   //计算启动扇区数
  sector_fat=DBUF[36]+((dword_sd)DBUF[37]<<8)+((dword_sd)DBUF[38]<<16)+((dword_sd)DBUF[39]<<24);
 //计算fat表所占的扇区数 
    
 //计算根目录,数据扇区,fat1和fat2的首地址 
  add_f1=add_sta+sector_sta;
  add_f2=add_f1+sector_fat;
  add_dir=add_f2+sector_fat;
  
  if(flag_yes==0) CloseSD();
}
/*
函数名称：search_fat
函数功能：搜寻fat表,找到足够多的空闲扇区
编 写 者：Sword
*/
void search_fat(void)
{
  byte_sd retry,r1,num,flag,flag_over=0;
  dword_sd i,j,k;   
  
  for(i=k=num=flag=0,j=12;i<10000;i++,j=0)
   {    //最多寻找10000个扇区
//10000个扇区对应约1280000个簇,按一簇4K算,则为5G的空间
     retry=0;
     do
      {
        r1=sd_readsingleblock(DBUF,add_f1+i);
        C_WDOG();
        retry++;
      } while(r1!=0x00&&retry<100);
     
     if(retry>=100) 
      {
        flag_err_sd=SDERR_ReadOverTime;
        break; //超时出错
      }
     for(;j<512;j+=4)
      {
        if(DBUF[j]==0x00&&DBUF[j+1]==0x00&&DBUF[j+2]==0x00&&DBUF[j+3]==0x00) 
         {       //标记可用簇
           if(flag==0)
            {         //一段可用簇的第一个
              next_cluster[k]=((i<<7)+(j>>2));
              num=flag=1;
            }
           else
            {     //记录该段簇的个数
              num++;
              if(num==250)
               {       //防止一段簇太长变量溢出
                 next_cluster[k]|=(((dword_sd)num)<<24L);
                 k++;flag=0;
               }
            }
           cluster_number++; 
         }
        else
         {
           if(flag==1)
            {       //将指针指向下一组簇
              next_cluster[k]|=(((dword_sd)num)<<24L);
              k++;
            }
           flag=0;
         }
        if(cluster_number==SD_MAX_cluster||k==SD_MAX_segment) 
         {  //已找到足够多的可用簇或数组存满
           if(cluster_number==SD_MAX_cluster)
            {
              next_cluster[k]|=(((dword_sd)num)<<24L);
            }
           flag_over=1;
           break;
         } 
      }
     
     if(flag_over) break; 
   }
  if(cluster_number<SD_MAX_cluster) 
   {
     if(flag_err_sd!=SDERR_ReadOverTime)
       flag_err_sd=SDERR_NoCluster;
     if(cluster_number==0||flag_err_sd==SDERR_ReadOverTime)
      { //如果簇数不够但并不是一个簇都没找到的话则继续写卡
        CloseSD(); //没有找到有用簇或读取超时则关闭SPI 
      }
   }
}
/*
函数名称：fat32_init
函数功能：fat32文件系统的初始化
编 写 者：Sword
*/
void fat32_init(void)
{
  search_addr_sd();
  if(sd_yes)
   {
     SetSD_High();
     search_fat(); 
  
     if(sd_yes==1)
      {
        p_datasector=add_dir+((dword_sd)((next_cluster[0]&0x00FFFFFF)-2))*sector_cluster; 
      //注意,数据区是从第二簇开始的,所以要减2  
        p_sector=0;
        ram_number=cnt_cluster=0;
        p_segcluster=p_cluster=0;
        num_segcluster=(next_cluster[0]&0xFF000000)>>24;
      }
   }
}
/*
函数名称：SD_System_Init
函数功能：SD卡即整个文件系统的初始化
          (主函数中直接调用该函数就可完成对SD卡全部的初始化工作)
编 写 者：Sword
*/
void SD_System_Init(void)
{
  byte_sd retry=10;

  sd_yes=1;      //默认SD卡已就绪,如果出问题,后面执行CloseSD()时会清零该变量
  Flag_SDRdy=1;  //将SD卡的状态标记为可用
  flag_err_sd=SD_Normal;
  SD_driver_Init();
  SetSD_Low();
  while(sd_init()&&retry!=0) 
   {
     retry--;
     C_WDOG();
   }

  if(retry==0)         //如果sd卡初始化超时不成功，则关闭spi 
   {
     CloseSD();
   }
  else          
   {
     flag_err_sd=SD_Normal;
     fat32_init(); //文件系统的初始化
     
   #ifdef EN_SDbuf   //初始化第二缓存
   #ifdef EN_Cnt_SDbuf  
     Cnt_SDbufS1=0;
     Cnt_SDbufS2=0;
     Cnt_SDbufS3=0;
     Cnt_SDbufS4=0;
     Cnt_SDbufS5=0;
   #endif
     Stat_SDbuf=0;
     pBuf_Now=DBUF; //设定缓存指针的初始值
     pBuf_2=DBUF2;
   #endif
   }
  
  sd_initover = 1;
}
/*
函数名称：SD_System_Init_Ext
函数功能：扩展版的SD卡系统初始化函数
          (允许在初始化时预先写入部分数据)
入口参数：pbuf:初始数据指针
         len:数据长度
编 写 者：Sword
*/
void SD_System_Init_Ext(byte_sd * pbuf , word_sd len)
{
	word_sd i;
	
	SD_System_Init();
	
	if(sd_yes != 0)
	{
		sd_initover = 0;
		
		for(i=0;i<len;i++)
		{
			writebyte_ram(*pbuf++);
		}
		
		sd_initover = 1;
	}
}
/*
函数名称：test_sd
函数功能：测试SD卡
编 写 者：Sword
*/
void test_sd(void)
{
  byte_sd const str[]="If you see these words, you SD and hardware is OK!";
  word_sd i;
  if(sd_yes)
   { 
     file_name[0]='T';
     file_name[1]='E';
     file_name[2]='S';
     file_name[3]='T';
     file_name[4]='-';
     
     for(i=0;str[i]!='\0';i++)
       writebyte_ram(str[i]);
            
     write_stop();
   }
}

#endif
