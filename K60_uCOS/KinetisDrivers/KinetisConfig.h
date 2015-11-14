/************************************************************************************
 
* KinetisConfig.h

* 对Kinetis底层代码进行必要的配置，并对一些接口函数与全局变量进行声明。

* 所支持的芯片:   K10系列与K60系列
* 所支持的编译器: CodeWarrior 10.x or IAR 6.30

* !!! 注意: 该文件中的部分内容需要用户自行配置,具体的配置方式在注释中有详细说明  !!! 

* 该底层驱动由编译器自动生成的启动代码和飞思卡尔官方例程整理、修改而成。

* 版权所有: 山东大学智能车工作室
* 作者:     孙文健       (第六届摄像头)
* 特别鸣谢: 纪成         (第四届摄像头)
* PS: 该底层驱动是在技术大神、四朝元老——伟大的纪师兄的指导与帮助下完成的，故在此特别鸣谢。
*     欲深入学习Kinetis，可以登录纪师兄的博客http://blog.chinaaet.com/jihceng0622

* 程序版本: V1.02 
* 更新时间: 2012-05-01

*************************************************************************************/
 
#ifndef _KINETIS_CONFIG_H_
#define _KINETIS_CONFIG_H_

/* 头文件包含 */
#include "derivative.h"

/* 中断向量定义 */
/*
--------------------------------------------------------------------------------------------
示例: 
         如要定义FTM0的中断服务函数则应按如下形式声明
   #undef  VECTOR_078            // 78为该中断在向量表中的编号
   #define VECTOR_078  Isr_FTM0  // Isr_FTM0为中断服务函数名
   extern  void Isr_FTM0(void);  // 向底层驱动程序声明该中断服务函数
  
        同时在应用程序中调用EnableInt_Kinetis(62); 
        其中62为其中断号,其值 = 向量表中的编号 - 16
   ( !!! 注意:调用EnableInt_Kinetis()并没配置相关模块的寄存器 !!! )
--------------------------------------------------------------------------------------------
*/

#undef  VECTOR_084             /* PTI0中断(系统时钟中断) */
#define VECTOR_084 PTI0_ISR
extern void PTI0_ISR(void);

#undef  VECTOR_104             /* PortB中断(键盘下降沿中断) */
#define VECTOR_104 PTB19_ISR
extern void PTB19_ISR(void);

#undef  VECTOR_105             /* PortC中断(以太网中断) */
#define VECTOR_105 PTC12_ISR
extern void PTC12_ISR(void);

#undef  VECTOR_107             /* PortE中断(按键中断) */
#define VECTOR_107 Key_ISR
extern void Key_ISR(void);

#undef  VECTOR_014             /* PendSV中断 */
#define VECTOR_014  OS_CPU_PendSVHandler
/* 声明PendSV中断ISR指针 */
extern void  OS_CPU_PendSVHandler(void);

#undef  VECTOR_015             /* SysTick中断 */
#define VECTOR_015  OS_CPU_SysTickHandler
/* 声明滴答定时器中断ISR指针 */
extern void  OS_CPU_SysTickHandler(void);

/* 功能配置(对于简单应用,可以将所有的功能配置全部设为0) */
#define EN_CoreClkOut_Kinetis  0    /* CoreClock输出使能,=1有效(使能后PTA6口输出CoreClock/2) */
#define EN_FlexClkOut_Kinetis  0    /* FlexClock输出使能,=1有效(使能后PTC3口输出FlexClock)*/
#define EN_DisableInt_Kinetis  0    /* 禁用中断函数使能,=1有效(使能后才能调用DisableInt_Kinetis()函数) */
#define EN_ResetType_Kinetis   0    /* 读取复位类型使能,=1有效(使能后可通过ResetType_Kinetis判定复位类型) */
#define EN_StopFun_Kinetis     0    /* Kinetis的STOP模式使能,=1有效(又能后可条用Stop_Kinetis()函数) */
#define EN_WaitFun_Kinetis     0    /* Kinetis的WAIT模式使能,=1有效(又能后可条用Wait_Kinetis()函数) */
#define EN_CheckOpt_Kinetis    0    /* 操作错误检测使能,=1有效(屏蔽后可加快执行速度,并减小代码量) */
#define EN_InitHook_Kinetis    0    /* 用户初始化接口使能,=1有效(使能后可在启动代码中增加初始化接口) */



/* 接口函数定义 */
#if EN_InitHook_Kinetis != 0
  #define HOOK_BeforeClk_Kinetis NullFun_Kinetis
/* 用户自定义的初始化函数,在系统时钟初始化之前被执行(不需要可设为NullFun_Kinetis) */
  #define HOOK_AfterClk_Kinetis  NullFun_Kinetis
/* 用户自定义的初始化函数,在系统时钟初始化之后被执行(不需要可设为NullFun_Kinetis) */
#endif



/* 系统时钟定义 */
#define REF_CLK_Kinetis       24      /* 外部基准振荡器(晶振)频率(单位MHz),取值2-50 */
#define CORE_CLK_Kinetis      120     /* 内核时钟频率(单位MHz),取值48-128,其中>100属于超频运行 */
#define DIV_BusClk_Kinetis    2       /* BusClock的分频数(相对于内核时钟),最大不能超过64M */
#define DIV_FlexClk_Kinetis   2       /* FlexBusclock的分频数(相对于内核时钟),最大不能超过64M */
#define DIV_FlashClk_Kinetis  4       /* Flashclock的分频数(相对于内核时钟),最大不能超过32M */
/*
--------------------------------------------------------------------------------------------
          系统时钟配置说明: 
 (1)晶振频率与内核时钟都必须是2的整数倍
 (2)当内核时钟大于110M时,其取值范围视晶振频率而定: 
      REF_CLK_Kinetis % 3 == 0 时，  CORE_CLK_Kinetis 必须为3的整数倍
      REF_CLK_Kinetis % 4 == 0 时，  CORE_CLK_Kinetis 必须为4的整数倍
      REF_CLK_Kinetis % 5 == 0 时，  CORE_CLK_Kinetis 必须为5的整数倍
--------------------------------------------------------------------------------------------
*/


/* !!! 以下部分使用者不要修改 !!! */
#ifndef NULL
  #define NULL ((void *)0)
#endif
/* ARM Cortex M4 implementation for interrupt priority shift */
#define ARM_INTERRUPT_LEVEL_BITS          4
/* 错误代码 */
#define NOERR_Kinetis         0x00    /* 无错误 */
#define ERR_IntNum_Kinetis    0x01    /* 中断向量号错误 */
#define ERR_IntPri_Kinetis    0x02    /* 中断优先级错误 */
#define ERR_IntISR_Kinetis    0x04    /* 中断服务函数无效 */
/* 复位类型 */
#define RESET_SW_Kinetis      0x400   /* Software */
#define RESET_LOCKUP_Kinetis  0x200   /* Core Lock-up */
#define RESET_JTAG_Kinetis    0x100   /* JTAG generated reset */
#define RESET_POR_Kinetis     0x080   /* Power-on reset */
#define RESET_PIN_Kinetis     0x040   /* External reset pin */
#define RESET_COP_Kinetis     0x020   /* Watchdog */
#define RESET_LOC_Kinetis     0x004   /* Loss-of-clock */
#define RESET_LVD_Kinetis     0x002   /* Low-voltage detect reset */
#define RESET_WAKEUP_Kinetis  0x001   /* Low-leakage wakeup reset */



/* 相关数据类型定义 */
typedef unsigned char  K_int8u_t;     /* 8位无符号数据类型 */
typedef signed   char  K_int8s_t;     /* 8位有符号数据类型 */
typedef unsigned short K_int16u_t;    /* 16位无符号数据类型 */
typedef signed   short K_int16s_t;    /* 16位有符号数据类型 */
typedef unsigned long  K_int32u_t;    /* 32位无符号数据类型 */
typedef signed   long  K_int32s_t;    /* 32位有符号数据类型 */

typedef void (* Ptr_VTOR_t)(void);    /* 中断向量表的指针类型 */

typedef K_int8u_t Kinetis_Error_t;    /* 错误代码的数据类型 */


 
/* 定义非初始化变量的声明方式 */
#if   defined(COMPILER_CW)
  #pragma define_section dat_no_init ".sbss" far_abs RW
  #define KEEP_Data_Kinetis __declspec(dat_no_init)     /* 用KEEP_Data_Kinetis声明的变量复位后不会被清零 */
#elif defined(COMPILER_IAR)
  #define KEEP_Data_Kinetis __no_init                   /* 用KEEP_Data_Kinetis声明的变量复位后不会被清零 */
#endif


/* 操作定义 */
#define EnableInterrupts  asm(" CPSIE i");                          /* 开总中断 */
#define DisableInterrupts asm(" CPSID i");                          /* 关总中断 */
#define UNLOCK_WatchDog   WDOG_UNLOCK = 0xC520;WDOG_UNLOCK = 0xD928 /* 解锁开门狗 */



/* 变量声明 */
#if EN_ResetType_Kinetis != 0
  extern KEEP_Data_Kinetis K_int16u_t  ResetType_Kinetis;   /* 复位类型 */
#endif

  

/* 函数声明 */
extern Kinetis_Error_t EnableInt_Kinetis(K_int32u_t irq);
extern Kinetis_Error_t SetIntPri_Kinetis(K_int32u_t irq, K_int32u_t prio);
#if EN_DisableInt_Kinetis != 0
  extern Kinetis_Error_t DisableInt_Kinetis(K_int32u_t irq);
#endif
#if EN_StopFun_Kinetis != 0
  extern void Stop_Kinetis(void);
#endif
#if EN_WaitFun_Kinetis != 0
  extern void Wait_Kinetis(void);
#endif
extern void NullFun_Kinetis(void);

#endif

