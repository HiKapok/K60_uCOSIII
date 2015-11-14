/************************************************************************************************

* OLED.c

* 使用OLED模块进行调试硬件支持模块
  
* 主控芯片：MK10DN512VLL10
  开发平台：IAR Embedded Workbench 6.3
  
* 作者： 王昌安  (第十届摄像头)  

************************************************************************************************/
#include "./OLED.h"
#include "../TypeAdapter/TypeAdapter.h"
#include <stdlib.h>
#include <string.h>

t_OLED_GRAM ptrDisplay_GRAM = NULL;
INT8U OLED_Mask=0;//默认不屏蔽液晶
INT8U OLED_IsLowPwr=0;//默认开启液晶显示
void * const DataMap[PARAM_SHOW_LENGTH][3] = 
{
  {"sdbus",&OLED_Mask,(void *)Type_INT8U},
  {"MAXspeed",&OLED_Mask,(void *)Type_INT8U},
  {"MAXspeed",&OLED_Mask,(void *)Type_INT8U},
  {"MAXspeed",&OLED_Mask,(void *)Type_INT8U},
  {"MAXspeed",&OLED_Mask,(void *)Type_INT8U},
};
ParamSt stDataMap[PARAM_SHOW_LENGTH];

//常用ASCII表
//偏移量32
//ASCII字符集
//偏移量32
//大小:12*6
const unsigned char ASCII_0608[][6]={
   {0x00, 0x00, 0x00, 0x00, 0x00, 0x00} // 20
  ,{0x00, 0x00, 0x00, 0x5f, 0x00, 0x00} // 21 !
  ,{0x00, 0x00, 0x07, 0x00, 0x07, 0x00} // 22 "
  ,{0x00, 0x14, 0x7f, 0x14, 0x7f, 0x14} // 23 #
  ,{0x00, 0x24, 0x2a, 0x7f, 0x2a, 0x12} // 24 $
  ,{0x00, 0x23, 0x13, 0x08, 0x64, 0x62} // 25 %
  ,{0x00, 0x36, 0x49, 0x55, 0x22, 0x50} // 26 &
  ,{0x00, 0x00, 0x05, 0x03, 0x00, 0x00} // 27 '
  ,{0x00, 0x00, 0x1c, 0x22, 0x41, 0x00} // 28 (
  ,{0x00, 0x00, 0x41, 0x22, 0x1c, 0x00} // 29 )
  ,{0x00, 0x14, 0x08, 0x3e, 0x08, 0x14} // 2a *
  ,{0x00, 0x08, 0x08, 0x3e, 0x08, 0x08} // 2b +
  ,{0x00, 0x00, 0x50, 0x30, 0x00, 0x00} // 2c ,
  ,{0x00, 0x08, 0x08, 0x08, 0x08, 0x08} // 2d -
  ,{0x00, 0x00, 0x60, 0x60, 0x00, 0x00} // 2e .
  ,{0x00, 0x20, 0x10, 0x08, 0x04, 0x02} // 2f /
  ,{0x00, 0x3e, 0x51, 0x49, 0x45, 0x3e} // 30 0
  ,{0x00, 0x00, 0x42, 0x7f, 0x40, 0x00} // 31 1
  ,{0x00, 0x42, 0x61, 0x51, 0x49, 0x46} // 32 2
  ,{0x00, 0x21, 0x41, 0x45, 0x4b, 0x31} // 33 3
  ,{0x00, 0x18, 0x14, 0x12, 0x7f, 0x10} // 34 4
  ,{0x00, 0x27, 0x45, 0x45, 0x45, 0x39} // 35 5
  ,{0x00, 0x3c, 0x4a, 0x49, 0x49, 0x30} // 36 6
  ,{0x00, 0x01, 0x71, 0x09, 0x05, 0x03} // 37 7
  ,{0x00, 0x36, 0x49, 0x49, 0x49, 0x36} // 38 8
  ,{0x00, 0x06, 0x49, 0x49, 0x29, 0x1e} // 39 9
  ,{0x00, 0x00, 0x36, 0x36, 0x00, 0x00} // 3a :
  ,{0x00, 0x00, 0x56, 0x36, 0x00, 0x00} // 3b ;
  ,{0x00, 0x08, 0x14, 0x22, 0x41, 0x00} // 3c <
  ,{0x00, 0x14, 0x14, 0x14, 0x14, 0x14} // 3d =
  ,{0x00, 0x00, 0x41, 0x22, 0x14, 0x08} // 3e >
  ,{0x00, 0x02, 0x01, 0x51, 0x09, 0x06} // 3f ?
  ,{0x00, 0x32, 0x49, 0x79, 0x41, 0x3e} // 40 @
  ,{0x00, 0x7e, 0x11, 0x11, 0x11, 0x7e} // 41 A
  ,{0x00, 0x7f, 0x49, 0x49, 0x49, 0x36} // 42 B
  ,{0x00, 0x3e, 0x41, 0x41, 0x41, 0x22} // 43 C
  ,{0x00, 0x7f, 0x41, 0x41, 0x22, 0x1c} // 44 D
  ,{0x00, 0x7f, 0x49, 0x49, 0x49, 0x41} // 45 E
  ,{0x00, 0x7f, 0x09, 0x09, 0x09, 0x01} // 46 F
  ,{0x00, 0x3e, 0x41, 0x49, 0x49, 0x7a} // 47 G
  ,{0x00, 0x7f, 0x08, 0x08, 0x08, 0x7f} // 48 H
  ,{0x00, 0x00, 0x41, 0x7f, 0x41, 0x00} // 49 I
  ,{0x00, 0x20, 0x40, 0x41, 0x3f, 0x01} // 4a J
  ,{0x00, 0x7f, 0x08, 0x14, 0x22, 0x41} // 4b K
  ,{0x00, 0x7f, 0x40, 0x40, 0x40, 0x40} // 4c L
  ,{0x00, 0x7f, 0x02, 0x0c, 0x02, 0x7f} // 4d M
  ,{0x00, 0x7f, 0x04, 0x08, 0x10, 0x7f} // 4e N
  ,{0x00, 0x3e, 0x41, 0x41, 0x41, 0x3e} // 4f O
  ,{0x00, 0x7f, 0x09, 0x09, 0x09, 0x06} // 50 P
  ,{0x00, 0x3e, 0x41, 0x51, 0x21, 0x5e} // 51 Q
  ,{0x00, 0x7f, 0x09, 0x19, 0x29, 0x46} // 52 R
  ,{0x00, 0x46, 0x49, 0x49, 0x49, 0x31} // 53 S
  ,{0x00, 0x01, 0x01, 0x7f, 0x01, 0x01} // 54 T
  ,{0x00, 0x3f, 0x40, 0x40, 0x40, 0x3f} // 55 U
  ,{0x00, 0x1f, 0x20, 0x40, 0x20, 0x1f} // 56 V
  ,{0x00, 0x3f, 0x40, 0x38, 0x40, 0x3f} // 57 W
  ,{0x00, 0x63, 0x14, 0x08, 0x14, 0x63} // 58 X
  ,{0x00, 0x07, 0x08, 0x70, 0x08, 0x07} // 59 Y
  ,{0x00, 0x61, 0x51, 0x49, 0x45, 0x43} // 5a Z
  ,{0x00, 0x00, 0x7f, 0x41, 0x41, 0x00} // 5b [
  ,{0x00, 0x02, 0x04, 0x08, 0x10, 0x20} // 5c \//
  ,{0x00, 0x00, 0x41, 0x41, 0x7f, 0x00} // 5d ]
  ,{0x00, 0x04, 0x02, 0x01, 0x02, 0x04} // 5e ^
  ,{0x00, 0x40, 0x40, 0x40, 0x40, 0x40} // 5f _
  ,{0x00, 0x00, 0x01, 0x02, 0x04, 0x00} // 60 `
  ,{0x00, 0x20, 0x54, 0x54, 0x54, 0x78} // 61 a
  ,{0x00, 0x7f, 0x48, 0x44, 0x44, 0x38} // 62 b
  ,{0x00, 0x38, 0x44, 0x44, 0x44, 0x20} // 63 c
  ,{0x00, 0x38, 0x44, 0x44, 0x48, 0x7f} // 64 d
  ,{0x00, 0x38, 0x54, 0x54, 0x54, 0x18} // 65 e
  ,{0x00, 0x08, 0x7e, 0x09, 0x01, 0x02} // 66 f
  ,{0x00, 0x0c, 0x52, 0x52, 0x52, 0x3e} // 67 g
  ,{0x00, 0x7f, 0x08, 0x04, 0x04, 0x78} // 68 h
  ,{0x00, 0x00, 0x44, 0x7d, 0x40, 0x00} // 69 i
  ,{0x00, 0x20, 0x40, 0x44, 0x3d, 0x00} // 6a j
  ,{0x00, 0x7f, 0x10, 0x28, 0x44, 0x00} // 6b k
  ,{0x00, 0x00, 0x41, 0x7f, 0x40, 0x00} // 6c l
  ,{0x00, 0x7c, 0x04, 0x18, 0x04, 0x78} // 6d m
  ,{0x00, 0x7c, 0x08, 0x04, 0x04, 0x78} // 6e n
  ,{0x00, 0x38, 0x44, 0x44, 0x44, 0x38} // 6f o
  ,{0x00, 0x7c, 0x14, 0x14, 0x14, 0x08} // 70 p
  ,{0x00, 0x08, 0x14, 0x14, 0x18, 0x7c} // 71 q
  ,{0x00, 0x7c, 0x08, 0x04, 0x04, 0x08} // 72 r
  ,{0x00, 0x48, 0x54, 0x54, 0x54, 0x20} // 73 s
  ,{0x00, 0x04, 0x3f, 0x44, 0x40, 0x20} // 74 t
  ,{0x00, 0x3c, 0x40, 0x40, 0x20, 0x7c} // 75 u
  ,{0x00, 0x1c, 0x20, 0x40, 0x20, 0x1c} // 76 v
  ,{0x00, 0x3c, 0x40, 0x30, 0x40, 0x3c} // 77 w
  ,{0x00, 0x44, 0x28, 0x10, 0x28, 0x44} // 78 x
  ,{0x00, 0x0c, 0x50, 0x50, 0x50, 0x3c} // 79 y
  ,{0x00, 0x44, 0x64, 0x54, 0x4c, 0x44} // 7a z
  ,{0x00, 0x00, 0x08, 0x36, 0x41, 0x00} // 7b {
  ,{0x00, 0x00, 0x00, 0x7f, 0x00, 0x00} // 7c |
  ,{0x00, 0x00, 0x41, 0x36, 0x08, 0x00} // 7d }
  ,{0x00, 0x10, 0x08, 0x08, 0x10, 0x08} // 7e ~
  ,{0x00, 0x78, 0x46, 0x41, 0x46, 0x78} // 7f (delete)
};


static void OLED_IO_Init()
{ 
  //Never modify this function!  
  ((OLED_PORT_SCL)->PCR[OLED_INDEX_SCL]) = PORT_PCR_MUX(1);
  ((OLED_PORT_SDA)->PCR[OLED_INDEX_SDA]) = PORT_PCR_MUX(1);
  ((OLED_PORT_DC)->PCR[OLED_INDEX_DC])   = PORT_PCR_MUX(1);
  ((OLED_PORT_RST)->PCR[OLED_INDEX_RST]) = PORT_PCR_MUX(1);
    
  OLED_PT_SCL->PDDR |= (1<<OLED_INDEX_SCL);
  OLED_PT_SDA->PDDR |= (1<<OLED_INDEX_SDA);
  OLED_PT_DC->PDDR  |= (1<<OLED_INDEX_DC);
  OLED_PT_RST->PDDR |= (1<<OLED_INDEX_RST);
}

static void OLED_ReqGram(void)
{
  ptrDisplay_GRAM = (t_OLED_GRAM) malloc (8 * sizeof(t_OLED_GRAM));
}

static void OLED_FreeRam()
{
  if(NULL != ptrDisplay_GRAM){ free(ptrDisplay_GRAM); }
  ptrDisplay_GRAM = NULL;
  for(INT8U index = 0;index < PARAM_SHOW_LENGTH;++index)
  {
    if(NULL != stDataMap[index].lpstr)
      free(stDataMap[index].lpstr);
    stDataMap[index].lpstr = NULL;
  }
}
/*****************************************************************************
 函 数 名  : OLED_Write_Byte
 功能描述  : 向OLED写数据或者命令
 输入参数  : Dat待写入，Opt数据命令选择（0命令，1数据） 
 输出参数  : NONE
 返 回 值  : NONE
*****************************************************************************/
static void OLED_Write_Byte(INT8U Dat,INT8U Opt)
{
    INT8U index=8;
    
    if(Opt) OLED_DCH;
    else OLED_DCL;  
    OLED_SCLL;
    
    while (index--)
    {
        if(Dat&0x80){ OLED_SDAH; }
        else{ OLED_SDAL; }
        OLED_SCLH;
        asm("nop");
        OLED_SCLL;    
        Dat <<= 1;    
    }
}

//更新显存到LCD		 
void OLED_Refresh_Gram(void)
{
    INT8U i,n;		    
    for(i=0;i<8;i++)  
    {  
        OLED_Write_Byte(0xB0+i,OLED_CMD);    //设置页地址（0~7）
        OLED_Write_Byte(0x00,OLED_CMD);      //设置显示位置-列低地址
        OLED_Write_Byte(0x10,OLED_CMD);      //设置显示位置-列高地址   
        for(n=0;n<132;n++)
          OLED_Write_Byte(ptrDisplay_GRAM[n][i],OLED_DATA);
    }   
}
//更新某一行显存到LCD		 
void OLED_Refresh_SeleteGram(INT8U id)
{
  OLED_Write_Byte(0xB0+id,OLED_CMD);    //设置页地址（0~7）
  OLED_Write_Byte(0x00,OLED_CMD);      //设置显示位置-列低地址
  OLED_Write_Byte(0x10,OLED_CMD);      //设置显示位置-列高地址   
  for(INT8U n=0;n<132;n++)
    OLED_Write_Byte(ptrDisplay_GRAM[n][id],OLED_DATA); 
}
/*****************************************************************************
 函 数 名  : OLED_SetPos
 功能描述  : 设置显示坐标
 输入参数  : INT8U X  
             INT8U Y  
 输出参数  : NONE
 返 回 值  : NONE
*****************************************************************************/
//0xb0+0~7表示页0~7
//0x00+0~16表示将128列分成16组其地址在某组中的第几列
//0x10+0~16表示将128列分成16组其地址所在第几组
static void OLED_SetPos(INT8U X, INT8U Y)
{ 
    OLED_Write_Byte(0xB0+Y,OLED_CMD);
    OLED_Write_Byte(((X&0xF0)>>4)|0x10,OLED_CMD);
    OLED_Write_Byte((X&0x0F)|0x00,OLED_CMD); 
} 
static void OLED_RST(void)
{
    OLED_SCLH;      
    OLED_RSTL;
    //从上电到下面开始初始化要有足够的时间，即等待IC复位完毕      
    for(INT16U i=0;i<1000;++i){ asm("nop"); } 
    OLED_RSTH;
}

/*****************************************************************************
 函 数 名  : OLED_ChipInit
 功能描述  : OLED初始化
 输入参数  : void  
 输出参数  : NONE
 返 回 值  : NONE
*****************************************************************************/
static void OLED_ChipInit(void)        
{
    OLED_Write_Byte(0xAE,OLED_CMD); //关闭显示
    OLED_Write_Byte(0xD5,OLED_CMD); //设置时钟分频因子,震荡频率
    OLED_Write_Byte(0x80,OLED_CMD); //[3:0],分频因子;[7:4],震荡频率
    OLED_Write_Byte(0xA8,OLED_CMD); //设置驱动路数
    OLED_Write_Byte(0x3F,OLED_CMD); //默认0x3F(1-64)63
    OLED_Write_Byte(0xD3,OLED_CMD); //设置显示偏移(即在设定的基础上自动加上一定的偏移量,专指行地址的偏移，对列地址无影响)
    OLED_Write_Byte(0x00,OLED_CMD); //默认为0
    OLED_Write_Byte(0x40,OLED_CMD); //设置显示开始行[5:0],行数.
    OLED_Write_Byte(0x8D,OLED_CMD); //电荷泵设置
    OLED_Write_Byte(0x14,OLED_CMD); //bit2,开启/关闭 
    OLED_Write_Byte(0x20,OLED_CMD); //设置内存地址模式
    OLED_Write_Byte(0x02,OLED_CMD); //[1:0],00,列地址模式;01,行地址模式;10,页地址模式;默认10; 
    OLED_Write_Byte(0xA0,OLED_CMD); //段重定义设置bit0:0,0->0;1,0->127;
    //A1列扫描顺序均为自左向右，A0列扫描顺序均为自右向左	
    //COM扫描方向：0xC0:COM0-COM63 ; 0xC8:COM63-COM0
    OLED_Write_Byte(0xC0,OLED_CMD);// 设置COM扫描方向;bit3:0,普通模式;1,重定义模式 COM[N-1]->COM0;N:驱动路数
    OLED_Write_Byte(0xDA,OLED_CMD);//设置COM硬件引脚配置
    OLED_Write_Byte(0x12,OLED_CMD); //[5:4]配置
    //第4位0决定是连续扫描COM端(0,1...32...63)还是1交替扫描COM端(0,32,1,33....31,63)
    //注意实际输出顺序为0，32，1，33.....31，63，因此连续扫描对应交替显示，交替扫描对应连续显示
    //第五位决定是否对COM0-COM31与COM32-COM63进行重映射，1为允许，0为禁止

    OLED_Write_Byte(0x81,OLED_CMD); //对比度设置
    OLED_Write_Byte(0xEF,OLED_CMD); //1~255,默认0X7F(亮度设置，越大越亮)
    OLED_Write_Byte(0xD9,OLED_CMD); //设置预充电周期
    OLED_Write_Byte(0xF1,OLED_CMD); //[3:0],PHASE 1;[7:4],PHASE 2;
    OLED_Write_Byte(0xDB,OLED_CMD); //设置VCOMH电压倍率
    OLED_Write_Byte(0x30,OLED_CMD); //[6:4] 000,0.65*vcc;001,0.77*vcc;011,0.83*vcc;
    OLED_Write_Byte(0xA4,OLED_CMD); //全局显示开启bit0:1,开启;0,关闭;(白屏/黑屏 )
    OLED_Write_Byte(0xA6,OLED_CMD); //设置显示方式;bit0:1,反相显示;0,正常显示
    OLED_Write_Byte(0xAF,OLED_CMD); //开启显示	
} 

//开启OLED显示    
static void OLED_Display_On(void)
{
      OLED_Write_Byte(0x8D,OLED_CMD);  //设置电荷泵命令
      OLED_Write_Byte(0x14,OLED_CMD);  //开电荷泵
      OLED_Write_Byte(0xAF,OLED_CMD);  //开显示
}
//关闭OLED显示     
static void OLED_Display_Off(void)
{
      OLED_Write_Byte(0x8D,OLED_CMD);  //设置电荷泵命令
      OLED_Write_Byte(0x10,OLED_CMD);  //关电荷泵
      OLED_Write_Byte(0xAE,OLED_CMD);  //关显示
}	
	   			 
//清屏函数,清完屏,整个屏幕是黑色的，和没点亮一样	  
void OLED_Clear(void)  
{  
  INT8U i,n;  
  for(i=0;i<8;++i)
  {
    for(n=0;n<132;++n)
    {
      ptrDisplay_GRAM[n][i]=0x00;
    }
  }
}

//在指定位置显示一个字符,包括部分字符
//x:0~127
//y:0~63
//mode:0,反白显示;1,正常显示				 
static void OLED_Write_Char(INT8U x,INT8U y,INT8U chr,INT8U mode)
{      			      			    
    INT8U t;
    chr=chr-' ';//得到偏移后的值			   
    for(t=0;t<6;t++)//按行写入，一共写size行
    {   
        if(mode) 
        {
            ptrDisplay_GRAM[x+t][y/8]=ASCII_0608[chr][t];  //调用0608字体
        }
        else //反白显示
        {
            ptrDisplay_GRAM[x+t][y/8]=~ASCII_0608[chr][t];  //调用0608字体
        }	
    }  
}

INT8U OLED_SetLowPower(void)
{
  if(0 == OLED_IsLowPwr)
  {
    OLED_Display_Off();
    OLED_IsLowPwr = 1;
    return KOS_OK;
  }
  else
  {
    return KOS_ERR;
  }
}

INT8U OLED_SetNormalPower(void)
{
  if(1 == OLED_IsLowPwr)
  {
    OLED_Display_On();
    OLED_IsLowPwr = 0;
    return KOS_OK;
  }
  else
  {
    return KOS_ERR;
  }
}

static void OLED_StrCpy(char * des,const char * src)
{
  while(*src)
  {
    *des = *src;
    src++;
    des++;
  }
  *des = *src;
}

static INT8U OLED_DataShowInit()
{
  INT8U err_code = KOS_OK;
  for(INT8U index = 0;index < PARAM_SHOW_LENGTH;++index)
  {
    stDataMap[index].lpstr = NULL;
    stDataMap[index].lpstr = (char *) malloc (30 * sizeof(char));
    if(NULL == stDataMap[index].lpstr){ err_code += KOS_ERR; }
    else
    {
      OLED_StrCpy(stDataMap[index].lpstr,(char *)DataMap[index][0]);
      stDataMap[index].pData = DataMap[index][1];
      stDataMap[index].typeID = (DataType)DataMap[index][2];
      stDataMap[index].orgLength = strlen(DataMap[index][0]);
      err_code += KOS_OK;
    }
  }
  return err_code;
}

static void Show_Param(INT8U id,ParamSt *param){
  INT8U index = 0;
  INT8U cnt = 0;
  char *src = param->lpstr;
  gTypeAdapter(param);
  for(;cnt < param->orgLength;++cnt)
  {
    OLED_Write_Char(index,id*8,*src,0);
    index+=6;
    src++;
  }
  while(*src){
    OLED_Write_Char(index,id*8,*src,1);
    index+=6;
    src++;
  }
  while(index<122){
    OLED_Write_Char(index,id*8,' ',1);
    index+=6;
  }
  OLED_Refresh_SeleteGram(id);
}

void WriteTips(INT8U id,INT8U *pre,const char *str){
  INT8U index=0;
  while(*pre){
    OLED_Write_Char(index,id*8,*pre,0);
    index+=6;
    pre++;
  }
  while(*str){
    OLED_Write_Char(index,id*8,*str,0);
    index+=6;
    str++;
  }
  while(index<122){
    OLED_Write_Char(index,id*8,' ',1);
    index+=6;
  }
  OLED_Refresh_SeleteGram(id);
}

void OLED_Proc(void)
{
  for(INT8U index = 0;index < PARAM_SHOW_LENGTH;++index)
  {
    Show_Param(index,&stDataMap[index]);
  }
}

INT8U OLED_Init(void)
{
  OLED_ReqGram();//首先申请液晶显存
  if(NULL == ptrDisplay_GRAM) return KOS_ERR;//内存分配失败，液晶初始化失败
  OLED_IO_Init();
  OLED_RST();
  OLED_ChipInit();
  OLED_Display_On();
  OLED_Clear();
  OLED_Refresh_Gram();
  if(KOS_OK != OLED_DataShowInit()) return KOS_ERR;
  else return KOS_OK;
}

void OLED_Close(void)
{
  OLED_Clear();
  OLED_Refresh_Gram();
  OLED_Display_Off();
  OLED_FreeRam();
}
