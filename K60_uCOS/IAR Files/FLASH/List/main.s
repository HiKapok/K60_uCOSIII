///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      03/Nov/2015  20:45:54 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\Sources\main.c /
//    Command line =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\Sources\main.c /
//                     -D COMPILER_IAR -lCN "C:\Users\WangChangan\Desktop\K10 /
//                    Ð¡°å¶¨¸å\IAR Files\FLASH\List\" -lB                     /
//                    "C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\IAR           /
//                    Files\FLASH\List\" -o "C:\Users\WangChangan\Desktop\K10 /
//                    Ð¡°å¶¨¸å\IAR Files\FLASH\Obj\" --no_cse --no_unroll     /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
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
//                    Files\FLASH\List\main.s                                 /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME main

        #define SHT_PROGBITS 0x1

        EXTERN AuxiliaryFunction
        EXTERN KeyPad_Mask
        EXTERN Key_Valid
        EXTERN Key_Value
        EXTERN StartSystem
        EXTERN SysTick
        EXTERN ZLG7290_ReadKeyValue
        EXTERN ptrKeyPadFunc

        PUBLIC main

// C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\Sources\main.c
//    1 /************************************************************************************************
//    2 
//    3 * main.c
//    4 
//    5 * ¶¨Òå³ÌÐòµÄÈë¿Ú(mainº¯Êý)¼°ÏµÍ³µÄÖ÷ÒªÔËÐÐÁ÷³Ì
//    6 
//    7 ************************************************************************************************/
//    8 /***********************»ù±¾Êý¾ÝÀàÐÍ¶¨ÒåÏà¹ØÍ·ÎÄ¼þ***********************/
//    9 #include "../BaseTypeDefine.h"
//   10 /***************************Ó²¼þÆ½Ì¨Ïà¹ØÍ·ÎÄ¼þ***************************/
//   11 #include "../KinetisDrivers/KinetisConfig.h"
//   12 #include "../System_Init/System_Init.h"
//   13 #include "../ExtraFunction/ExtraFunction.h"
//   14 #include "../HardwareInterface/Interrupt.h"
//   15 #include "../ZLG7290/ZLG7290.h"
//   16 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   17 void main(void) 
//   18 {    
main:
        PUSH     {R7,LR}
//   19   StartSystem();
        BL       StartSystem
//   20   /*³ÌÐòÖ÷Ñ­»·*/
//   21   for(;;)        
//   22   {  
//   23     //TODO:Add your code here 
//   24     if(SysTick % 4 == 0)
??main_0:
        LDR.N    R0,??main_1
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+4
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BNE.N    ??main_2
//   25     {
//   26       AuxiliaryFunction();
        BL       AuxiliaryFunction
//   27     }
//   28 #if EN_KeyPad != 0
//   29     if(!KeyPad_Mask && Key_Valid)
??main_2:
        LDR.N    R0,??main_1+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??main_3
        LDR.N    R0,??main_1+0x8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??main_3
//   30     {
//   31       Key_Value = ZLG7290_ReadKeyValue();
        BL       ZLG7290_ReadKeyValue
        LDR.N    R1,??main_1+0xC
        STRH     R0,[R1, #+0]
//   32       ptrKeyPadFunc(&Key_Value);
        LDR.N    R0,??main_1+0xC
        LDR.N    R1,??main_1+0x10
        LDR      R1,[R1, #+0]
        BLX      R1
//   33       Key_Valid = 0;
        LDR.N    R0,??main_1+0x8
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//   34       EN_KeyInt(); 
        LDR.N    R0,??main_1+0x14  ;; 0x4004a04c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xA0000
        LDR.N    R1,??main_1+0x14  ;; 0x4004a04c
        STR      R0,[R1, #+0]
//   35     }
//   36 #endif
//   37     C_WDOG_IntOn();
??main_3:
        CPSID i         
        LDR.N    R0,??main_1+0x18  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.N    R0,??main_1+0x18  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        CPSIE i         
        B.N      ??main_0
        DATA
??main_1:
        DC32     SysTick
        DC32     KeyPad_Mask
        DC32     Key_Valid
        DC32     Key_Value
        DC32     ptrKeyPadFunc
        DC32     0x4004a04c
        DC32     0x4005200c
//   38   }                 
//   39 }                        

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   40 
//   41 
//   42 
// 
// 128 bytes in section .text
// 
// 128 bytes of CODE memory
//
//Errors: none
//Warnings: none
