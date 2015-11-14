#ifndef  _PLATFORM_H_
#define  _PLATFORM_H_

/***************************硬件平台相关头文件***************************/
#include "../KinetisDrivers/KinetisConfig.h"
#include "../../uCOS_III/CortexM4/os_cpu_def.h"
/****************************时钟配置***************************/
#define System_Fosc REF_CLK_Kinetis                           /* 晶振频率(单位:MHz) */
#define System_Fbus (CORE_CLK_Kinetis / DIV_BusClk_Kinetis)   /* 总线频率(单位:MHz) */

/***************************开门狗配置***************************/
#define EN_WatchDog 1   /* 看门狗使能,1有效 */

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
   Kinetis的喂狗过程不能被中断,所以中断开启后,喂狗前需要关闭中断
*/

/***************************中断配置***************************/
#define ISR_KeyPad()          void PTB19_ISR(void)
#define ISR_System_Tick()     void PTI0_ISR(void)
#define ISR_Key()             void Key_ISR(void)
#define ISR_Enternet()        void PTC12_ISR(void)
    
/*中断操作定义*/
#define EN_Int()        CPU_CRITICAL_EXIT()                 /*开总中断*/
#define DIS_Int()       CPU_SR_ALLOC();CPU_CRITICAL_ENTER() /*关总中断*/

#define EN_TickInt()   (PIT_TCTRL0 |= 0x20)                 /*开系统时钟定时中断*/
#define DIS_TickInt()  (PIT_TCTRL0 &= ~0x20)                /*关系统时钟定时中断*/
#define CLR_TickInt()  (PIT_TFLG0 = 1)                      /*清系统时钟中断的中断标志*/

#define EN_KeyInt()    (PORTB_PCR19 |= PORT_PCR_IRQC(0xA))  /*开键盘中断*/
#define DIS_KeyInt()   (PORTB_PCR19 &= ~PORT_PCR_IRQC_MASK) /*关键盘中断*/
#define CLR_KeyInt()   (PORTB_ISFR |= 0x00080000)           /*清PORTB口的中断标志*/
#define IF_KeyInt()    (PORTB_ISFR & 0x00080000)

#define EN_EnternetInt()  (PORTC_PCR12 |= PORT_PCR_IRQC(0xA))   /*开以太网中断*/
#define DIS_EnternetInt() (PORTC_PCR12 &= ~PORT_PCR_IRQC_MASK)  /*关以太网中断*/
#define CLR_EnternetInt() (PORTC_ISFR |= 0x00001000)            /*清以太网中断的中断标志*/

#define EN_ExtKeyInt()  do {PORTE_PCR16 |= PORT_PCR_IRQC(0xA); PORTE_PCR24 |= PORT_PCR_IRQC(0xA); }while(0)    /*开按键中断*/
#define DIS_ExtKeyInt() do {PORTE_PCR16 &= ~PORT_PCR_IRQC_MASK; PORTE_PCR16 &= ~PORT_PCR_IRQC_MASK; }while(0)  /*关按键中断*/
#define CLR_ExtKeyInt() (PORTE_ISFR |= 0x01010000)         /*清按键中断的中断标志*/
#define GetExtKey()     ((PORTE_ISFR & 0x01000000)>>23 |(PORTE_ISFR & 0x00010000)>>16)
/***************************定时器配置***************************/
#define System_Tick_ms          10                         /*系统时钟的周期(单位:ms)*/

/**************************GPIO配置**************************/
#define OFF_Buzzer()   (GPIOE_PSOR |= 0x02000000)    /*开启蜂鸣器*/
#define ON_Buzzer()  (GPIOE_PCOR |= 0x02000000)    /*关闭蜂鸣器*/
#define READ_Boma()   (((~GPIOB_PDIR & 0x00000200) >> 9L) | ((~GPIOB_PDIR & 0x00010000) >> 15L) | ((~GPIOB_PDIR & 0x00040000) >> 16L) | ((~GPIOB_PDIR & 0x00100000) >> 17L))&0x0F/*读取拨码开关*/
                                              
/***************************API函数声明***************************/
extern void WatchDog_Init(void);
extern void GPIO_Init(void);
extern void IntTick_Init(void);
extern void IntKeyPad_Init(void);

#endif
