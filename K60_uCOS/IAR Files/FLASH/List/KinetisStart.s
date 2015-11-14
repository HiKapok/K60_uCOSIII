///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      03/Nov/2015  20:45:51 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\KinetisDrivers /
//                    \KinetisStart.c                                         /
//    Command line =  C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\KinetisDrivers /
//                    \KinetisStart.c -D COMPILER_IAR -lCN                    /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\FLASH\List\" -lB "C:\Users\WangChangan\Desktop\K1 /
//                    0–°∞Â∂®∏Â\IAR Files\FLASH\List\" -o                     /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\FLASH\Obj\" --no_cse --no_unroll --no_inline      /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files\IAR Systems\Embedded Workbench 6.0    /
//                    Evaluation\arm\INC\c\DLib_Config_Normal.h" -I           /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\..\Project_Headers\" -I                           /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\..\KinetisDrivers\" -I                            /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\..\ExtraFunction\" -I                             /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\..\Hardware_Interface\" -I                        /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\..\Make_Decision\" -I                             /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\..\Math\" -I "C:\Users\WangChangan\Desktop\K10–°∞ /
//                    Â∂®∏Â\IAR Files\..\Original_Process\" -I                /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\..\Platform\" -I "C:\Users\WangChangan\Desktop\K1 /
//                    0–°∞Â∂®∏Â\IAR Files\..\SD_System\" -I                   /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\..\Source\" -I "C:\Users\WangChangan\Desktop\K10– /
//                    °∞Â∂®∏Â\IAR Files\..\System_Init\" -Ol                  /
//    List file    =  C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR            /
//                    Files\FLASH\List\KinetisStart.s                         /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME KinetisStart

        #define SHT_PROGBITS 0x1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION `.data`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION `.data_init`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION CodeRelocate:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION CodeRelocateRam:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        EXTERN __Sword_Vector__
        EXTERN __vector_table
        EXTERN main

        PUBLIC Start_C_Kinetis

// C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\KinetisDrivers\KinetisStart.c
//    1 /************************************************************************************
//    2 
//    3 * KinetisStart.c
//    4 
//    5 * ∂®“ÂKinetisµƒ∆Ù∂Ø¥˙¬Î“‘º∞±ÿ“™µƒ≥ı ºªØ¥˙¬Î°£
//    6 
//    7 * À˘÷ß≥÷µƒ–æ∆¨:   K10œµ¡–”ÎK60œµ¡–
//    8 * À˘÷ß≥÷µƒ±‡“Î∆˜: CodeWarrior 10.x or IAR 6.30
//    9 
//   10 * ∏√µ◊≤„«˝∂Ø”…±‡“Î∆˜◊‘∂Ø…˙≥…µƒ∆Ù∂Ø¥˙¬Î∫Õ∑…Àºø®∂˚πŸ∑Ω¿˝≥Ã’˚¿Ì°¢–ﬁ∏ƒ∂¯≥…°£
//   11 
//   12 * ∞Ê»®À˘”–: …Ω∂´¥Û—ß÷«ƒ‹≥µπ§◊˜ “
//   13 * ◊˜’ﬂ:     ÀÔŒƒΩ°       (µ⁄¡˘ΩÏ…„œÒÕ∑)
//   14 * Ãÿ±√˘–ª: ºÕ≥…         (µ⁄ÀƒΩÏ…„œÒÕ∑)
//   15 * PS: ∏√µ◊≤„«˝∂Ø «‘⁄ºº ı¥Û…Ò°¢Àƒ≥Ø‘™¿œ°™°™Œ∞¥ÛµƒºÕ ¶–÷µƒ÷∏µº”Î∞Ô÷˙œ¬ÕÍ≥…µƒ£¨π ‘⁄¥ÀÃÿ±√˘–ª°£
//   16 *     ”˚…Ó»Î—ßœ∞Kinetis£¨ø…“‘µ«¬ººÕ ¶–÷µƒ≤©øÕhttp://blog.chinaaet.com/jihceng0622
//   17 
//   18 * ≥Ã–Ú∞Ê±æ: V1.02 
//   19 * ∏¸–¬ ±º‰: 2012-05-01
//   20 
//   21 *************************************************************************************/
//   22 
//   23 #include "./KinetisConfig.h"
//   24 
//   25 /* ±‰¡ø”Î ˝æ›«¯…˘√˜ */
//   26 extern K_int8u_t __SP_INIT[];
//   27 extern K_int32u_t __Sword_Vector__[];
//   28 
//   29 #if   defined(COMPILER_CW)  
//   30 
//   31   extern const Ptr_VTOR_t VectorTable[];
//   32 
//   33   extern K_int8u_t __DATA_RAM[];              
//   34   extern K_int8u_t __DATA_ROM[];
//   35   extern K_int8u_t __DATA_END[];
//   36   
//   37 #elif defined(COMPILER_IAR)  
//   38   
//   39   extern const Ptr_VTOR_t __vector_table[];
//   40   
//   41   #pragma section = ".data"
//   42   #pragma section = ".data_init"
//   43   #pragma section = ".bss"
//   44   #pragma section = "CodeRelocate"
//   45   #pragma section = "CodeRelocateRam"
//   46   
//   47 #endif
//   48 
//   49 
//   50 
//   51 /* Õ‚≤ø∫Ø ˝…˘√˜ */
//   52 extern void main(void);
//   53 #if EN_InitHook_Kinetis != 0
//   54   extern void HOOK_BeforeClk_Kinetis(void);
//   55   extern void HOOK_AfterClk_Kinetis(void);
//   56 #endif
//   57   
//   58   
//   59 
//   60 /* »´æ÷±‰¡ø∂®“Â */
//   61 #if EN_ResetType_Kinetis != 0
//   62   KEEP_Data_Kinetis K_int16u_t ResetType_Kinetis;   /* ∏¥Œª¿‡–Õ */
//   63 #endif
//   64 
//   65  
//   66   
//   67 /************************************************************************************************ 
//   68 * DisWatchDog_Kinetis
//   69 * Ω˚”√ø™√≈π∑
//   70 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   71 static void DisWatchDog_Kinetis(void)
//   72 {
//   73   UNLOCK_WatchDog;                            /* Ω‚À¯ø™√≈π∑ */
DisWatchDog_Kinetis:
        LDR.N    R0,??DataTable6  ;; 0x4005200e
        MOVW     R1,#+50464
        STRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable6  ;; 0x4005200e
        MOVW     R1,#+55592
        STRH     R1,[R0, #+0]
//   74   
//   75   WDOG_STCTRLH &= ~WDOG_STCTRLH_WDOGEN_MASK;  /* Ω˚”√ø™√≈π∑ */
        LDR.N    R0,??DataTable6_1  ;; 0x40052000
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+65534
        ANDS     R0,R1,R0
        LDR.N    R1,??DataTable6_1  ;; 0x40052000
        STRH     R0,[R1, #+0]
//   76 }
        BX       LR               ;; return
//   77 
//   78 #if EN_CoreClkOut_Kinetis != 0
//   79 /************************************************************************************************ 
//   80 * OnCoreClk_Out
//   81 * ”√PTA6Ω≈ ‰≥ˆ∆µ¬ Œ™CoreClock∆µ¬ 1/2µƒ ±÷”–≈∫≈
//   82 ************************************************************************************************/
//   83 static void OnCoreClk_Out(void)
//   84 {
//   85   /* Set the trace clock to the core clock frequency */
//   86   SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;
//   87   /* Enable the TRACE_CLKOUT pin function on PTA6 (alt7 function) */
//   88   PORTA_PCR6 = (PORT_PCR_MUX(7));
//   89 }
//   90 #endif 
//   91 #if EN_FlexClkOut_Kinetis != 0
//   92 /************************************************************************************************ 
//   93 * OnFlexClk_Out
//   94 * ”√PTC3Ω≈ ‰≥ˆFlexClock
//   95 ************************************************************************************************/
//   96 static void OnFlexClk_Out(void)
//   97 {
//   98   /* Enable the clock to the FlexBus module */
//   99   SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
//  100    /* Enable the FB_CLKOUT function on PTC3 (alt5 function) */
//  101   PORTC_PCR3 = (PORT_PCR_MUX(5));
//  102 }
//  103 #endif
//  104 /************************************************************************************************ 
//  105 * SetPLL_Kinetis
//  106 * œµÕ≥µƒÀ¯œ‡ª∑…Ë∂®£¨∆‰ÕÍ≥…µƒ÷˜“™π§◊˜Œ™: …Ë∂®CoreClock°¢BusClock°¢FlexClock°¢FlashClock
//  107 * (…Ë÷√µƒæﬂÃÂ∆µ¬ ‘⁄KinetisConfig.h÷–≈‰÷√)
//  108 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  109 static void SetPLL_Kinetis(void)
//  110 {
//  111   K_int32u_t temp_reg;
//  112   K_int8u_t  i;
//  113 // First move to FBE mode
//  114 // Enable external oscillator, RANGE=2, HGO=1, EREFS=1, LP=0, IRCS=0
//  115   MCG_C2 = MCG_C2_RANGE(1) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
SetPLL_Kinetis:
        LDR.N    R0,??DataTable6_2  ;; 0x40064001
        MOVS     R1,#+28
        STRB     R1,[R0, #+0]
//  116 
//  117 // after initialization of oscillator release latched state of oscillator and GPIO
//  118   SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
        LDR.N    R0,??DataTable6_3  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable6_3  ;; 0x40048034
        STR      R0,[R1, #+0]
//  119   LLWU_CS |= LLWU_CS_ACKISO_MASK;
        LDR.N    R0,??DataTable6_4  ;; 0x4007c008
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable6_4  ;; 0x4007c008
        STRB     R0,[R1, #+0]
//  120   
//  121 // Select external oscilator and Reference Divider and clear IREFS to start ext osc
//  122 // CLKS=2, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  123   MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable6_5  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  124 
//  125   /* if we aren't using an osc input we don't need to wait for the osc to init */
//  126 
//  127   while (MCG_S & MCG_S_IREFST_MASK){}; // wait for Reference clock Status bit to clear
??SetPLL_Kinetis_0:
        LDR.N    R0,??DataTable6_6  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??SetPLL_Kinetis_0
//  128 
//  129   while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}; // Wait for clock status bits to show clock source is ext ref clk
??SetPLL_Kinetis_1:
        LDR.N    R0,??DataTable6_6  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??SetPLL_Kinetis_1
//  130 
//  131 // Now in FBE
//  132 
//  133   /* …Ë∂®PLL ±÷” */
//  134 #if CORE_CLK_Kinetis  <= 110
//  135   MCG_C5 = MCG_C5_PRDIV(REF_CLK_Kinetis/2 - 1);     /* PLLCLK == 2MHz */
//  136 #else
//  137   #if   REF_CLK_Kinetis % 3 == 0
//  138     MCG_C5 = MCG_C5_PRDIV(REF_CLK_Kinetis/3 - 1);   /* PLLCLK == 3MHz */
//  139   #elif REF_CLK_Kinetis % 4 == 0
//  140     MCG_C5 = MCG_C5_PRDIV(REF_CLK_Kinetis/4 - 1);   /* PLLCLK == 4MHz */
        LDR.N    R0,??DataTable6_7  ;; 0x40064004
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  141   #elif REF_CLK_Kinetis % 5 == 0
//  142     MCG_C5 = MCG_C5_PRDIV(REF_CLK_Kinetis*2/5 - 1); /* PLLCLK == 2.5MHz */
//  143   #endif
//  144 #endif 
//  145   /*
//  146    * Ensure MCG_C6 is at the reset default of 0. LOLIE disabled,
//  147    * PLL disabled, clk monitor disabled, PLL VCO divider is clear 
//  148    */  
//  149   MCG_C6 = 0x0;
        LDR.N    R0,??DataTable6_8  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  150 
//  151   /* …Ë∂®∏˜ ±÷”µƒ∑÷∆µ ˝ */
//  152   temp_reg = FMC_PFAPR; // store present value of FMC_PFAPR
        LDR.N    R0,??DataTable6_9  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  153   // set M0PFD through M7PFD to 1 to disable prefetch
//  154   FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  155              | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  156              | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;
        LDR.N    R1,??DataTable6_9  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable6_9  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  157   
//  158   // set clock dividers to desired value  
//  159   SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0)       
//  160               | SIM_CLKDIV1_OUTDIV2(DIV_BusClk_Kinetis - 1) 
//  161               | SIM_CLKDIV1_OUTDIV3(DIV_FlexClk_Kinetis - 1) 
//  162               | SIM_CLKDIV1_OUTDIV4(DIV_FlashClk_Kinetis - 1);
        LDR.N    R1,??DataTable6_10  ;; 0x40048044
        LDR.N    R2,??DataTable6_11  ;; 0x1130000
        STR      R2,[R1, #+0]
//  163   // wait for dividers to change
//  164   for (i = 0 ; i < DIV_FlashClk_Kinetis ; i++) {}
        MOVS     R1,#+0
        B.N      ??SetPLL_Kinetis_2
??SetPLL_Kinetis_3:
        ADDS     R1,R1,#+1
??SetPLL_Kinetis_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+4
        BCC.N    ??SetPLL_Kinetis_3
//  165   FMC_PFAPR = temp_reg; // re-store original value of FMC_PFAPR  
        LDR.N    R1,??DataTable6_9  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  166   
//  167   /* …Ë÷√±∂∆µ ˝,±∂∆µ ˝Œ™VDIV+24 */
//  168 #if CORE_CLK_Kinetis  <= 110
//  169   MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(CORE_CLK_Kinetis/2 - 24); 
//  170 #else
//  171   #if   REF_CLK_Kinetis % 3 == 0
//  172     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(CORE_CLK_Kinetis/3 - 24); 
//  173   #elif REF_CLK_Kinetis % 4 == 0
//  174     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(CORE_CLK_Kinetis/4 - 24);
        LDR.N    R0,??DataTable6_8  ;; 0x40064005
        MOVS     R1,#+70
        STRB     R1,[R0, #+0]
//  175   #elif REF_CLK_Kinetis % 5 == 0
//  176     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(CORE_CLK_Kinetis*2/5 - 24); 
//  177   #endif
//  178 #endif
//  179   
//  180   while (!(MCG_S & MCG_S_PLLST_MASK)){}; // wait for PLL status bit to set
??SetPLL_Kinetis_4:
        LDR.N    R0,??DataTable6_6  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??SetPLL_Kinetis_4
//  181 
//  182   while (!(MCG_S & MCG_S_LOCK_MASK)){}; // Wait for LOCK bit to set
??SetPLL_Kinetis_5:
        LDR.N    R0,??DataTable6_6  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??SetPLL_Kinetis_5
//  183 
//  184 // Now running PBE Mode
//  185 
//  186 // Transition into PEE by setting CLKS to 0
//  187 // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  188   MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable6_5  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable6_5  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  189 
//  190 // Wait for clock status bits to update
//  191   while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
??SetPLL_Kinetis_6:
        LDR.N    R0,??DataTable6_6  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??SetPLL_Kinetis_6
//  192 } 
        BX       LR               ;; return
//  193 
//  194 /************************************************************************************************ 
//  195 * OnGPIOClk_Kinetis
//  196 *  πƒ‹GPIO ±÷” 
//  197 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  198 static void OnGPIOClk_Kinetis(void)
//  199 {
//  200   /*  πƒ‹IOø⁄ ±÷” */
//  201   SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK | SIM_SCGC5_PORTB_MASK
//  202              | SIM_SCGC5_PORTC_MASK | SIM_SCGC5_PORTD_MASK
//  203              | SIM_SCGC5_PORTE_MASK ;
OnGPIOClk_Kinetis:
        LDR.N    R0,??DataTable6_12  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.N    R1,??DataTable6_12  ;; 0x40048038
        STR      R0,[R1, #+0]
//  204 }
        BX       LR               ;; return
//  205 /************************************************************************************************ 
//  206 * Init_Clock_Kinetis
//  207 * ≥ı ºªØœµÕ≥ ±÷”,∆‰ÕÍ≥…µƒ÷˜“™π§◊˜”–: …Ë÷√œµÕ≥ ±÷”°¢ πƒ‹Õ‚≤øª˘◊º ±÷”°¢Ω´œµÕ≥ ±÷”Õ®π˝IOø⁄ ‰≥ˆ(ø…—°) 
//  208 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  209 static void Init_Clock_Kinetis(void)
//  210 {      
Init_Clock_Kinetis:
        PUSH     {R7,LR}
//  211    /* …Ë∂®œµÕ≥ ±÷” */
//  212   SetPLL_Kinetis();
        BL       SetPLL_Kinetis
//  213   
//  214   /*  πƒ‹Õ‚≤øª˘◊º ±÷”(∫‹∂‡ƒ£øÈ–Ë“™”√µΩ∏√ ±÷”) */
//  215   OSC_CR |= OSC_CR_ERCLKEN_MASK;
        LDR.N    R0,??DataTable6_13  ;; 0x40065000
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable6_13  ;; 0x40065000
        STRB     R0,[R1, #+0]
//  216   
//  217 #if  EN_CoreClkOut_Kinetis != 0
//  218   /* ”√PTA6 ‰≥ˆCoreClock/2*/
//  219   OnCoreClk_Out();
//  220 #endif
//  221   
//  222 #if EN_FlexClkOut_Kinetis != 0  
//  223   /* ”√PTC3 ‰≥ˆFlexClock */
//  224   OnFlexClk_Out();
//  225 #endif
//  226 }
        POP      {R0,PC}          ;; return
//  227 #if EN_ResetType_Kinetis != 0
//  228 /************************************************************************************************ 
//  229 * ReadResetType_Kinetis
//  230 * ∂¡»°ºƒ¥Ê∆˜ReadResetType_Kinetis“‘≈–∂®œµÕ≥µƒ∏¥Œª¿‡–Õ
//  231 ************************************************************************************************/
//  232 static void ReadResetType_Kinetis(void)
//  233 {
//  234   ResetType_Kinetis = MC_SRSH;
//  235   ResetType_Kinetis <<= 8;
//  236   ResetType_Kinetis |= MC_SRSL;
//  237 }
//  238 #endif
//  239 /************************************************************************************************ 
//  240 * FillBss_0_Kinetis
//  241 * Ω´"BSS" ˝æ›«¯≥ı ºªØŒ™0
//  242 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  243 static void FillBss_0_Kinetis(void)
//  244 { 
//  245 #if   defined(COMPILER_CW)  
//  246   
//  247   extern K_int8u_t __START_BSS[];
//  248   extern K_int8u_t __END_BSS[];
//  249   
//  250   memset(__START_BSS, 0, (__END_BSS - __START_BSS));  
//  251   
//  252 #elif defined(COMPILER_IAR) 
//  253   
//  254   K_int8u_t *bss_start = __section_begin(".bss");
FillBss_0_Kinetis:
        LDR.N    R0,??DataTable6_14
//  255   K_int8u_t *bss_end   = __section_end(".bss");
        LDR.N    R1,??DataTable6_15
//  256   K_int32u_t n = (K_int32u_t)bss_end - (K_int32u_t)bss_start;;
        SUBS     R1,R1,R0
//  257   
//  258   if(n != 0)
        CMP      R1,#+0
        BNE.N    ??FillBss_0_Kinetis_0
        B.N      ??FillBss_0_Kinetis_1
//  259   {
//  260     while(n--)
//  261     {
//  262       *bss_start++ = 0;
??FillBss_0_Kinetis_2:
        MOVS     R2,#+0
        STRB     R2,[R0, #+0]
        ADDS     R0,R0,#+1
//  263     }
??FillBss_0_Kinetis_0:
        MOVS     R2,R1
        SUBS     R1,R2,#+1
        CMP      R2,#+0
        BNE.N    ??FillBss_0_Kinetis_2
//  264   }
//  265   
//  266 #endif  
//  267 }
??FillBss_0_Kinetis_1:
        BX       LR               ;; return
//  268 /************************************************************************************************ 
//  269 * RomToRam_Kinetis
//  270 * Ω´≤ø∑÷ROM÷–µƒ ˝æ›◊™“∆÷¡RAM÷–
//  271 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  272 static void RomToRam_Kinetis(void)
//  273 {
RomToRam_Kinetis:
        PUSH     {R4-R6}
//  274 #if   defined(COMPILER_CW) 
//  275   
//  276   K_int32u_t n = (K_int32u_t)__DATA_END - (K_int32u_t)__DATA_RAM;
//  277   K_int8u_t *ptr1 = __DATA_RAM, *ptr2 = __DATA_ROM;
//  278   
//  279 #elif defined(COMPILER_IAR) 
//  280   
//  281   K_int32u_t n = (K_int32u_t)__section_end(".data_init") - (K_int32u_t)__section_begin(".data_init");
        LDR.N    R0,??DataTable6_16
        LDR.N    R1,??DataTable6_17
        SUBS     R0,R0,R1
//  282   K_int8u_t *ptr1 = __section_begin(".data"), *ptr2 = __section_begin(".data_init");
        LDR.N    R1,??DataTable6_18
        LDR.N    R2,??DataTable6_17
//  283   
//  284   K_int8u_t* code_relocate_ram = __section_begin("CodeRelocateRam");
        LDR.N    R3,??DataTable6_19
//  285   K_int8u_t* code_relocate = __section_begin("CodeRelocate");
        LDR.N    R4,??DataTable6_20
//  286   K_int8u_t* code_relocate_end = __section_end("CodeRelocate");
        LDR.N    R5,??DataTable6_21
//  287   
//  288 #endif  
//  289   
//  290   if(n != 0)
        CMP      R0,#+0
        BEQ.N    ??RomToRam_Kinetis_0
//  291   {
//  292     do
//  293     {
//  294       *ptr1++ = *ptr2++;  
??RomToRam_Kinetis_1:
        LDRB     R6,[R2, #+0]
        STRB     R6,[R1, #+0]
        ADDS     R2,R2,#+1
        ADDS     R1,R1,#+1
//  295     } while(--n);  
        SUBS     R0,R0,#+1
        CMP      R0,#+0
        BNE.N    ??RomToRam_Kinetis_1
//  296   } 
//  297   
//  298 #if defined(COMPILER_IAR)
//  299   
//  300   /* Copy functions from ROM to RAM */
//  301   n = (K_int32u_t)code_relocate_end - (K_int32u_t)code_relocate;
??RomToRam_Kinetis_0:
        SUBS     R0,R5,R4
//  302   if(n != 0)
        CMP      R0,#+0
        BNE.N    ??RomToRam_Kinetis_2
        B.N      ??RomToRam_Kinetis_3
//  303   {
//  304     while (n--)
//  305     {
//  306       *code_relocate_ram++ = *code_relocate++;
??RomToRam_Kinetis_4:
        LDRB     R1,[R4, #+0]
        STRB     R1,[R3, #+0]
        ADDS     R4,R4,#+1
        ADDS     R3,R3,#+1
//  307     }
??RomToRam_Kinetis_2:
        MOVS     R1,R0
        SUBS     R0,R1,#+1
        CMP      R1,#+0
        BNE.N    ??RomToRam_Kinetis_4
//  308   }
//  309   
//  310 #endif
//  311 }
??RomToRam_Kinetis_3:
        POP      {R4-R6}
        BX       LR               ;; return
//  312 /************************************************************************************************ 
//  313 * Init_VTOR_Kinetis
//  314 * ≥ı ºªØ÷–∂œœÚ¡ø±Ì,Ω´œµÕ≥ƒ¨»œµƒ÷–∂œœÚ¡ø±Ì∏ƒŒ™◊‘∂®“‘µƒ÷–∂œœÚ¡ø±Ì 
//  315 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  316 static void Init_VTOR_Kinetis(void)
//  317 {
//  318   K_int32u_t n = 120;
Init_VTOR_Kinetis:
        MOVS     R0,#+120
//  319   K_int32u_t * ptr1 , * ptr2;
//  320   
//  321   ptr1 = (K_int32u_t *)__Sword_Vector__;
        LDR.N    R1,??DataTable6_22
//  322 #if   defined(COMPILER_CW)   
//  323   ptr2 = (K_int32u_t *)VectorTable;
//  324 #elif defined(COMPILER_IAR) 
//  325   ptr2 = (K_int32u_t *)__vector_table;
        LDR.N    R2,??DataTable6_23
//  326 #endif  
//  327   
//  328   /* Ω´œÚ¡ø±Ì∏≥÷µµΩ÷∏∂®«¯”Ú */
//  329 /* 
//  330     ◊¢“‚: SCB_VTORµƒµÕŒª÷ªƒ‹ «0,±ÿ–Î±£÷§".lcf"(".icf")÷–∂®“Âµƒ__Sword_Vector__∑˚∫œ∏√Ãıº˛.
//  331 */
//  332   if(ptr1 != ptr2)
        CMP      R1,R2
        BEQ.N    ??Init_VTOR_Kinetis_0
//  333   {
//  334     do
//  335     {
//  336       *ptr1++ = *ptr2++;
??Init_VTOR_Kinetis_1:
        LDR      R3,[R2, #+0]
        STR      R3,[R1, #+0]
        ADDS     R2,R2,#+4
        ADDS     R1,R1,#+4
//  337     } while(--n);
        SUBS     R0,R0,#+1
        CMP      R0,#+0
        BNE.N    ??Init_VTOR_Kinetis_1
//  338   }
//  339   
//  340   SCB_VTOR = (K_int32u_t)__Sword_Vector__;
??Init_VTOR_Kinetis_0:
        LDR.N    R0,??DataTable6_24  ;; 0xe000ed08
        LDR.N    R1,??DataTable6_22
        STR      R1,[R0, #+0]
//  341 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x4005200e

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x40052000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0x40064001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x4007c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0x40064000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     0x40064006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     0x40064004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     0x40064005

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     0x4001f000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     0x40048044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     0x1130000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_12:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_13:
        DC32     0x40065000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_14:
        DC32     SFB(`.bss`)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_15:
        DC32     SFE(`.bss`)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_16:
        DC32     SFE(`.data_init`)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_17:
        DC32     SFB(`.data_init`)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_18:
        DC32     SFB(`.data`)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_19:
        DC32     SFB(CodeRelocateRam)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_20:
        DC32     SFB(CodeRelocate)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_21:
        DC32     SFE(CodeRelocate)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_22:
        DC32     __Sword_Vector__

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_23:
        DC32     __vector_table

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_24:
        DC32     0xe000ed08
//  342 
//  343 #if   defined(COMPILER_CW)
//  344 /************************************************************************************************ 
//  345 * StartUp_Kinetis
//  346 * Kinetisµƒ∆Ù∂Ø¥˙¬Î(ª„±‡”Ô—‘∫Ø ˝,Ωˆ’Î∂‘CodeWarrior 10.x)
//  347 * º¥œµÕ≥…œµÁ ±¥¶¿Ì∆˜÷¥––µƒµ⁄“ª∂Œ¥˙¬Î,∏∫‘ÕÍ≥…ARMÀ˘±ÿ–Îµƒ≥ı ºªØ≤Ÿ◊˜,≤¢Ã¯◊™µΩ”√ªßµƒ»Îø⁄≥Ã–Ú
//  348 ************************************************************************************************/
//  349 asm void StartUp_Kinetis(void)
//  350 {
//  351   CPSID   i                         /* πÿ÷–∂œ */    
//  352   
//  353   bl   DisWatchDog_Kinetis          /* Ω˚”√ø™√≈π∑ */  
//  354   
//  355   lda  r0,__SP_INIT                 /* ≥ı ºªØSP÷∏’Î */ 
//  356   mov  sp,r0
//  357   sub  sp,#4
//  358   mov  r0,#0
//  359   mvn  r0,r0
//  360   str  r0,[sp,#0]
//  361   add  sp,#4
//  362   
//  363   bl  OnGPIOClk_Kinetis             /* ø™∆ÙGPIO ±÷” */
//  364   
//  365 #if EN_InitHook_Kinetis != 0      
//  366   bl  HOOK_BeforeClk_Kinetis        /* ÷¥––”√ªß∂®“Âµƒ≥ı ºªØΩ”ø⁄ */
//  367 #endif
//  368   
//  369   bl  Init_Clock_Kinetis            /* ≥ı ºªØœµÕ≥ ±÷” */
//  370   
//  371 #if EN_InitHook_Kinetis != 0
//  372   bl  HOOK_AfterClk_Kinetis         /* ÷¥––”√ªß∂®“Âµƒ≥ı ºªØΩ”ø⁄ */
//  373 #endif  
//  374   
//  375 #if EN_ResetType_Kinetis != 0  
//  376   bl  ReadResetType_Kinetis         /* ∂¡»°∏¥Œª¿‡–Õ */
//  377 #endif  
//  378   
//  379   bl  RomToRam_Kinetis              /* Ω´≤ø∑÷ROM÷–µƒ ˝æ›◊™“∆µΩRAM÷– */  
//  380   bl  FillBss_0_Kinetis             /* «Â¡„BSS«¯”Ú */
//  381   bl  Init_VTOR_Kinetis             /* ≥ı ºªØ÷–∂œœÚ¡ø±Ì */     
//  382       
//  383   bl  main                          /* Ã¯◊™µΩmain∫Ø ˝ */
//  384 }
//  385 #elif defined(COMPILER_IAR)
//  386 /************************************************************************************************ 
//  387 * Start_C_Kinetis
//  388 * KinetisµƒC”Ô—‘∆Ù∂Ø¥˙¬Î,±ªª„±‡”Ô—‘≥Ã–Ú∂ŒStartUp_Kinetisµ˜”√
//  389 * ∏∫‘ÕÍ≥…ARMÀ˘±ÿ–Îµƒ≥ı ºªØ≤Ÿ◊˜,≤¢Ã¯◊™µΩ”√ªßµƒ»Îø⁄≥Ã–Ú
//  390 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  391 void Start_C_Kinetis(void)
//  392 {
Start_C_Kinetis:
        PUSH     {R7,LR}
//  393   DisWatchDog_Kinetis();            /* Ω˚”√ø™√≈π∑ */  
        BL       DisWatchDog_Kinetis
//  394   
//  395   OnGPIOClk_Kinetis();              /* ø™∆ÙGPIO ±÷” */
        BL       OnGPIOClk_Kinetis
//  396   
//  397 #if EN_InitHook_Kinetis != 0      
//  398   HOOK_BeforeClk_Kinetis()          /* ÷¥––”√ªß∂®“Âµƒ≥ı ºªØΩ”ø⁄ */
//  399 #endif
//  400   
//  401   Init_Clock_Kinetis();             /* ≥ı ºªØœµÕ≥ ±÷” */
        BL       Init_Clock_Kinetis
//  402   
//  403 #if EN_InitHook_Kinetis != 0
//  404   HOOK_AfterClk_Kinetis();          /* ÷¥––”√ªß∂®“Âµƒ≥ı ºªØΩ”ø⁄ */
//  405 #endif  
//  406   
//  407 #if EN_ResetType_Kinetis != 0  
//  408   ReadResetType_Kinetis();          /* ∂¡»°∏¥Œª¿‡–Õ */
//  409 #endif  
//  410   
//  411   RomToRam_Kinetis();               /* Ω´≤ø∑÷ROM÷–µƒ ˝æ›◊™“∆µΩRAM÷– */  
        BL       RomToRam_Kinetis
//  412   FillBss_0_Kinetis();              /* «Â¡„BSS«¯”Ú */
        BL       FillBss_0_Kinetis
//  413   Init_VTOR_Kinetis();              /* ≥ı ºªØ÷–∂œœÚ¡ø±Ì */     
        BL       Init_VTOR_Kinetis
//  414       
//  415   main();                           /* Ã¯◊™µΩmain∫Ø ˝ */
        BL       main
//  416 }
        POP      {R0,PC}          ;; return

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.data`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.data_init`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION CodeRelocate:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION CodeRelocateRam:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  417 #endif
// 
// 480 bytes in section .text
// 
// 480 bytes of CODE memory
//
//Errors: none
//Warnings: none
