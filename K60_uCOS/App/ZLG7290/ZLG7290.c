#include "./ZLG7290.h"
#include "../Platform/Platform.h"

ptrKeyCallBackFunc ptrKeyPadFunc;
#if EN_KeyPad != 0

INT8U Key_Valid = 0;
INT16U Key_Value = 0;
INT8U KeyPad_Mask = 0;
INT16U ExtKeyValue = 0;
/******************************************************************************
* ��������: LongDelay_7290
* ��������: 7290��ʱ����ʱ����.
******************************************************************************/
static void LongDelay_7290(void)
{
    volatile INT16U i, j;
    
    for(j = 120; j > 0; j--)
    {
        for(i = LONG_DELAY_TIME_7290; i > 0; i--) C_WDOG_IntOn();
    }
}
/******************************************************************************
* ��������: ShortDelay_7290
* ��������: 7290��ʱ����ʱ����.
******************************************************************************/
static void ShortDelay_7290(void)
{ 
    volatile INT16S Num = SHORT_DELAY_TIME_7290;
    volatile INT16S i;
  
    while(Num--)
    {
        for(i = 0; i < 2; i++) C_WDOG_IntOn();
    }
}

/******************************************************************************
* ��������: StartI2C_7290
* ��������: I2C�����ź�.
******************************************************************************/
static void StartI2C_7290(void)
{
    SET_SCL_OUT_7290();
    SET_SDA_OUT_7290();
    
    SET_SDA_HIGH_7290();  
    ShortDelay_7290();
  
    SET_SCL_HIGH_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
  
    SET_SDA_LOW_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
}
/******************************************************************************
* ��������: StopI2C_7290
* ��������: I2C�����ź�.
******************************************************************************/
static void StopI2C_7290(void)
{
    SET_SCL_OUT_7290();
    SET_SDA_OUT_7290();
    
    SET_SDA_LOW_7290();
    ShortDelay_7290();
  
    SET_SCL_HIGH_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
  
    SET_SDA_HIGH_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
}

/******************************************************************************
* ��������: WackI2C_7290
* ��������: ����I2CӦ���ź�.
******************************************************************************/
static void WackI2C_7290(void)
{ 
    SET_SCL_OUT_7290();
    SET_SDA_OUT_7290();
    SET_SDA_HIGH_7290();
    ShortDelay_7290();
  
    SET_SCL_LOW_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
  
    SET_SCL_HIGH_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
  
    SET_SCL_LOW_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
}

/******************************************************************************
* ��������: WriteByteI2C_7290
* ��������: ͨ��I2C����һ�ֽ�����.
* ��ڲ���: dat  ����������
******************************************************************************/
static void WriteByteI2C_7290(INT8U dat)
{
    INT8U i = 8, temp;
    
    SET_SCL_OUT_7290();
    SET_SDA_OUT_7290();
    
    SET_SCL_LOW_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();

    while(i--)
    {     
      temp = dat & 0x80;
      if(temp == 0)
      {
          SET_SDA_LOW_7290();
      }
      else
      {
          SET_SDA_HIGH_7290();
      }
      ShortDelay_7290();ShortDelay_7290();
      ShortDelay_7290();ShortDelay_7290();

      dat <<= 1;

      SET_SCL_HIGH_7290();
      ShortDelay_7290();ShortDelay_7290();
      ShortDelay_7290();ShortDelay_7290();

      SET_SCL_LOW_7290();
      ShortDelay_7290();ShortDelay_7290();
      ShortDelay_7290();ShortDelay_7290();
    }

    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
}
/******************************************************************************
* ��������: ReadByteI2C_7290
* ��������: ͨ��I2C��ȡһ�ֽ�����.
* ���ز���: ��ȡ���
******************************************************************************/
static INT8U ReadByteI2C_7290(void)
{
    INT8U dat = 0x00;
    INT8U i   = 8;
    
    while(i--)
    { 
        SET_SCL_OUT_7290();
        SET_SDA_OUT_7290();
        
        SET_SDA_HIGH_7290();
        ShortDelay_7290();ShortDelay_7290();
        ShortDelay_7290();ShortDelay_7290();
        
        SET_SCL_OUT_7290();
        SET_SDA_IN_7290();  /* SDA�ķ���ı�:SCL�����SDA���� */
        
        dat <<= 1;
        SET_SCL_LOW_7290();
        ShortDelay_7290();ShortDelay_7290();
        ShortDelay_7290();ShortDelay_7290();

        SET_SCL_HIGH_7290();
        ShortDelay_7290();ShortDelay_7290();
        ShortDelay_7290();ShortDelay_7290();

        if(READ_SDA_7290() != 0)
        {
            dat |= 0x01;
        }
    }

    SET_SCL_OUT_7290();
    SET_SDA_OUT_7290();
    SET_SCL_LOW_7290();
    SET_SDA_HIGH_7290();
    
    return dat;
}

/************************************************************************************************ 
* IntKeyPad_Init
* ��ʼ�������ж�(PTB19)
************************************************************************************************/
static void IntKeyPad_Init(void)
{
  PORTB_PCR19 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK;
	                                   /* ʹ���������� */
                                           /* ���жϽ�������Ϊ�½��� */
  (void)EnableInt_Kinetis(88);             /* ������Ӧ���ж� */
}

/******************************************************************************
* ��������: Init_Chip7290
* ��������: ��ʼ��7290
******************************************************************************/
static void Init_Chip7290(void)
{
  INIT_SCL_7290();
  INIT_SDA_7290();
  
  StartI2C_7290();              
  WriteByteI2C_7290(SLVADDR_7290);
  WackI2C_7290();

  WriteByteI2C_7290(0x0D);
  WackI2C_7290();

  WriteByteI2C_7290(0x03);
  WackI2C_7290();

  StopI2C_7290();
  LongDelay_7290();
}

/************************************************************************************************ 
* KeyPad_Init
* ���̳�ʼ������
* PTB19-INT PTB17-SDA PTB23-SCL
************************************************************************************************/
void KeyPad_Init(ptrKeyCallBackFunc func)    
{ 
  Init_Chip7290(); 
  IntKeyPad_Init();
  ptrKeyPadFunc = func;
  EN_KeyInt();
} 

/******************************************************************************
* ��������: Readkey_7290
* ��������: ��ȡ����ֵ.
* ���ز���: ������ֵ
******************************************************************************/
static INT8U Readkey_7290()
{
    INT8U key;

    StartI2C_7290();
    WriteByteI2C_7290(SLVADDR_7290);    /* д�ӻ���ַ       */
    WackI2C_7290();

    WriteByteI2C_7290(SUB_KEY_7290);    /* д��ȡ��������ַ */
    WackI2C_7290();

    StartI2C_7290();
    WriteByteI2C_7290(SLVADDR_7290+0x01);
    WackI2C_7290();

    key = ReadByteI2C_7290();

    StopI2C_7290();
    LongDelay_7290();

    return key;
}
/******************************************************************************
* ��������: ReadRepeat_7290
* ��������: ��ȡ��������.
* ���ز���: ��������
******************************************************************************/
static INT8U ReadRepeat_7290()
{
    INT8U cnt;

    StartI2C_7290();
    WriteByteI2C_7290(SLVADDR_7290);    /* д�ӻ���ַ       */
    WackI2C_7290();

    WriteByteI2C_7290(REPEAT_CNT_7290);    /* д��ȡ��������ַ */
    WackI2C_7290();

    StartI2C_7290();
    WriteByteI2C_7290(SLVADDR_7290+0x01);
    WackI2C_7290();

    cnt = ReadByteI2C_7290();
    StopI2C_7290();
    LongDelay_7290();

    return cnt;
}

/*
������ZLG7290_ReadKeyValue()
���ܣ�ֱ�Ӷ�ȡ��ֵ����������
���أ���ֵ����ֵ��������ֵ�������ܼ����ء�N��,��Y��,F1-��1��,F2-��2��,F3-��3��,F4-��4��
 */
INT16U ZLG7290_ReadKeyValue() 
{
    INT8U KeyValue = 0;
    INT8U KeyRepeat = 0;
    INT16U temp = 0;
    KeyValue=Readkey_7290();
    KeyRepeat=ReadRepeat_7290();    
    switch (KeyValue) {
    case  0x09 :
      KeyValue = 1;  
      break; 
    case  0x0A :
      KeyValue = 2;  
      break;       
    case  0x0B  :
      KeyValue = 3;  
      break; 
    case  0x19 :
      KeyValue = 4;  
      break; 
    case  0x1A :
      KeyValue = 5;  
      break; 
    case  0x1B :
      KeyValue = 6;  
      break;      
    case  0x11 :
      KeyValue = 7;  
      break; 
    case  0x12 :
      KeyValue = 8;  
      break; 
    case  0x13 :
      KeyValue = 9;  
      break; 
    case  0x01 :
      KeyValue = 'N';  
      break;       
    case  0x02 :
      KeyValue = 0;  
      break; 
    case  0x03 :    
      KeyValue = 'Y';  
      break; 
    case  0x0C :
      KeyValue = '-';  
      break; 
    case  0x1C :    
      KeyValue = '.';  
      break;  
    case  0x14 :
      KeyValue = 'U';  
      break; 
    case  0x04 :    
      KeyValue = 'D';  
      break;
    default:
      return 0; 
    }
    temp = KeyRepeat;
    temp <<= 8;
    temp |= KeyValue;
    return temp;
}

#endif
