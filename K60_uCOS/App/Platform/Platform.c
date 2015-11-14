#include "./Platform.h"

/************************************************************************************************ 
* WatchDog_Init
* ���Ź���ʼ��(���ｫ���Ź���ʱ���������������Ϊ1s)
  (�����������ʱ�����)
************************************************************************************************/
void WatchDog_Init(void)          
{    
#if EN_WatchDog != 0                
  UNLOCK_WatchDog;       /* �������Ź� */
	
  WDOG_PRESC = 0;        /* ����ʱ�ӷ�Ƶ��Ϊ1 */
	
  WDOG_TOVALH = 0x3938;  /* ����������� */
  WDOG_TOVALL = 0x8700;
	
  WDOG_STCTRLH = 0x4003; /* �ر�TestMode��WindowMode,ѡ��ʱ��Ϊ����ʱ��,��ʹ�ܿ��Ź� */
/*
------------------------------------------------------------------------------------ 
     !!! ��Ҫѡ��LPO��ʱ��,����Ƶ����ι�����ܳ�������  !!!
              ��DataSheet��509ҳ��ʼ����ôһ�λ�"You must take care not only to refresh the 
  watchdog within the watchdog timer's actual time-out period, but also provide 
  enough allowance for the time it takes for the refresh sequence to be detected 
  by the watchdog timer, on the watchdog clock."
               ��Ȼû��ȫ������,���о��������ι��С��һ��watchdog clock�Ļ�Ӧ�û�����⣬��ʵ��
     ��Ҳȷʵ���������Ƶ����⡣����һ��Ҫ�ѿ��Ź�ʱ������Ϊ����ʱ��.
------------------------------------------------------------------------------------ 
*/
	
  C_WDOG_IntOff();
#endif
}
/************************************************************************************************ 
* GPIO_Init
* GPIO�ڳ�ʼ������
************************************************************************************************/
void GPIO_Init(void)          
{
  /* PTE25���Ʒ����� */  
  PORTE_PCR25 = PORT_PCR_MUX(1);
  GPIOE_PDDR |= 0x02000000; 
  OFF_Buzzer();
  
  /* PTB9��PTB16��PTB18��PTB20��boma���� */
  PORTB_PCR9 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
  PORTB_PCR16 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
  PORTB_PCR18 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
  PORTB_PCR20 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
  GPIOB_PDDR &= ~0x00150200;                   
}

/************************************************************************************************ 
* IntTick_Init
* ��ʼ��ϵͳʱ���ж�
************************************************************************************************/
void IntTick_Init(void)
{
  SIM_SCGC6 |= SIM_SCGC6_PIT_MASK;             /* ʹ��PIT��ʱ�� */

  (void)EnableInt_Kinetis(68);                 /* ������Ӧ���ж� */
  (void)SetIntPri_Kinetis(68,9);               /* �趨�жϵ����ȼ�Ϊ9 */
                                               /* !!! ע��ֵԽС���ȼ�Խ�� !!! */

  PIT_MCR = 0;                                 /* ����ʱ��,��DEBUGʱʹ��PIT */
  PIT_LDVAL0 = System_Tick_ms * 1000L * System_Fbus; /* ������ֵ */      

  PIT_TCTRL0 = PIT_TCTRL_TIE_MASK;             /* ʹ��PIT�ж� */

  PIT_TCTRL0 |= PIT_TCTRL_TEN_MASK;            /* ���������� */
}

