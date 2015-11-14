///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      03/Nov/2015  20:45:53 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\System_Init\Sy /
//                    stem_Init.c                                             /
//    Command line =  C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\System_Init\Sy /
//                    stem_Init.c -D COMPILER_IAR -lCN                        /
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
//                    Files\FLASH\List\System_Init.s                          /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME System_Init

        #define SHT_PROGBITS 0x1

        EXTERN CPU_Init
        EXTERN ExtInit_Normal
        EXTERN GPIO_Init
        EXTERN IntTick_Init
        EXTERN SysTick
        EXTERN WatchDog_Init

        PUBLIC StartSystem

// C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\System_Init\System_Init.c
//    1 #include "./System_Init.h"
//    2 #include "../Common_Def.h"
//    3 #include "../ExtraFunction/ExtraFunction.h"
//    4 #include "../Platform/Platform.h"
//    5 #include "../HardwareInterface/Interrupt.h"
//    6 
//    7 /************************************************************************************************ 
//    8 * StartSystem
//    9 * ÕÍ≥…’˚∏ˆœµÕ≥µƒ≥ı ºªØ”Î∆Ù∂Ø       
//   10 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   11 void StartSystem()
//   12 {  
StartSystem:
        PUSH     {R7,LR}
//   13   DIS_Int();              /*≥ı ºªØ÷Æ«∞œ»πÿ÷–∂œ*/
        CPSID i         
//   14 
//   15   CPU_Init();             /*øÿ÷∆∆˜µƒ≥ı ºªØ≈‰÷√*/
        BL       CPU_Init
//   16   WatchDog_Init();        /*…Ë÷√ø¥√≈π∑∂® ±∆˜*/
        BL       WatchDog_Init
//   17   GPIO_Init();            /*ª˘±æ ‰»Î ‰≥ˆø⁄≥ı ºªØ*/  
        BL       GPIO_Init
//   18   
//   19   C_WDOG_IntOff();        /*«Âø¥√≈π∑*/
        LDR.N    R0,??StartSystem_0  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.N    R0,??StartSystem_0  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
//   20   
//   21   SysTick = 0;            /* ±ª˘º∆ ˝«Â¡„*/ 
        LDR.N    R0,??StartSystem_0+0x4
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//   22   IntTick_Init();         /*≥ı ºªØœµÕ≥ ±÷”÷–∂œ*/ 
        BL       IntTick_Init
//   23     
//   24   C_WDOG_IntOff();        /*«Âø¥√≈π∑*/
        LDR.N    R0,??StartSystem_0  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.N    R0,??StartSystem_0  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
//   25  
//   26   ExtInit_Normal();
        BL       ExtInit_Normal
//   27   
//   28   C_WDOG_IntOff();        /*«Âø¥√≈π∑*/
        LDR.N    R0,??StartSystem_0  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.N    R0,??StartSystem_0  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
//   29   
//   30   EN_Int();               /*ø™÷–∂œ,œµÕ≥ø™ º’˝≥£‘À––*/	
        CPSIE i         
//   31 }
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??StartSystem_0:
        DC32     0x4005200c
        DC32     SysTick

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
// 92 bytes in section .text
// 
// 92 bytes of CODE memory
//
//Errors: none
//Warnings: none
