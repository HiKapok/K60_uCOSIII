///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      12/Nov/2015  20:03:13 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\WangChangan\Desktop\K60_uCOS\App\System_Init\S /
//                    ystem_Init.c                                            /
//    Command line =  C:\Users\WangChangan\Desktop\K60_uCOS\App\System_Init\S /
//                    ystem_Init.c -D COMPILER_IAR -lCN                       /
//                    "C:\Users\WangChangan\Desktop\K60_uCOS\IAR              /
//                    Files\RAM\List\" -lB "C:\Users\WangChangan\Desktop\K60_ /
//                    uCOS\IAR Files\RAM\List\" -o                            /
//                    "C:\Users\WangChangan\Desktop\K60_uCOS\IAR              /
//                    Files\RAM\Obj\" --no_cse --no_unroll --no_inline        /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --char_is_signed --fpu=None          /
//                    --dlib_config "C:\Program Files\IAR Systems\Embedded    /
//                    Workbench 6.0 Evaluation\arm\INC\c\DLib_Config_Normal.h /
//                    " -I "C:\Users\WangChangan\Desktop\K60_uCOS\IAR         /
//                    Files\..\IAR Files\Project_Headers\" -I                 /
//                    "C:\Users\WangChangan\Desktop\K60_uCOS\IAR              /
//                    Files\..\KinetisDrivers\" -I                            /
//                    "C:\Users\WangChangan\Desktop\K60_uCOS\IAR              /
//                    Files\..\Source\" -I "C:\Users\WangChangan\Desktop\K60_ /
//                    uCOS\IAR Files\..\App\ExtraFunction\" -I                /
//                    "C:\Users\WangChangan\Desktop\K60_uCOS\IAR              /
//                    Files\..\App\SD_System\" -I                             /
//                    "C:\Users\WangChangan\Desktop\K60_uCOS\IAR              /
//                    Files\..\App\LEDCtl\" -I "C:\Users\WangChangan\Desktop\ /
//                    K60_uCOS\IAR Files\..\App\ZLG7290\" -I                  /
//                    "C:\Users\WangChangan\Desktop\K60_uCOS\IAR              /
//                    Files\..\App\OLED\" -I "C:\Users\WangChangan\Desktop\K6 /
//                    0_uCOS\IAR Files\..\App\FTFL\" -I                       /
//                    "C:\Users\WangChangan\Desktop\K60_uCOS\IAR              /
//                    Files\..\App\Platform\" -I                              /
//                    "C:\Users\WangChangan\Desktop\K60_uCOS\IAR              /
//                    Files\..\App\System_Init\" -I                           /
//                    "C:\Users\WangChangan\Desktop\K60_uCOS\IAR              /
//                    Files\..\App\HardwareInterface\" -I                     /
//                    "C:\Users\WangChangan\Desktop\K60_uCOS\IAR              /
//                    Files\..\App\TypeAdapter\" -I                           /
//                    "C:\Users\WangChangan\Desktop\K60_uCOS\IAR              /
//                    Files\..\uCOS_III\Cfg\" -I                              /
//                    "C:\Users\WangChangan\Desktop\K60_uCOS\IAR              /
//                    Files\..\uCOS_III\Source\" -I                           /
//                    "C:\Users\WangChangan\Desktop\K60_uCOS\IAR              /
//                    Files\..\uCOS_III\CortexM4\" -Ol                        /
//    List file    =  C:\Users\WangChangan\Desktop\K60_uCOS\IAR               /
//                    Files\RAM\List\System_Init.s                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME System_Init

        #define SHT_PROGBITS 0x1

        EXTERN ExtInit_Normal
        EXTERN GPIO_Init
        EXTERN IntTick_Init
        EXTERN SysTick

        PUBLIC StartSystem

// C:\Users\WangChangan\Desktop\K60_uCOS\App\System_Init\System_Init.c
//    1 #include "./System_Init.h"
//    2 #include "../Common_Def.h"
//    3 #include "../ExtraFunction/ExtraFunction.h"
//    4 #include "../Platform/Platform.h"
//    5 #include "../HardwareInterface/Interrupt.h"
//    6 
//    7 /************************************************************************************************ 
//    8 * StartSystem
//    9 * 完成整个系统的初始化与启动       
//   10 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   11 void StartSystem()
//   12 {  
StartSystem:
        PUSH     {R7,LR}
//   13   DIS_Int();              /*初始化之前先关中断*/
        CPSID i         
//   14 
//   15   GPIO_Init();            /*基本输入输出口初始化*/  
        BL       GPIO_Init
//   16   
//   17   C_WDOG_IntOff();        /*清看门狗*/
        LDR.N    R0,??StartSystem_0  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.N    R0,??StartSystem_0  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
//   18   
//   19   SysTick = 0;            /*时基计数清零*/ 
        LDR.N    R0,??StartSystem_0+0x4
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   20   IntTick_Init();         /*初始化系统时钟中断*/ 
        BL       IntTick_Init
//   21     
//   22   C_WDOG_IntOff();        /*清看门狗*/
        LDR.N    R0,??StartSystem_0  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.N    R0,??StartSystem_0  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
//   23  
//   24   ExtInit_Normal();
        BL       ExtInit_Normal
//   25   
//   26   C_WDOG_IntOff();        /*清看门狗*/
        LDR.N    R0,??StartSystem_0  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.N    R0,??StartSystem_0  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
//   27   
//   28   EN_Int();               /*开中断,系统开始正常运行*/	
        CPSIE i         
//   29 }
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
// 84 bytes in section .text
// 
// 84 bytes of CODE memory
//
//Errors: none
//Warnings: none
