/************************************************************************************

* KinetisStart.c

* 定义Kinetis的启动代码以及必要的初始化代码。

* 所支持的芯片:   K10系列与K60系列
* 所支持的编译器: CodeWarrior 10.x or IAR 6.30

* 该底层驱动由编译器自动生成的启动代码和飞思卡尔官方例程整理、修改而成。

* 版权所有: 山东大学智能车工作室
* 作者:     孙文健       (第六届摄像头)
* 特别鸣谢: 纪成         (第四届摄像头)
* PS: 该底层驱动是在技术大神、四朝元老——伟大的纪师兄的指导与帮助下完成的，故在此特别鸣谢。
*     欲深入学习Kinetis，可以登录纪师兄的博客http://blog.chinaaet.com/jihceng0622

* 程序版本: V1.02 
* 更新时间: 2012-05-01

*************************************************************************************/

#include "./KinetisConfig.h"

/* 变量与数据区声明 */
extern K_int8u_t __SP_INIT[];
extern K_int32u_t __RAM_Vector__[];

extern const Ptr_VTOR_t __vector_table[];
  
#pragma section = ".data"
#pragma section = ".data_init"
#pragma section = ".bss"
#pragma section = "CodeRelocate"
#pragma section = "CodeRelocateRam"

/* 外部函数声明 */
extern void main(void);
#if EN_InitHook_Kinetis != 0
  extern void HOOK_BeforeClk_Kinetis(void);
  extern void HOOK_AfterClk_Kinetis(void);
#endif
  
  

/* 全局变量定义 */
#if EN_ResetType_Kinetis != 0
  KEEP_Data_Kinetis K_int16u_t ResetType_Kinetis;   /* 复位类型 */
#endif

 
  
/************************************************************************************************ 
* DisWatchDog_Kinetis
* 禁用开门狗
************************************************************************************************/
static void DisWatchDog_Kinetis(void)
{
  UNLOCK_WatchDog;                            /* 解锁开门狗 */
  
  WDOG_STCTRLH &= ~WDOG_STCTRLH_WDOGEN_MASK;  /* 禁用开门狗 */
}

#if EN_CoreClkOut_Kinetis != 0
/************************************************************************************************ 
* OnCoreClk_Out
* 用PTA6脚输出频率为CoreClock频率1/2的时钟信号
************************************************************************************************/
static void OnCoreClk_Out(void)
{
  /* Set the trace clock to the core clock frequency */
  SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;
  /* Enable the TRACE_CLKOUT pin function on PTA6 (alt7 function) */
  PORTA_PCR6 = (PORT_PCR_MUX(7));
}
#endif 
#if EN_FlexClkOut_Kinetis != 0
/************************************************************************************************ 
* OnFlexClk_Out
* 用PTC3脚输出FlexClock
************************************************************************************************/
static void OnFlexClk_Out(void)
{
  /* Enable the clock to the FlexBus module */
  SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
   /* Enable the FB_CLKOUT function on PTC3 (alt5 function) */
  PORTC_PCR3 = (PORT_PCR_MUX(5));
}
#endif
/************************************************************************************************ 
* SetPLL_Kinetis
* 系统的锁相环设定，其完成的主要工作为: 设定CoreClock、BusClock、FlexClock、FlashClock
* (设置的具体频率在KinetisConfig.h中配置)
************************************************************************************************/
static void SetPLL_Kinetis(void)
{
  K_int32u_t temp_reg;
  K_int8u_t  i;
// First move to FBE mode
// Enable external oscillator, RANGE=2, HGO=1, EREFS=1, LP=0, IRCS=0
  MCG_C2 = MCG_C2_RANGE(1) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;

// after initialization of oscillator release latched state of oscillator and GPIO
  SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
  LLWU_CS |= LLWU_CS_ACKISO_MASK;
  
// Select external oscilator and Reference Divider and clear IREFS to start ext osc
// CLKS=2, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
  MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);

  /* if we aren't using an osc input we don't need to wait for the osc to init */

  while (MCG_S & MCG_S_IREFST_MASK){}; // wait for Reference clock Status bit to clear

  while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}; // Wait for clock status bits to show clock source is ext ref clk

// Now in FBE

  /* 设定PLL时钟 */
#if CORE_CLK_Kinetis  <= 110
  MCG_C5 = MCG_C5_PRDIV(REF_CLK_Kinetis/2 - 1);     /* PLLCLK == 2MHz */
#else
  #if   REF_CLK_Kinetis % 3 == 0
    MCG_C5 = MCG_C5_PRDIV(REF_CLK_Kinetis/3 - 1);   /* PLLCLK == 3MHz */
  #elif REF_CLK_Kinetis % 4 == 0
    MCG_C5 = MCG_C5_PRDIV(REF_CLK_Kinetis/4 - 1);   /* PLLCLK == 4MHz */
  #elif REF_CLK_Kinetis % 5 == 0
    MCG_C5 = MCG_C5_PRDIV(REF_CLK_Kinetis*2/5 - 1); /* PLLCLK == 2.5MHz */
  #endif
#endif 
  /*
   * Ensure MCG_C6 is at the reset default of 0. LOLIE disabled,
   * PLL disabled, clk monitor disabled, PLL VCO divider is clear 
   */  
  MCG_C6 = 0x0;

  /* 设定各时钟的分频数 */
  temp_reg = FMC_PFAPR; // store present value of FMC_PFAPR
  // set M0PFD through M7PFD to 1 to disable prefetch
  FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
             | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
             | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;
  
  // set clock dividers to desired value  
  SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0)       
              | SIM_CLKDIV1_OUTDIV2(DIV_BusClk_Kinetis - 1) 
              | SIM_CLKDIV1_OUTDIV3(DIV_FlexClk_Kinetis - 1) 
              | SIM_CLKDIV1_OUTDIV4(DIV_FlashClk_Kinetis - 1);
  // wait for dividers to change
  for (i = 0 ; i < DIV_FlashClk_Kinetis ; i++) {}
  FMC_PFAPR = temp_reg; // re-store original value of FMC_PFAPR  
  
  /* 设置倍频数,倍频数为VDIV+24 */
#if CORE_CLK_Kinetis  <= 110
  MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(CORE_CLK_Kinetis/2 - 24); 
#else
  #if   REF_CLK_Kinetis % 3 == 0
    MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(CORE_CLK_Kinetis/3 - 24); 
  #elif REF_CLK_Kinetis % 4 == 0
    MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(CORE_CLK_Kinetis/4 - 24);
  #elif REF_CLK_Kinetis % 5 == 0
    MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(CORE_CLK_Kinetis*2/5 - 24); 
  #endif
#endif
  
  while (!(MCG_S & MCG_S_PLLST_MASK)){}; // wait for PLL status bit to set

  while (!(MCG_S & MCG_S_LOCK_MASK)){}; // Wait for LOCK bit to set

// Now running PBE Mode

// Transition into PEE by setting CLKS to 0
// CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
  MCG_C1 &= ~MCG_C1_CLKS_MASK;

// Wait for clock status bits to update
  while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
} 

/************************************************************************************************ 
* OnGPIOClk_Kinetis
* 使能GPIO时钟 
************************************************************************************************/
static void OnGPIOClk_Kinetis(void)
{
  /* 使能IO口时钟 */
  SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK | SIM_SCGC5_PORTB_MASK
             | SIM_SCGC5_PORTC_MASK | SIM_SCGC5_PORTD_MASK
             | SIM_SCGC5_PORTE_MASK ;
}
/************************************************************************************************ 
* Init_Clock_Kinetis
* 初始化系统时钟,其完成的主要工作有: 设置系统时钟、使能外部基准时钟、将系统时钟通过IO口输出(可选) 
************************************************************************************************/
static void Init_Clock_Kinetis(void)
{      
   /* 设定系统时钟 */
  SetPLL_Kinetis();
  
  /* 使能外部基准时钟(很多模块需要用到该时钟) */
  OSC_CR |= OSC_CR_ERCLKEN_MASK;
  
#if  EN_CoreClkOut_Kinetis != 0
  /* 用PTA6输出CoreClock/2*/
  OnCoreClk_Out();
#endif
  
#if EN_FlexClkOut_Kinetis != 0  
  /* 用PTC3输出FlexClock */
  OnFlexClk_Out();
#endif
}
#if EN_ResetType_Kinetis != 0
/************************************************************************************************ 
* ReadResetType_Kinetis
* 读取寄存器ReadResetType_Kinetis以判定系统的复位类型
************************************************************************************************/
static void ReadResetType_Kinetis(void)
{
  ResetType_Kinetis = MC_SRSH;
  ResetType_Kinetis <<= 8;
  ResetType_Kinetis |= MC_SRSL;
}
#endif
/************************************************************************************************ 
* FillBss_0_Kinetis
* 将"BSS"数据区初始化为0
************************************************************************************************/
static void FillBss_0_Kinetis(void)
{ 
  K_int8u_t *bss_start = __section_begin(".bss");
  K_int8u_t *bss_end   = __section_end(".bss");
  K_int32u_t n = (K_int32u_t)bss_end - (K_int32u_t)bss_start;;
  
  if(n != 0)
  {
    while(n--)
    {
      *bss_start++ = 0;
    }
  }
}
/************************************************************************************************ 
* RomToRam_Kinetis
* 将部分ROM中的数据转移至RAM中
************************************************************************************************/
static void RomToRam_Kinetis(void)
{
  K_int32u_t n = (K_int32u_t)__section_end(".data_init") - (K_int32u_t)__section_begin(".data_init");
  K_int8u_t *ptr1 = __section_begin(".data"), *ptr2 = __section_begin(".data_init");
  
  K_int8u_t* code_relocate_ram = __section_begin("CodeRelocateRam");
  K_int8u_t* code_relocate = __section_begin("CodeRelocate");
  K_int8u_t* code_relocate_end = __section_end("CodeRelocate");
  
  if(n != 0)
  {
    do
    {
      *ptr1++ = *ptr2++;  
    } while(--n);  
  } 
  
  /* Copy functions from ROM to RAM */
  n = (K_int32u_t)code_relocate_end - (K_int32u_t)code_relocate;
  if(n != 0)
  {
    while (n--)
    {
      *code_relocate_ram++ = *code_relocate++;
    }
  }
}
/************************************************************************************************ 
* Init_VTOR_Kinetis
* 初始化中断向量表,将系统默认的中断向量表改为自定以的中断向量表 
************************************************************************************************/
static void Init_VTOR_Kinetis(void)
{
  K_int32u_t n = 120;
  K_int32u_t * ptr1 , * ptr2;
  
  ptr1 = (K_int32u_t *)__RAM_Vector__;

  ptr2 = (K_int32u_t *)__vector_table;
  
  /* 将向量表赋值到指定区域 */
/* 
    注意: SCB_VTOR的低位只能是0,必须保证".lcf"(".icf")中定义的__RAM_Vector__符合该条件.
*/
  if(ptr1 != ptr2)
  {
    do
    {
      *ptr1++ = *ptr2++;
    } while(--n);
  }
  
  SCB_VTOR = (K_int32u_t)__RAM_Vector__;
}

/************************************************************************************************ 
* Start_C_Kinetis
* Kinetis的C语言启动代码,被汇编语言程序段StartUp_Kinetis调用
* 负责完成ARM所必须的初始化操作,并跳转到用户的入口程序
************************************************************************************************/
void Start_C_Kinetis(void)
{
  DisWatchDog_Kinetis();            /* 禁用开门狗 */  
  
  OnGPIOClk_Kinetis();              /* 开启GPIO时钟 */
  
#if EN_InitHook_Kinetis != 0      
  HOOK_BeforeClk_Kinetis()          /* 执行用户定义的初始化接口 */
#endif
  
  Init_Clock_Kinetis();             /* 初始化系统时钟 */
  
#if EN_InitHook_Kinetis != 0
  HOOK_AfterClk_Kinetis();          /* 执行用户定义的初始化接口 */
#endif  
  
#if EN_ResetType_Kinetis != 0  
  ReadResetType_Kinetis();          /* 读取复位类型 */
#endif  
  
  RomToRam_Kinetis();               /* 将部分ROM中的数据转移到RAM中 */  
  FillBss_0_Kinetis();              /* 清零BSS区域 */
  Init_VTOR_Kinetis();              /* 初始化中断向量表 */     
      
  main();                           /* 跳转到main函数 */
}

