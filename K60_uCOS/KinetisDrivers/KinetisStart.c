/************************************************************************************

* KinetisStart.c

* ����Kinetis�����������Լ���Ҫ�ĳ�ʼ�����롣

* ��֧�ֵ�оƬ:   K10ϵ����K60ϵ��
* ��֧�ֵı�����: CodeWarrior 10.x or IAR 6.30

* �õײ������ɱ������Զ����ɵ���������ͷ�˼�����ٷ����������޸Ķ��ɡ�

* ��Ȩ����: ɽ����ѧ���ܳ�������
* ����:     ���Ľ�       (����������ͷ)
* �ر���л: �ͳ�         (���Ľ�����ͷ)
* PS: �õײ��������ڼ��������ĳ�Ԫ�ϡ���ΰ��ļ�ʦ�ֵ�ָ�����������ɵģ����ڴ��ر���л��
*     ������ѧϰKinetis�����Ե�¼��ʦ�ֵĲ���http://blog.chinaaet.com/jihceng0622

* ����汾: V1.02 
* ����ʱ��: 2012-05-01

*************************************************************************************/

#include "./KinetisConfig.h"

/* ���������������� */
extern K_int8u_t __SP_INIT[];
extern K_int32u_t __RAM_Vector__[];

extern const Ptr_VTOR_t __vector_table[];
  
#pragma section = ".data"
#pragma section = ".data_init"
#pragma section = ".bss"
#pragma section = "CodeRelocate"
#pragma section = "CodeRelocateRam"

/* �ⲿ�������� */
extern void main(void);
#if EN_InitHook_Kinetis != 0
  extern void HOOK_BeforeClk_Kinetis(void);
  extern void HOOK_AfterClk_Kinetis(void);
#endif
  
  

/* ȫ�ֱ������� */
#if EN_ResetType_Kinetis != 0
  KEEP_Data_Kinetis K_int16u_t ResetType_Kinetis;   /* ��λ���� */
#endif

 
  
/************************************************************************************************ 
* DisWatchDog_Kinetis
* ���ÿ��Ź�
************************************************************************************************/
static void DisWatchDog_Kinetis(void)
{
  UNLOCK_WatchDog;                            /* �������Ź� */
  
  WDOG_STCTRLH &= ~WDOG_STCTRLH_WDOGEN_MASK;  /* ���ÿ��Ź� */
}

#if EN_CoreClkOut_Kinetis != 0
/************************************************************************************************ 
* OnCoreClk_Out
* ��PTA6�����Ƶ��ΪCoreClockƵ��1/2��ʱ���ź�
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
* ��PTC3�����FlexClock
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
* ϵͳ�����໷�趨������ɵ���Ҫ����Ϊ: �趨CoreClock��BusClock��FlexClock��FlashClock
* (���õľ���Ƶ����KinetisConfig.h������)
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

  /* �趨PLLʱ�� */
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

  /* �趨��ʱ�ӵķ�Ƶ�� */
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
  
  /* ���ñ�Ƶ��,��Ƶ��ΪVDIV+24 */
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
* ʹ��GPIOʱ�� 
************************************************************************************************/
static void OnGPIOClk_Kinetis(void)
{
  /* ʹ��IO��ʱ�� */
  SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK | SIM_SCGC5_PORTB_MASK
             | SIM_SCGC5_PORTC_MASK | SIM_SCGC5_PORTD_MASK
             | SIM_SCGC5_PORTE_MASK ;
}
/************************************************************************************************ 
* Init_Clock_Kinetis
* ��ʼ��ϵͳʱ��,����ɵ���Ҫ������: ����ϵͳʱ�ӡ�ʹ���ⲿ��׼ʱ�ӡ���ϵͳʱ��ͨ��IO�����(��ѡ) 
************************************************************************************************/
static void Init_Clock_Kinetis(void)
{      
   /* �趨ϵͳʱ�� */
  SetPLL_Kinetis();
  
  /* ʹ���ⲿ��׼ʱ��(�ܶ�ģ����Ҫ�õ���ʱ��) */
  OSC_CR |= OSC_CR_ERCLKEN_MASK;
  
#if  EN_CoreClkOut_Kinetis != 0
  /* ��PTA6���CoreClock/2*/
  OnCoreClk_Out();
#endif
  
#if EN_FlexClkOut_Kinetis != 0  
  /* ��PTC3���FlexClock */
  OnFlexClk_Out();
#endif
}
#if EN_ResetType_Kinetis != 0
/************************************************************************************************ 
* ReadResetType_Kinetis
* ��ȡ�Ĵ���ReadResetType_Kinetis���ж�ϵͳ�ĸ�λ����
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
* ��"BSS"��������ʼ��Ϊ0
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
* ������ROM�е�����ת����RAM��
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
* ��ʼ���ж�������,��ϵͳĬ�ϵ��ж��������Ϊ�Զ��Ե��ж������� 
************************************************************************************************/
static void Init_VTOR_Kinetis(void)
{
  K_int32u_t n = 120;
  K_int32u_t * ptr1 , * ptr2;
  
  ptr1 = (K_int32u_t *)__RAM_Vector__;

  ptr2 = (K_int32u_t *)__vector_table;
  
  /* ��������ֵ��ָ������ */
/* 
    ע��: SCB_VTOR�ĵ�λֻ����0,���뱣֤".lcf"(".icf")�ж����__RAM_Vector__���ϸ�����.
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
* Kinetis��C������������,��������Գ����StartUp_Kinetis����
* �������ARM������ĳ�ʼ������,����ת���û�����ڳ���
************************************************************************************************/
void Start_C_Kinetis(void)
{
  DisWatchDog_Kinetis();            /* ���ÿ��Ź� */  
  
  OnGPIOClk_Kinetis();              /* ����GPIOʱ�� */
  
#if EN_InitHook_Kinetis != 0      
  HOOK_BeforeClk_Kinetis()          /* ִ���û�����ĳ�ʼ���ӿ� */
#endif
  
  Init_Clock_Kinetis();             /* ��ʼ��ϵͳʱ�� */
  
#if EN_InitHook_Kinetis != 0
  HOOK_AfterClk_Kinetis();          /* ִ���û�����ĳ�ʼ���ӿ� */
#endif  
  
#if EN_ResetType_Kinetis != 0  
  ReadResetType_Kinetis();          /* ��ȡ��λ���� */
#endif  
  
  RomToRam_Kinetis();               /* ������ROM�е�����ת�Ƶ�RAM�� */  
  FillBss_0_Kinetis();              /* ����BSS���� */
  Init_VTOR_Kinetis();              /* ��ʼ���ж������� */     
      
  main();                           /* ��ת��main���� */
}

