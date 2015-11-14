#include "./ExtraFunction.h"
#include "../HardwareInterface/HardwareOperation.h"
#include "../ZLG7290/ZLG7290.h"
#include "../LEDCtl/LEDCtl_Ext.h"
#include "../OLED/OLED.h"
#include "../SD_System/SD_System.h"

/**************************�ڲ���������**************************/
#if EN_Buzzer != 0

static INT16U Tim_Buzzer;                  /*������ʱ�����*/
static BuzzerData_t BuzzerQ[NUM_BuzzerQ];  /*�������������*/
static INT8U BuzzerQ_Head,BuzzerQ_Rear;    /*������������е�ͷβָ��*/
static INT8U BuzzerQ_Stat;                 /*�������������״̬,=0��ʾ����*/

#endif

/**************************�ڲ���������**************************/
#if EN_SDCard != 0 

/*���SD����д��ʹ����˫���沢ʹ����ͳ�ƹ���,��ͳ�ƽ��д��SD��*/
#ifdef EN_SDbuf  
#ifdef EN_Cnt_SDbuf
/************************************************************************************************ 
* WriteVar_SD
* ��16λ�޷������ݰ�ASCII�����ʽд��SD��
* �������  dat:��д������
************************************************************************************************/
static void WriteVar_SD(INT16U dat)
{
  INT16U div=10000,flag=0,tmp;
  for(;div!=0 ;div/=10)
  {
    tmp=(dat/div)%10;
    if(tmp!=0) flag=1;
    if(flag)
    {
      writebyte_ram('0'+ tmp);
    }
  }
  
  if(flag == 0) writebyte_ram('0'); 
}
/************************************************************************************************ 
* BufTest_SD
* ��SD��˫�����ʹ�������ӵ��ļ���ĩβ
************************************************************************************************/
static void BufTest_SD()
{
  INT16U s1,s2,s3,s4,s5;
  
  writebyte_ram('\r');
  writebyte_ram('\n');
  
  s1=Cnt_SDbufS1;
  s2=Cnt_SDbufS2;
  s3=Cnt_SDbufS3;
  s4=Cnt_SDbufS4;
  s5=Cnt_SDbufS5;
  
  WriteVar_SD(s1);
  writebyte_ram(',');
  WriteVar_SD(s2);
  writebyte_ram(',');
  WriteVar_SD(s3);
  writebyte_ram(','); 
  WriteVar_SD(s4);
  writebyte_ram(','); 
  WriteVar_SD(s5);
}
#endif
#endif

/************************************************************************************************ 
* Write_SD
* �����ݰ����ض���ʽ����SD��
************************************************************************************************/
static void Write_SD(void)
{
  static INT16U cnt = 0;
  
  writebyte_ram( (byte) 0 );
  
  if(SD_Packet == cnt)   
  { // ��ͼ��֡��д��SD��(ע����ʵ��д��SD�����֡��,������ִ�п��Ʋ��Եĳ���)

    writebyte_ram( (byte)(cnt%256) );         
    writebyte_ram( (byte)(cnt>>8) );
    
#ifdef EN_Cnt_SDbuf        
    BufTest_SD();
#endif
     
    write_stop();
  }
  cnt++;
}
#endif


#if EN_Buzzer != 0
/************************************************************************************************ 
* BuzzerCtrl_Init
* ���������Ƴ�ʼ��
************************************************************************************************/
static void BuzzerCtrl_Init(void)
{
  BuzzerQ_Head = 0;
  BuzzerQ_Rear = 0;
  BuzzerQ_Stat = 1;
  Tim_Buzzer = 0;
}
/************************************************************************************************ 
* Process_BuzzerCtrl
* ���ݷ����������е����ݽ��з���������
************************************************************************************************/
void Process_BuzzerCtrl(void)
{
  BuzzerData_t *pbzr;
  INT8U on1,off1,on2,off2;
  INT16U tim;
  
  if(BuzzerQ_Rear != BuzzerQ_Head || BuzzerQ_Stat == 0)
  {
    pbzr = &BuzzerQ[BuzzerQ_Head];
    on1 = pbzr->Tim_On1;
    off1 = pbzr->Tim_Off1;
    on2 = pbzr->Tim_On2;
    off2 = pbzr->Tim_Off2;
    tim = Tim_Buzzer % (pbzr->Tim_Total);
    
    if(tim < on1 + off1)
    {
      if(0 == tim)
      {
        if(0 != on1)
        {
          ON_Buzzer();
        }
        else
        {
          OFF_Buzzer();
        }
      }
      else
      {
        if(on1 == tim)
        {
          OFF_Buzzer();        
        }
      }
    }
    else
    {
      if(on1 + off1 == tim)
      {
        if(0 != on2)
        {
          ON_Buzzer();
        }
      }
      else
      {
        if(on1 + off1 + on2 == tim)
        {
          OFF_Buzzer();
        }
      }
    }
    
    if((++Tim_Buzzer) >= pbzr->Tim_All)
    { /*���Ӳ���*/
      OFF_Buzzer();
      if((++BuzzerQ_Head) == NUM_BuzzerQ)
      {
        BuzzerQ_Head = 0;
      }
      Tim_Buzzer = 0;
      BuzzerQ_Stat = 1;
    }
  }
}

#endif

/**************************�ӿں�������**************************/
void SDCard_MainTask(void)
{
#if EN_SDCard != 0     
  if(sd_yes == 1)     /*дSD����������λ������*/
  { 
    Wait_SDRdy(SD_SHORT_Wait);
    if(Flag_SDRdy)
    {
      Write_SD();
    } 
  }
  C_WDOG_IntOn();
#endif
}

void OLED_MainTask(void) 
{
#if EN_OLED != 0
  C_WDOG_IntOn();
  if(OLED_Mask == 0)    
  {
    OLED_Proc();    
  } 
#endif 
}

void LED_MainTask(void)
{
#if EN_LED != 0
  LED_CtlProc();
  C_WDOG_IntOn();
#endif
}

void Buzzer_MainTask(void)
{
#if EN_Buzzer != 0
  Process_BuzzerCtrl();
  C_WDOG_IntOn();
#endif
}


/************************************************************************************************ 
* BuzzerSet
* �趨������������(!!!ע��:�ú������߱��ɳ�����,��ֹ���ж��������е���!!!)
* ��ڲ���  tim_all:������������ʱ��(��λ:��)
            tim_on1:��һ�����ڷ�����������ʱ��(��λ:��)
            tim_off1:��һ�����ڷ������رյ�ʱ��(��λ:��)
            tim_on2:�ڶ������ڷ�����������ʱ��(��λ:��)
            tim_off2:�ڶ������ڷ������رյ�ʱ��(��λ:��)
************************************************************************************************/
void BuzzerSet(INT16U tim_all,INT8U tim_on1,INT8U tim_off1,INT8U tim_on2,INT8U tim_off2)
{
#if EN_Buzzer != 0
  
  BuzzerData_t *pbzr; 
  
  if(tim_all != 0 && BuzzerQ_Stat != 0)
  { /*����������Ϣ���*/
    pbzr = &BuzzerQ[BuzzerQ_Rear];
    pbzr->Tim_All = tim_all;
    pbzr->Tim_On1 = tim_on1;
    pbzr->Tim_Off1 = tim_off1;
    pbzr->Tim_On2 = tim_on2;
    pbzr->Tim_Off2 = tim_off2;
    pbzr->Tim_Total = tim_on1 + tim_off1 + tim_on2 + tim_off2;
      
    if((++BuzzerQ_Rear) == NUM_BuzzerQ)
    {
      BuzzerQ_Rear = 0; 
    }
    
    /*�������ж�*/
    if(BuzzerQ_Rear == BuzzerQ_Head)    
    {
      BuzzerQ_Stat = 0;
    }
  }

#else

  (void)tim_all;      /*����������ľ���*/
  (void)tim_on1;
  (void)tim_off1;
  (void)tim_on2;
  (void)tim_off2;
      
#endif
}

void ProcessKeyPad(INT16U * Key_Value)
{
  
}
/************************************************************************************************ 
* ExtInit_Normal
* ��������ʱ�Ķ����ʼ��,�����趨ϵͳʱ���ж���Ļص��������趨��������ʼ�����Թ��ߵȹ���
************************************************************************************************/
void ExtInit_Normal(void)
{
  /*�趨�ж���Ļص�����*/
  Boma=ReadBomaValue();
 
  switch(Boma & 0x03)
  {
    case 0  :
              
              break;
    case 1  :
              
              break;
    case 2  :
             
              break;
    case 3  :
             
              break;
    default : 
              
              break;
  }
#if EN_LED != 0
  LED_Init();
  LedCtlSet(LED_Warning);
  C_WDOG_IntOn();
#endif
  
#if EN_OLED != 0
    if(0 == OLED_Mask && KOS_OK != OLED_Init()) { OLED_Mask = 1; OLED_Close(); }
#endif
  C_WDOG_IntOn();
#if EN_KeyPad != 0
  if(KeyPad_Mask == 0)
  {
    KeyPad_Init(ProcessKeyPad);
    ExtKey_Init();    
  }  
#endif
  C_WDOG_IntOn();
  /*���������Ƴ�ʼ��*/
#if EN_Buzzer != 0
  BuzzerCtrl_Init();
#endif
  /*���Թ��ߵĳ�ʼ��*/
#if EN_SDCard != 0   
  SD_System_Init();          /*SD����ʼ��*/
  if(sd_yes == 0)
  {
    LedCtlSet(LED_SysErr);
  }
#endif 
  C_WDOG_IntOn();
  BuzzerSet(BZR_SysStart);
}
