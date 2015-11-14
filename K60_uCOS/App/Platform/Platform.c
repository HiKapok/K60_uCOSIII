#include "./Platform.h"

/************************************************************************************************ 
* WatchDog_Init
* 看门狗初始化(这里将看门狗定时器的溢出周期设置为1s)
  (其参数与总线时钟相关)
************************************************************************************************/
void WatchDog_Init(void)          
{    
#if EN_WatchDog != 0                
  UNLOCK_WatchDog;       /* 解锁开门狗 */
	
  WDOG_PRESC = 0;        /* 设置时钟分频数为1 */
	
  WDOG_TOVALH = 0x3938;  /* 设置溢出周期 */
  WDOG_TOVALL = 0x8700;
	
  WDOG_STCTRLH = 0x4003; /* 关闭TestMode和WindowMode,选择时钟为总线时钟,并使能开门狗 */
/*
------------------------------------------------------------------------------------ 
     !!! 不要选择LPO的时钟,否则频繁的喂狗可能出现问题  !!!
              在DataSheet的509页开始有这么一段话"You must take care not only to refresh the 
  watchdog within the watchdog timer's actual time-out period, but also provide 
  enough allowance for the time it takes for the refresh sequence to be detected 
  by the watchdog timer, on the watchdog clock."
               虽然没完全看明白,但感觉如果两次喂狗小于一个watchdog clock的话应该会出问题，在实践
     中也确实遇到了类似的问题。所以一定要把看门狗时钟设置为总线时钟.
------------------------------------------------------------------------------------ 
*/
	
  C_WDOG_IntOff();
#endif
}
/************************************************************************************************ 
* GPIO_Init
* GPIO口初始化设置
************************************************************************************************/
void GPIO_Init(void)          
{
  /* PTE25控制蜂鸣器 */  
  PORTE_PCR25 = PORT_PCR_MUX(1);
  GPIOE_PDDR |= 0x02000000; 
  OFF_Buzzer();
  
  /* PTB9、PTB16、PTB18、PTB20接boma开关 */
  PORTB_PCR9 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
  PORTB_PCR16 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
  PORTB_PCR18 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
  PORTB_PCR20 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
  GPIOB_PDDR &= ~0x00150200;                   
}

/************************************************************************************************ 
* IntTick_Init
* 初始化系统时钟中断
************************************************************************************************/
void IntTick_Init(void)
{
  SIM_SCGC6 |= SIM_SCGC6_PIT_MASK;             /* 使能PIT的时钟 */

  (void)EnableInt_Kinetis(68);                 /* 开启对应的中断 */
  (void)SetIntPri_Kinetis(68,9);               /* 设定中断的优先级为9 */
                                               /* !!! 注意值越小优先级越高 !!! */

  PIT_MCR = 0;                                 /* 开启时钟,在DEBUG时使能PIT */
  PIT_LDVAL0 = System_Tick_ms * 1000L * System_Fbus; /* 计数初值 */      

  PIT_TCTRL0 = PIT_TCTRL_TIE_MASK;             /* 使能PIT中断 */

  PIT_TCTRL0 |= PIT_TCTRL_TEN_MASK;            /* 开启计数器 */
}

