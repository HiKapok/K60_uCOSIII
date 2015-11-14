#ifndef  _PLATFORM_H_
#define  _PLATFORM_H_

/***************************Ӳ��ƽ̨���ͷ�ļ�***************************/
#include "../KinetisDrivers/KinetisConfig.h"
#include "../../uCOS_III/CortexM4/os_cpu_def.h"
/****************************ʱ������***************************/
#define System_Fosc REF_CLK_Kinetis                           /* ����Ƶ��(��λ:MHz) */
#define System_Fbus (CORE_CLK_Kinetis / DIV_BusClk_Kinetis)   /* ����Ƶ��(��λ:MHz) */

/***************************���Ź�����***************************/
#define EN_WatchDog 1   /* ���Ź�ʹ��,1��Ч */

#ifndef C_WDOG_IntOff   
  #if EN_WatchDog != 0        
    #define C_WDOG_IntOff()  do{ WDOG_REFRESH = 0xA602;WDOG_REFRESH = 0xB480; } while(0)    
  #else
    #define C_WDOG_IntOff() ;   
  #endif  
#endif

#ifndef C_WDOG_IntOn  
  #if EN_WatchDog != 0        
    #define C_WDOG_IntOn()   do{ DIS_Int();C_WDOG_IntOff();EN_Int(); } while(0)
  #else
    #define C_WDOG_IntOn() ;   
  #endif  
#endif
/*
   Kinetis��ι�����̲��ܱ��ж�,�����жϿ�����,ι��ǰ��Ҫ�ر��ж�
*/

/***************************�ж�����***************************/
#define ISR_KeyPad()          void PTB19_ISR(void)
#define ISR_System_Tick()     void PTI0_ISR(void)
#define ISR_Key()             void Key_ISR(void)
#define ISR_Enternet()        void PTC12_ISR(void)
    
/*�жϲ�������*/
#define EN_Int()        CPU_CRITICAL_EXIT()                 /*�����ж�*/
#define DIS_Int()       CPU_SR_ALLOC();CPU_CRITICAL_ENTER() /*�����ж�*/

#define EN_TickInt()   (PIT_TCTRL0 |= 0x20)                 /*��ϵͳʱ�Ӷ�ʱ�ж�*/
#define DIS_TickInt()  (PIT_TCTRL0 &= ~0x20)                /*��ϵͳʱ�Ӷ�ʱ�ж�*/
#define CLR_TickInt()  (PIT_TFLG0 = 1)                      /*��ϵͳʱ���жϵ��жϱ�־*/

#define EN_KeyInt()    (PORTB_PCR19 |= PORT_PCR_IRQC(0xA))  /*�������ж�*/
#define DIS_KeyInt()   (PORTB_PCR19 &= ~PORT_PCR_IRQC_MASK) /*�ؼ����ж�*/
#define CLR_KeyInt()   (PORTB_ISFR |= 0x00080000)           /*��PORTB�ڵ��жϱ�־*/
#define IF_KeyInt()    (PORTB_ISFR & 0x00080000)

#define EN_EnternetInt()  (PORTC_PCR12 |= PORT_PCR_IRQC(0xA))   /*����̫���ж�*/
#define DIS_EnternetInt() (PORTC_PCR12 &= ~PORT_PCR_IRQC_MASK)  /*����̫���ж�*/
#define CLR_EnternetInt() (PORTC_ISFR |= 0x00001000)            /*����̫���жϵ��жϱ�־*/

#define EN_ExtKeyInt()  do {PORTE_PCR16 |= PORT_PCR_IRQC(0xA); PORTE_PCR24 |= PORT_PCR_IRQC(0xA); }while(0)    /*�������ж�*/
#define DIS_ExtKeyInt() do {PORTE_PCR16 &= ~PORT_PCR_IRQC_MASK; PORTE_PCR16 &= ~PORT_PCR_IRQC_MASK; }while(0)  /*�ذ����ж�*/
#define CLR_ExtKeyInt() (PORTE_ISFR |= 0x01010000)         /*�尴���жϵ��жϱ�־*/
#define GetExtKey()     ((PORTE_ISFR & 0x01000000)>>23 |(PORTE_ISFR & 0x00010000)>>16)
/***************************��ʱ������***************************/
#define System_Tick_ms          10                         /*ϵͳʱ�ӵ�����(��λ:ms)*/

/**************************GPIO����**************************/
#define OFF_Buzzer()   (GPIOE_PSOR |= 0x02000000)    /*����������*/
#define ON_Buzzer()  (GPIOE_PCOR |= 0x02000000)    /*�رշ�����*/
#define READ_Boma()   (((~GPIOB_PDIR & 0x00000200) >> 9L) | ((~GPIOB_PDIR & 0x00010000) >> 15L) | ((~GPIOB_PDIR & 0x00040000) >> 16L) | ((~GPIOB_PDIR & 0x00100000) >> 17L))&0x0F/*��ȡ���뿪��*/
                                              
/***************************API��������***************************/
extern void WatchDog_Init(void);
extern void GPIO_Init(void);
extern void IntTick_Init(void);
extern void IntKeyPad_Init(void);

#endif
