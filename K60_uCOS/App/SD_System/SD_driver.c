/******************************************************************************

* SD_driver.c

* sd卡的底层驱动文件   

* 第一作者：  纪成   (第四届摄像头)
  完善与整理：孙文健 (第六届摄像头)
* 版本：V1.15 (与V1.13、v1.14版相兼容,不使能双缓存时与V1.10之后的版本相兼容)
* 版本更新时间：2012年1月30日
  
* 主控芯片：MK10N512VMD100
  开发平台：CodeWarrior 10.1

* (!!!更改硬件平台后必须修改!!!)                
 
******************************************************************************/

#include "./SD_System.h"
                                  
#if EN_SDCard != 0                 
 
byte_sd sd_initover = 0; /* SD卡初始化结束标志 */

byte_sd sd_yes=0;  //判断是否用SD卡(没有为0，有为1)
byte_sd flag_sdhc; //sdhc卡标志,=1有效         /************By Sword************/ 
byte_sd flag_test_sd; //调试使用               /************By Sword************/ 
byte_sd flag_err_sd;  //SD出错标志             /************By Sword************/ 
byte_sd Flag_SDRdy;    //SD卡就绪标志(=1表SD卡就绪)

/*内部变量*/
static byte_sd resp_sd[4];                     /************By Sword************/ 

/**************************内部函数定义**************************/
#if DELAY_WaitRead_SD != 0
/**********************************************************
* function:SD_Delay_ReadByte
* description:读取1Byte数据之后的延时,延时时间在SD_driver.h
*             中定义。
**********************************************************/
static void SD_Delay_ReadByte(void)
{
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");

#if DELAY_WaitRead_SD > 1
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif
	
#if DELAY_WaitRead_SD > 2
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif
	
#if DELAY_WaitRead_SD > 3
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif
	
#if DELAY_WaitRead_SD > 4
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif
	
#if DELAY_WaitRead_SD > 5
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif	

#if DELAY_WaitRead_SD > 6
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif
	
#if DELAY_WaitRead_SD > 7
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif
	
#if DELAY_WaitRead_SD > 8
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif
	
#if DELAY_WaitRead_SD > 9
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif
	
#if DELAY_WaitRead_SD > 10
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif	
}
#endif
/**********************************************************
* function:SD_WriteByte
* description:写入1Byte数据（查询方式）
**********************************************************/
static void SD_WriteByte(byte_sd jc_data) 
{	
	SPI1_SR |= SPI_SR_EOQF_MASK;
	SPI1_MCR &= (~SPI_MCR_HALT_MASK) & (~SPI_MCR_MDIS_MASK);   /* 进入RUNNING状态 */
	
	SPI1_PUSHR = SPI_PUSHR_CTAS(0) | SPI_PUSHR_EOQ_MASK | SPI_PUSHR_CTCNT_MASK | jc_data;
	                                                           /* 写入数据并清空计数寄存器 */ 
	                                                           /* 置位EOQ表示该数据是队列中最后一个,即使能发送 */
	
	while((SPI1_SR & SPI_SR_TCF_MASK) == 0);	
	SPI1_SR |= SPI_SR_TCF_MASK;
	
	SPI1_MCR |= SPI_MCR_CLR_TXF_MASK | SPI_MCR_CLR_RXF_MASK;   /* 清空队列(这句很重要) */
}
/**********************************************************
* function:SD_ReadByte
* description:读出1Byte数据（查询方式）
**********************************************************/
static byte_sd SD_ReadByte(byte_sd jc_data)
{	
	byte_sd dat;
	
	SPI1_SR |= SPI_SR_EOQF_MASK;
	SPI1_MCR &= (~SPI_MCR_HALT_MASK) & (~SPI_MCR_MDIS_MASK);   /* 进入RUNNING状态 */
		
	SPI1_PUSHR = SPI_PUSHR_CTAS(0) | SPI_PUSHR_EOQ_MASK |SPI_PUSHR_CTCNT_MASK | jc_data;
		
	while((SPI1_SR & SPI_SR_TCF_MASK) == 0);
	SPI1_SR |= SPI_SR_TCF_MASK;
	
#if DELAY_WaitRead_SD != 0	
	SD_Delay_ReadByte();
#endif	
		
	dat = (byte_sd)SPI1_POPR;
	
	SPI1_MCR |= SPI_MCR_CLR_TXF_MASK | SPI_MCR_CLR_RXF_MASK;
	
	return dat;
}


/*
函数名称：close_SD
函数功能：关闭SD卡(关闭物理总线的同时清零sd可用标志变量sd_yes)
编 写 者：Sword
*/
void CloseSD(void)
{
  sd_yes = 0;
  OFF_SD_CS;
  SIM_SCGC6 &= ~SIM_SCGC6_SPI1_MASK;              /* 关闭SPI1时钟 */
}
/*
函数功能：SetSD_Low
函数名称：设定总线为低速(约为230kHz)
编 写 者：Sword
*/
void SetSD_Low(void)
{
	SPI1_CTAR0 &= (~SPI_CTAR_DBR_MASK) & (~SPI_CTAR_BR_MASK) & (~SPI_CTAR_PBR_MASK);
	SPI1_CTAR0 |= SPI_CTAR_BR(7) | SPI_CTAR_PBR(0);
	/* DBR = 0, BR = 128, PBR = 2 ; f = f(bus)/PBR * [(1+DBR)/BR] */
}
/*
函数功能：SetSD_High
函数名称：设定总线为高速(约为15MHz)
编 写 者：Sword
*/
void SetSD_High(void)
{
	SPI1_CTAR0 &= (~SPI_CTAR_DBR_MASK) & (~SPI_CTAR_BR_MASK) & (~SPI_CTAR_PBR_MASK);
  SPI1_CTAR0 |= SPI_CTAR_BR(0) | SPI_CTAR_PBR(0);
	/* DBR = 0, BR = 2, PBR = 2 ; f = f(bus)/PBR * [(1+DBR)/BR] */
}
/*
函数名称：SD_driver_Init
函数功能：SD卡的硬件初始化
编 写 者：Sword
*/
void SD_driver_Init(void)
{ 
	SIM_SCGC6 |= SIM_SCGC6_SPI1_MASK;              /* 使能SPI1时钟 */
	
	PORTE_PCR0 = PORT_PCR_MUX(2) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
	PORTE_PCR1 = PORT_PCR_MUX(2) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
	PORTE_PCR2 = PORT_PCR_MUX(2) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
	PORTE_PCR3 = PORT_PCR_MUX(2) | PORT_PCR_PE_MASK;
	                                               /* 将PE0-PE3设为SPI功能,PTE0-2使能上拉电阻,PTE3为下拉电阻 */
	PORTE_PCR5 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
	GPIOE_PDDR |= (1<<5);                          /* 将PE5设为普通IO,控制CS */
	OFF_SD_CS;
	
	SPI1_MCR |= SPI_MCR_MSTR_MASK | SPI_MCR_PCSIS(0x1F);                 
	                                               /* 设置为SPI主机,CS的无效状态为高电平 */
	
	SPI1_RSER |= SPI_RSER_TCF_RE_MASK | SPI_RSER_EOQF_RE_MASK;
	
	SPI1_CTAR0 = SPI_CTAR_FMSZ(7);                 
	                                               /* 设置一帧传送8bit */
}
/**********************************************************
* function:Wait_SDRdy
* description:等待SD卡就绪(当向SD卡写入数据时SD卡进入忙状态)
* Input:等待时限
**********************************************************/
void Wait_SDRdy(dword_sd Limit)
{
  dword_sd retry=0;
  while(Flag_SDRdy==0 && (++retry)<Limit) 
  {
    C_WDOG();
    if(SD_ReadByte(0xff)!=0)
    {
      Flag_SDRdy=1;
      break;
    }
  }
}
/*********************************************************/
//function:jc_sd_cmd
//description:给SD卡发送命令
//input: 48个字节，前8位为CMD指令，接着32位为地址参数，
//       最后8位为CRC校验（该模式在SPI模式下无效）
/***********************************************************/
byte_sd jc_sd_cmd(byte_sd cmd,dword_sd arg,byte_sd crc)
{
  byte_sd r1,i;
  word_sd retry=0;

  if(Flag_SDRdy == 0)
  {
    Wait_SDRdy(SD_LONG_Wait);
    OFF_SD_CS;
  }
 
  SD_WriteByte(0xff);
  ON_SD_CS;
  SD_WriteByte(0xff);
  SD_WriteByte(cmd|0x40);
  if(flag_sdhc==0)      /************By Sword************/  
    arg=arg << 9;  //对于非sdhc的sd卡,、地址是以字节为单位的
//兼容sdhc和sd1.0的设置   
  SD_WriteByte((byte_sd)((arg>>24)&0x0000FF)); //传送32位地址
  SD_WriteByte((byte_sd)((arg>>16)&0x0000FF));
  SD_WriteByte((byte_sd)((arg>>8)&0x0000FF));
  SD_WriteByte((byte_sd)(arg&0x0000FF));
  SD_WriteByte(crc); 
  do
  {
  	r1=SD_ReadByte(0xff);
    retry++;
    C_WDOG(); //清开门狗 
    if(retry==250) 
    {
      retry=0;
      break;
    }
       
  }while(r1==0xff);
  if(cmd==8||cmd==58)   /************By Sword************/  
    for(i=0;i<4;i++) resp_sd[i]=SD_ReadByte(0xff);   
//读取sdhc卡的相关信息 
  OFF_SD_CS;
  SD_WriteByte(0xff);
  return(r1);
}
/*********************************************************/
//function: sd_init
//description:sd卡初始化函数
/***********************************************************/
byte_sd sd_init(void)
{
  byte_sd i=0,r1=0;
  word_sd retry=0;
  for(i=0;i<15;i++)
    SD_WriteByte(0xFF);//等待74个时钟周期，sd工作电压升至正常值

  flag_sdhc=1; //先默认为sdhc卡
  
  do
   {
      //发送CMD0，让SD卡进入IDLE状态
      r1 = jc_sd_cmd(0,0,0x95);
      retry++;
      C_WDOG(); //清开门狗
   } while ((r1 != 0x01) && (retry < 100));
  if (retry==100) 
   {          //发送CMD0出错
     flag_err_sd=SDERR_CMD0;
     return 1; 
   }
  retry=0;
 
  //初步确认是SDHC还是SD1.0
  r1=jc_sd_cmd(8,0x1aa,0x87);
  if(r1!=0x01||resp_sd[2]!=1||resp_sd[3]!=170) flag_sdhc=0;
 /************By Sword************/ 
   
  retry=0;
  //发送cmd55+acmd41使sd卡工作在spi模式
  do
   {
      r1=jc_sd_cmd(55,0,0xff);
      if(r1==0x01)
        r1=jc_sd_cmd(41,((dword_sd)flag_sdhc)<<30,0xff);
      retry++;
      C_WDOG(); //清开门狗 
   } while ((r1 != 0x00) && (retry < 100));
  
  if(retry>=100)
   {       //发送ACMD41指令时出错
     flag_err_sd=SDERR_ACMD41; 
     return 1;
   }
   
  if(flag_sdhc) 
   {
     (void)jc_sd_cmd(58,0,0xff);      //最终确认是否是sdhc卡
     if((resp_sd[0]&0x40)==0) flag_sdhc=0; 
   }
 /************By Sword************/   

  return 0;
}
/*********************************************************/
//function:sd_rdata
//description:从sd卡读取指定长度数据
/***********************************************************/
byte_sd sd_rdata(byte_sd * data,word_sd len)
{
  byte_sd r1=0;
  word_sd retry=0;
  /************By Sword************/  
 //原先retry为byte_sd型  
  ON_SD_CS;
  do
  {
    r1=SD_ReadByte(0xff);
    retry++;
  }while(r1!=0xfe&&retry<500);
  if(retry>=500) return r1;
/************By Sword************/  
 //原先为retry<200，小于200的时间太短,很多低端的卡读不出来
 //！！！！！！！！！！！  
  retry=0;
  while(len--)
  {
  	C_WDOG(); //清开门狗 
    *data=SD_ReadByte(0xff);
    data++;
  }
  SD_WriteByte(0xff);    //这两句是读伪指令
  SD_WriteByte(0xff);
  OFF_SD_CS;
  SD_WriteByte(0xff);
  return 0;
}
/*********************************************************/
//function:sd_readsingleblock
//description:sd卡读取单块数据（一般为512字节）
//input: data   存放数据的数组首地址
//       sector 扇区号（注意为物理扇区号！！）
/***********************************************************/
byte_sd sd_readsingleblock(byte_sd * data,dword_sd sector)
{
   byte_sd r1=0;
   word_sd retry=0;
   
   if(Flag_SDRdy == 0)
   {
     Wait_SDRdy(SD_LONG_Wait);
     OFF_SD_CS;
   }
   
 /************By Sword************/  
 //原先retry为byte_sd型  
   do
   {
    r1=jc_sd_cmd(17,sector,0);
    retry++;
   } while(r1!=0&&retry<200);
   if(retry>=200) return r1;
 /************By Sword************/  
 //BUG！！！！，原来是r1==200 ！！！ 
   retry=0;
   r1=sd_rdata(data,512);
   if(r1!=0) return r1;
   else return 0; 
} 
/*********************************************************/
//function:sd_writesingleblock
//description:sd卡写单块数据
//input:预留ram区的指针，扇区号（注意为物理扇区号）
/***********************************************************/
byte_sd sd_writesingleblock(byte_sd *data,dword_sd sector)
{
	byte_sd r1=0,retry=0;
	dword_sd i=0;
  
  if(Flag_SDRdy == 0)
  {
    Wait_SDRdy(SD_LONG_Wait);
    OFF_SD_CS;
  }
  
  r1=jc_sd_cmd(24,sector,0);
  
  if(r1!=0) return r1;
  ON_SD_CS;
  SD_WriteByte(0xff);//先发三个空数据等待sd卡准备好
  SD_WriteByte(0xff);
  SD_WriteByte(0xff);
  SD_WriteByte(0xfe);//发送起始令牌
  for(i=0;i<512;i++)
  {
    C_WDOG(); //清开门狗 
    SD_WriteByte(*data++);
  } 
    
  SD_WriteByte(0xff);
  SD_WriteByte(0xff);
  r1=SD_ReadByte(0xff);
  if((r1&0x1f)!=0x05) 
  {
    OFF_SD_CS;
    return (r1 | 0);
  }
  else
  { //发送完数据后并不等待SD卡写好,而是在下一次写数据时再等待
    Flag_SDRdy=0;
    return 0; 
  }
}

#endif    
