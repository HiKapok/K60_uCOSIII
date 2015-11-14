///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      03/Nov/2015  20:45:50 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\HardwareInterf /
//                    ace\Interrupt.c                                         /
//    Command line =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\HardwareInterf /
//                    ace\Interrupt.c -D COMPILER_IAR -lCN                    /
//                    "C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\IAR           /
//                    Files\FLASH\List\" -lB "C:\Users\WangChangan\Desktop\K1 /
//                    0Ð¡°å¶¨¸å\IAR Files\FLASH\List\" -o                     /
//                    "C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\IAR           /
//                    Files\FLASH\Obj\" --no_cse --no_unroll --no_inline      /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files\IAR Systems\Embedded Workbench 6.0    /
//                    Evaluation\arm\INC\c\DLib_Config_Normal.h" -I           /
//                    "C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\IAR           /
//                    Files\..\Project_Headers\" -I                           /
//                    "C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\IAR           /
//                    Files\..\KinetisDrivers\" -I                            /
//                    "C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\IAR           /
//                    Files\..\ExtraFunction\" -I                             /
//                    "C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\IAR           /
//                    Files\..\Hardware_Interface\" -I                        /
//                    "C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\IAR           /
//                    Files\..\Make_Decision\" -I                             /
//                    "C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\IAR           /
//                    Files\..\Math\" -I "C:\Users\WangChangan\Desktop\K10Ð¡° /
//                    å¶¨¸å\IAR Files\..\Original_Process\" -I                /
//                    "C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\IAR           /
//                    Files\..\Platform\" -I "C:\Users\WangChangan\Desktop\K1 /
//                    0Ð¡°å¶¨¸å\IAR Files\..\SD_System\" -I                   /
//                    "C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\IAR           /
//                    Files\..\Source\" -I "C:\Users\WangChangan\Desktop\K10Ð /
//                    ¡°å¶¨¸å\IAR Files\..\System_Init\" -Ol                  /
//    List file    =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\IAR            /
//                    Files\FLASH\List\Interrupt.s                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Interrupt

        #define SHT_PROGBITS 0x1

        EXTERN ExtKeyValue
        EXTERN Key_Valid
        EXTERN LED_CtlProc
        EXTERN Process_BuzzerCtrl
        EXTERN ptrExtKeyProc

        PUBLIC Key_ISR
        PUBLIC PTB19_ISR
        PUBLIC PTC12_ISR
        PUBLIC PTI0_ISR
        PUBLIC SysTick

// C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\HardwareInterface\Interrupt.c
//    1 #include "./Interrupt.h"
//    2 #include "../Platform/Platform.h"
//    3 #include "../ZLG7290/ZLG7290.h"
//    4 #include "../KinetisDrivers/KinetisConfig.h"
//    5 #include "../HardwareInterface/HardwareOperation.h"
//    6 #include "../ExtraFunction/ExtraFunction.h"
//    7 #include "../LEDCtl/LEDCtl_Ext.h"
//    8 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//    9 volatile INT16U SysTick = 0;   /*ÏµÍ³Ê±¼ä»ù×¼(Æäµ¥Î»ÔÚPlatform.hÖÐÅäÖÃ)*/
SysTick:
        DS8 2
//   10 /****************************************ÖÐ¶Ï·þÎñ³ÌÐò********************************************/
//   11 /************************************************************************************************ 
//   12 * ISR_System_Tick
//   13 * ÏµÍ³Ê±ÖÓÖÐ¶ÏµÄÖÐ¶Ï·þÎñ³ÌÐò
//   14   Ìá¹©ÏµÍ³Ê±¼ä»ù×¼
//   15   ²¢ÔËÐÐÓÃ»§Ö¸¶¨µÄº¯Êý
//   16 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   17 ISR_System_Tick()     
//   18 {    
PTI0_ISR:
        PUSH     {R7,LR}
//   19   CLR_TickInt();                      /*ÇåÖÐ¶Ï±êÖ¾*/  
        LDR.N    R0,??DataTable3  ;; 0x4003710c
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
//   20   DIS_Int(); 
        CPSID i         
//   21 #if EN_Buzzer != 0
//   22   Process_BuzzerCtrl();
        BL       Process_BuzzerCtrl
//   23 #endif
//   24 #if EN_LED != 0
//   25   LED_CtlProc();
        BL       LED_CtlProc
//   26 #endif
//   27   SysTick++;                          /*ÏµÍ³Ê±¼ä»ù×¼¼Ó1*/  
        LDR.N    R0,??DataTable3_1
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable3_1
        STRH     R0,[R1, #+0]
//   28   
//   29   EN_Int();
        CPSIE i         
//   30 }
        POP      {R0,PC}          ;; return
//   31 /************************************************************************************************ 
//   32 * ISR_KeyPad
//   33 * ¼üÅÌÖÐ¶ÏµÄÖÐ¶Ï·þÎñ³ÌÐò
//   34   ÉèÖÃÏà¹Ø±êÖ¾Î»
//   35 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   36 ISR_KeyPad(){
//   37 #if EN_KeyPad != 0
//   38   if(IF_KeyInt()){
PTB19_ISR:
        LDR.N    R0,??DataTable3_2  ;; 0x4004a0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+12
        BPL.N    ??PTB19_ISR_0
//   39     DIS_KeyInt(); 
        LDR.N    R0,??DataTable3_3  ;; 0x4004a04c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0xF0000
        LDR.N    R1,??DataTable3_3  ;; 0x4004a04c
        STR      R0,[R1, #+0]
//   40     Key_Valid=1;   
        LDR.N    R0,??DataTable3_4
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//   41   }
//   42 #endif
//   43   CLR_KeyInt();
??PTB19_ISR_0:
        LDR.N    R0,??DataTable3_2  ;; 0x4004a0a0
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000
        LDR.N    R1,??DataTable3_2  ;; 0x4004a0a0
        STR      R0,[R1, #+0]
//   44 }
        BX       LR               ;; return
//   45 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   46 ISR_Key(){
Key_ISR:
        PUSH     {R7,LR}
//   47 #if EN_KeyPad != 0
//   48   ExtKeyValue = GetExtKey();
        LDR.N    R0,??DataTable3_5  ;; 0x4004d0a0
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+23
        ANDS     R0,R0,#0x2
        LDR.N    R1,??DataTable3_5  ;; 0x4004d0a0
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+16
        ANDS     R1,R1,#0x1
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable3_6
        STRH     R0,[R1, #+0]
//   49   DIS_ExtKeyInt();
        LDR.N    R0,??DataTable3_7  ;; 0x4004d040
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0xF0000
        LDR.N    R1,??DataTable3_7  ;; 0x4004d040
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable3_7  ;; 0x4004d040
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0xF0000
        LDR.N    R1,??DataTable3_7  ;; 0x4004d040
        STR      R0,[R1, #+0]
//   50   ptrExtKeyProc(&ExtKeyValue);
        LDR.N    R0,??DataTable3_6
        LDR.N    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        BLX      R1
//   51 #endif
//   52   CLR_ExtKeyInt();
        LDR.N    R0,??DataTable3_5  ;; 0x4004d0a0
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_9  ;; 0x1010000
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable3_5  ;; 0x4004d0a0
        STR      R0,[R1, #+0]
//   53   EN_ExtKeyInt();
        LDR.N    R0,??DataTable3_7  ;; 0x4004d040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xA0000
        LDR.N    R1,??DataTable3_7  ;; 0x4004d040
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable3_10  ;; 0x4004d060
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xA0000
        LDR.N    R1,??DataTable3_10  ;; 0x4004d060
        STR      R0,[R1, #+0]
//   54 }
        POP      {R0,PC}          ;; return
//   55 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   56 ISR_Enternet(){
//   57   DIS_EnternetInt();
PTC12_ISR:
        LDR.N    R0,??DataTable3_11  ;; 0x4004b030
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0xF0000
        LDR.N    R1,??DataTable3_11  ;; 0x4004b030
        STR      R0,[R1, #+0]
//   58   CLR_EnternetInt();
        LDR.N    R0,??DataTable3_12  ;; 0x4004b0a0
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable3_12  ;; 0x4004b0a0
        STR      R0,[R1, #+0]
//   59   EN_EnternetInt();
        LDR.N    R0,??DataTable3_11  ;; 0x4004b030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xA0000
        LDR.N    R1,??DataTable3_11  ;; 0x4004b030
        STR      R0,[R1, #+0]
//   60 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x4003710c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     SysTick

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x4004a0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x4004a04c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     Key_Valid

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x4004d0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     ExtKeyValue

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     0x4004d040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     ptrExtKeyProc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     0x1010000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     0x4004d060

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     0x4004b030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     0x4004b0a0

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
//   2 bytes in section .bss
// 260 bytes in section .text
// 
// 260 bytes of CODE memory
//   2 bytes of DATA memory
//
//Errors: none
//Warnings: 1
