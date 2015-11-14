/************************************************************************************************

* OLED.c

* ʹ��OLEDģ����е���Ӳ��֧��ģ��
  
* ����оƬ��MK10DN512VLL10
  ����ƽ̨��IAR Embedded Workbench 6.3
  
* ���ߣ� ������  (��ʮ������ͷ)  

************************************************************************************************/
#include "./OLED.h"
#include "../TypeAdapter/TypeAdapter.h"
#include <stdlib.h>
#include <string.h>

t_OLED_GRAM ptrDisplay_GRAM = NULL;
INT8U OLED_Mask=0;//Ĭ�ϲ�����Һ��
INT8U OLED_IsLowPwr=0;//Ĭ�Ͽ���Һ����ʾ
void * const DataMap[PARAM_SHOW_LENGTH][3] = 
{
  {"sdbus",&OLED_Mask,(void *)Type_INT8U},
  {"MAXspeed",&OLED_Mask,(void *)Type_INT8U},
  {"MAXspeed",&OLED_Mask,(void *)Type_INT8U},
  {"MAXspeed",&OLED_Mask,(void *)Type_INT8U},
  {"MAXspeed",&OLED_Mask,(void *)Type_INT8U},
};
ParamSt stDataMap[PARAM_SHOW_LENGTH];

//����ASCII��
//ƫ����32
//ASCII�ַ���
//ƫ����32
//��С:12*6
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
 �� �� ��  : OLED_Write_Byte
 ��������  : ��OLEDд���ݻ�������
 �������  : Dat��д�룬Opt��������ѡ��0���1���ݣ� 
 �������  : NONE
 �� �� ֵ  : NONE
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

//�����Դ浽LCD		 
void OLED_Refresh_Gram(void)
{
    INT8U i,n;		    
    for(i=0;i<8;i++)  
    {  
        OLED_Write_Byte(0xB0+i,OLED_CMD);    //����ҳ��ַ��0~7��
        OLED_Write_Byte(0x00,OLED_CMD);      //������ʾλ��-�е͵�ַ
        OLED_Write_Byte(0x10,OLED_CMD);      //������ʾλ��-�иߵ�ַ   
        for(n=0;n<132;n++)
          OLED_Write_Byte(ptrDisplay_GRAM[n][i],OLED_DATA);
    }   
}
//����ĳһ���Դ浽LCD		 
void OLED_Refresh_SeleteGram(INT8U id)
{
  OLED_Write_Byte(0xB0+id,OLED_CMD);    //����ҳ��ַ��0~7��
  OLED_Write_Byte(0x00,OLED_CMD);      //������ʾλ��-�е͵�ַ
  OLED_Write_Byte(0x10,OLED_CMD);      //������ʾλ��-�иߵ�ַ   
  for(INT8U n=0;n<132;n++)
    OLED_Write_Byte(ptrDisplay_GRAM[n][id],OLED_DATA); 
}
/*****************************************************************************
 �� �� ��  : OLED_SetPos
 ��������  : ������ʾ����
 �������  : INT8U X  
             INT8U Y  
 �������  : NONE
 �� �� ֵ  : NONE
*****************************************************************************/
//0xb0+0~7��ʾҳ0~7
//0x00+0~16��ʾ��128�зֳ�16�����ַ��ĳ���еĵڼ���
//0x10+0~16��ʾ��128�зֳ�16�����ַ���ڵڼ���
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
    //���ϵ絽���濪ʼ��ʼ��Ҫ���㹻��ʱ�䣬���ȴ�IC��λ���      
    for(INT16U i=0;i<1000;++i){ asm("nop"); } 
    OLED_RSTH;
}

/*****************************************************************************
 �� �� ��  : OLED_ChipInit
 ��������  : OLED��ʼ��
 �������  : void  
 �������  : NONE
 �� �� ֵ  : NONE
*****************************************************************************/
static void OLED_ChipInit(void)        
{
    OLED_Write_Byte(0xAE,OLED_CMD); //�ر���ʾ
    OLED_Write_Byte(0xD5,OLED_CMD); //����ʱ�ӷ�Ƶ����,��Ƶ��
    OLED_Write_Byte(0x80,OLED_CMD); //[3:0],��Ƶ����;[7:4],��Ƶ��
    OLED_Write_Byte(0xA8,OLED_CMD); //��������·��
    OLED_Write_Byte(0x3F,OLED_CMD); //Ĭ��0x3F(1-64)63
    OLED_Write_Byte(0xD3,OLED_CMD); //������ʾƫ��(�����趨�Ļ������Զ�����һ����ƫ����,רָ�е�ַ��ƫ�ƣ����е�ַ��Ӱ��)
    OLED_Write_Byte(0x00,OLED_CMD); //Ĭ��Ϊ0
    OLED_Write_Byte(0x40,OLED_CMD); //������ʾ��ʼ��[5:0],����.
    OLED_Write_Byte(0x8D,OLED_CMD); //��ɱ�����
    OLED_Write_Byte(0x14,OLED_CMD); //bit2,����/�ر� 
    OLED_Write_Byte(0x20,OLED_CMD); //�����ڴ��ַģʽ
    OLED_Write_Byte(0x02,OLED_CMD); //[1:0],00,�е�ַģʽ;01,�е�ַģʽ;10,ҳ��ַģʽ;Ĭ��10; 
    OLED_Write_Byte(0xA0,OLED_CMD); //���ض�������bit0:0,0->0;1,0->127;
    //A1��ɨ��˳���Ϊ�������ң�A0��ɨ��˳���Ϊ��������	
    //COMɨ�跽��0xC0:COM0-COM63 ; 0xC8:COM63-COM0
    OLED_Write_Byte(0xC0,OLED_CMD);// ����COMɨ�跽��;bit3:0,��ͨģʽ;1,�ض���ģʽ COM[N-1]->COM0;N:����·��
    OLED_Write_Byte(0xDA,OLED_CMD);//����COMӲ����������
    OLED_Write_Byte(0x12,OLED_CMD); //[5:4]����
    //��4λ0����������ɨ��COM��(0,1...32...63)����1����ɨ��COM��(0,32,1,33....31,63)
    //ע��ʵ�����˳��Ϊ0��32��1��33.....31��63���������ɨ���Ӧ������ʾ������ɨ���Ӧ������ʾ
    //����λ�����Ƿ��COM0-COM31��COM32-COM63������ӳ�䣬1Ϊ����0Ϊ��ֹ

    OLED_Write_Byte(0x81,OLED_CMD); //�Աȶ�����
    OLED_Write_Byte(0xEF,OLED_CMD); //1~255,Ĭ��0X7F(�������ã�Խ��Խ��)
    OLED_Write_Byte(0xD9,OLED_CMD); //����Ԥ�������
    OLED_Write_Byte(0xF1,OLED_CMD); //[3:0],PHASE 1;[7:4],PHASE 2;
    OLED_Write_Byte(0xDB,OLED_CMD); //����VCOMH��ѹ����
    OLED_Write_Byte(0x30,OLED_CMD); //[6:4] 000,0.65*vcc;001,0.77*vcc;011,0.83*vcc;
    OLED_Write_Byte(0xA4,OLED_CMD); //ȫ����ʾ����bit0:1,����;0,�ر�;(����/���� )
    OLED_Write_Byte(0xA6,OLED_CMD); //������ʾ��ʽ;bit0:1,������ʾ;0,������ʾ
    OLED_Write_Byte(0xAF,OLED_CMD); //������ʾ	
} 

//����OLED��ʾ    
static void OLED_Display_On(void)
{
      OLED_Write_Byte(0x8D,OLED_CMD);  //���õ�ɱ�����
      OLED_Write_Byte(0x14,OLED_CMD);  //����ɱ�
      OLED_Write_Byte(0xAF,OLED_CMD);  //����ʾ
}
//�ر�OLED��ʾ     
static void OLED_Display_Off(void)
{
      OLED_Write_Byte(0x8D,OLED_CMD);  //���õ�ɱ�����
      OLED_Write_Byte(0x10,OLED_CMD);  //�ص�ɱ�
      OLED_Write_Byte(0xAE,OLED_CMD);  //����ʾ
}	
	   			 
//��������,������,������Ļ�Ǻ�ɫ�ģ���û����һ��	  
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

//��ָ��λ����ʾһ���ַ�,���������ַ�
//x:0~127
//y:0~63
//mode:0,������ʾ;1,������ʾ				 
static void OLED_Write_Char(INT8U x,INT8U y,INT8U chr,INT8U mode)
{      			      			    
    INT8U t;
    chr=chr-' ';//�õ�ƫ�ƺ��ֵ			   
    for(t=0;t<6;t++)//����д�룬һ��дsize��
    {   
        if(mode) 
        {
            ptrDisplay_GRAM[x+t][y/8]=ASCII_0608[chr][t];  //����0608����
        }
        else //������ʾ
        {
            ptrDisplay_GRAM[x+t][y/8]=~ASCII_0608[chr][t];  //����0608����
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
  OLED_ReqGram();//��������Һ���Դ�
  if(NULL == ptrDisplay_GRAM) return KOS_ERR;//�ڴ����ʧ�ܣ�Һ����ʼ��ʧ��
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
