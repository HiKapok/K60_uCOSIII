#include "./KinetisVectors.h"
#include "./KinetisConfig.h"

/* 声明启动代码指针 */
extern void StartUp_Kinetis(void);
/* 声明PendSV中断ISR指针 */
extern void  OS_CPU_PendSVHandler (void);
/* 声明堆栈指针 */
extern K_int32u_t __SP_INIT[]; 
/* 声明滴答定时器中断ISR指针 */
extern void  OS_CPU_SysTickHandler (void);

static  void  Spurious_ISR (void)
{
    for (;;) { ; }
}


#pragma location = ".intvec"
const Ptr_VTOR_t  __vector_table[] = 
{ /* 自定义的中断向量表(注意在IAR中这里的变量名必须是__vector_table) */         
  (Ptr_VTOR_t)__SP_INIT,       /* Initial SP */
  (Ptr_VTOR_t)StartUp_Kinetis, /* Initial PC */
  Spurious_ISR,                                           /* 002 Non-maskable interrupt.                          */
  Spurious_ISR,                                           /* 003 Hard fault exception.                            */
  Spurious_ISR,                                           /* 004 Reserved interrupt 4.                            */
  Spurious_ISR,                                           /* 005 Bus fault exception.                             */
  Spurious_ISR,                                           /* 006 Usage fault exception.                           */
  Spurious_ISR,                                           /* 007 Reserved interrupt 7.                            */
  Spurious_ISR,                                           /* 008 Reserved interrupt 8.                            */
  Spurious_ISR,                                           /* 009 Reserved interrupt 9.                            */
  Spurious_ISR,                                           /* 010 Reserved interrupt 10.                           */
  Spurious_ISR,                                           /* 011 A supervisor call exception.                     */
  Spurious_ISR,                                           /* 012 Debug Monitor.                                   */
  Spurious_ISR,                                           /* 013 Reserved interrupt 13.                           */
  OS_CPU_PendSVHandler,                                   /* 014 PendSV exception.                                */
  OS_CPU_SysTickHandler,                                  /* 015 SysTick Interrupt.                               */
  VECTOR_016,
  VECTOR_017,
  VECTOR_018,
  VECTOR_019,
  VECTOR_020,
  VECTOR_021,
  VECTOR_022,
  VECTOR_023,
  VECTOR_024,
  VECTOR_025,
  VECTOR_026,
  VECTOR_027,
  VECTOR_028,
  VECTOR_029,
  VECTOR_030,
  VECTOR_031,
  VECTOR_032,
  VECTOR_033,
  VECTOR_034,
  VECTOR_035,
  VECTOR_036,
  VECTOR_037,
  VECTOR_038,
  VECTOR_039,
  VECTOR_040,
  VECTOR_041,
  VECTOR_042,
  VECTOR_043,
  VECTOR_044,
  VECTOR_045,
  VECTOR_046,
  VECTOR_047,
  VECTOR_048,
  VECTOR_049,
  VECTOR_050,
  VECTOR_051,
  VECTOR_052,
  VECTOR_053,
  VECTOR_054,
  VECTOR_055,
  VECTOR_056,
  VECTOR_057,
  VECTOR_058,
  VECTOR_059,
  VECTOR_060,
  VECTOR_061,
  VECTOR_062,
  VECTOR_063,
  VECTOR_064,
  VECTOR_065,
  VECTOR_066,
  VECTOR_067,
  VECTOR_068,
  VECTOR_069,
  VECTOR_070,
  VECTOR_071,
  VECTOR_072,
  VECTOR_073,
  VECTOR_074,
  VECTOR_075,
  VECTOR_076,
  VECTOR_077,
  VECTOR_078,
  VECTOR_079,
  VECTOR_080,
  VECTOR_081,
  VECTOR_082,
  VECTOR_083,
  VECTOR_084,
  VECTOR_085,
  VECTOR_086,
  VECTOR_087,
  VECTOR_088,
  VECTOR_089,
  VECTOR_090,
  VECTOR_091,
  VECTOR_092,
  VECTOR_093,
  VECTOR_094,
  VECTOR_095,
  VECTOR_096,
  VECTOR_097,
  VECTOR_098,
  VECTOR_099,
  VECTOR_100,
  VECTOR_101,
  VECTOR_102,
  VECTOR_103,
  VECTOR_104,
  VECTOR_105,
  VECTOR_106,
  VECTOR_107,
  VECTOR_108,
  VECTOR_109,
  VECTOR_110,
  VECTOR_111,
  VECTOR_112,
  VECTOR_113,
  VECTOR_114,
  VECTOR_115,
  VECTOR_116,
  VECTOR_117,
  VECTOR_118,
  VECTOR_119,
};
