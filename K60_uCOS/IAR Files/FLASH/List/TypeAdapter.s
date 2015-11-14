///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      03/Nov/2015  20:45:53 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\TypeAdapter\Ty /
//                    peAdapter.c                                             /
//    Command line =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\TypeAdapter\Ty /
//                    peAdapter.c -D COMPILER_IAR -lCN                        /
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
//                    Files\FLASH\List\TypeAdapter.s                          /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME TypeAdapter

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_f2d
        EXTERN __aeabi_memclr4
        EXTERN sprintf

        PUBLIC gTypeAdapter

// C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\TypeAdapter\TypeAdapter.c
//    1 /************************************************************************************************
//    2 
//    3 * TypeAdapter.c
//    4 
//    5 * Êý¾ÝÀàÐÍÊÊÅäÆ÷
//    6   
//    7 * Ö÷¿ØÐ¾Æ¬£ºMK10DN512VLL10
//    8   ¿ª·¢Æ½Ì¨£ºIAR Embedded Workbench 6.3
//    9   
//   10 * ×÷Õß£º Íõ²ý°²  (µÚÊ®½ìÉãÏñÍ·)  
//   11 
//   12 ************************************************************************************************/
//   13 #include "./TypeAdapter.h"
//   14 #include <stdio.h>
//   15 #include <stdlib.h>
//   16 #include <string.h>
//   17 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   18 void gTypeAdapter(ParamSt *stValue)
//   19 {
gTypeAdapter:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+24
        MOVS     R6,R0
//   20   char temp[20]={'\0'};
        ADD      R0,SP,#+0
        MOVS     R1,#+20
        BL       __aeabi_memclr4
//   21   char * pStrBase = stValue->lpstr + stValue->orgLength;
        LDRB     R0,[R6, #+16]
        LDR      R1,[R6, #+8]
        ADDS     R4,R0,R1
//   22   char * pSrcStr = temp;
        ADD      R5,SP,#+0
//   23   switch (stValue->typeID)
        LDRB     R0,[R6, #+17]
        CMP      R0,#+0
        BEQ.N    ??gTypeAdapter_0
        CMP      R0,#+2
        BEQ.N    ??gTypeAdapter_1
        BCC.N    ??gTypeAdapter_2
        CMP      R0,#+4
        BEQ.N    ??gTypeAdapter_3
        BCC.N    ??gTypeAdapter_4
        CMP      R0,#+6
        BEQ.N    ??gTypeAdapter_5
        BCC.N    ??gTypeAdapter_6
        CMP      R0,#+7
        BEQ.N    ??gTypeAdapter_7
        B.N      ??gTypeAdapter_8
//   24   {
//   25   case Type_INT8U:
//   26     stValue->Data.u8Data=*((INT8U *)stValue->pData);
??gTypeAdapter_0:
        LDR      R0,[R6, #+12]
        LDRB     R0,[R0, #+0]
        STRB     R0,[R6, #+0]
//   27     sprintf(temp,"%d",stValue->Data.u8Data);
        LDRB     R2,[R6, #+0]
        ADR.N    R1,??gTypeAdapter_9  ;; 0x25, 0x64, 0x00, 0x00
        ADD      R0,SP,#+0
        BL       sprintf
//   28     break;
        B.N      ??gTypeAdapter_10
//   29   case Type_INT8S:
//   30     stValue->Data.s8Data=*((INT8S *)stValue->pData);
??gTypeAdapter_2:
        LDR      R0,[R6, #+12]
        LDRB     R0,[R0, #+0]
        STRB     R0,[R6, #+0]
//   31     sprintf(temp,"%d",stValue->Data.s8Data);
        LDRSB    R2,[R6, #+0]
        ADR.N    R1,??gTypeAdapter_9  ;; 0x25, 0x64, 0x00, 0x00
        ADD      R0,SP,#+0
        BL       sprintf
//   32     break;
        B.N      ??gTypeAdapter_10
//   33   case Type_INT16U:
//   34     stValue->Data.u16Data=*((INT16U *)stValue->pData);
??gTypeAdapter_1:
        LDR      R0,[R6, #+12]
        LDRH     R0,[R0, #+0]
        STRH     R0,[R6, #+0]
//   35     sprintf(temp,"%d",stValue->Data.u16Data);
        LDRH     R2,[R6, #+0]
        ADR.N    R1,??gTypeAdapter_9  ;; 0x25, 0x64, 0x00, 0x00
        ADD      R0,SP,#+0
        BL       sprintf
//   36     break;
        B.N      ??gTypeAdapter_10
//   37   case Type_INT16S:
//   38     stValue->Data.s16Data=*((INT16S *)stValue->pData);
??gTypeAdapter_4:
        LDR      R0,[R6, #+12]
        LDRH     R0,[R0, #+0]
        STRH     R0,[R6, #+0]
//   39     sprintf(temp,"%d",stValue->Data.s16Data);
        LDRSH    R2,[R6, #+0]
        ADR.N    R1,??gTypeAdapter_9  ;; 0x25, 0x64, 0x00, 0x00
        ADD      R0,SP,#+0
        BL       sprintf
//   40     break;
        B.N      ??gTypeAdapter_10
//   41   case Type_INT32U:
//   42     stValue->Data.u32Data=*((INT32U *)stValue->pData);
??gTypeAdapter_3:
        LDR      R0,[R6, #+12]
        LDR      R0,[R0, #+0]
        STR      R0,[R6, #+0]
//   43     sprintf(temp,"%d",stValue->Data.u32Data);
        LDR      R2,[R6, #+0]
        ADR.N    R1,??gTypeAdapter_9  ;; 0x25, 0x64, 0x00, 0x00
        ADD      R0,SP,#+0
        BL       sprintf
//   44     break;
        B.N      ??gTypeAdapter_10
//   45   case Type_INT32S:
//   46     stValue->Data.s32Data=*((INT32S *)stValue->pData);
??gTypeAdapter_6:
        LDR      R0,[R6, #+12]
        LDR      R0,[R0, #+0]
        STR      R0,[R6, #+0]
//   47     sprintf(temp,"%d",stValue->Data.s32Data);
        LDR      R2,[R6, #+0]
        ADR.N    R1,??gTypeAdapter_9  ;; 0x25, 0x64, 0x00, 0x00
        ADD      R0,SP,#+0
        BL       sprintf
//   48     break;
        B.N      ??gTypeAdapter_10
//   49   case Type_FP32:
//   50     stValue->Data.fData=*((FP32 *)stValue->pData);
??gTypeAdapter_5:
        LDR      R0,[R6, #+12]
        LDR      R0,[R0, #+0]
        STR      R0,[R6, #+0]
//   51     sprintf(temp,"%-.2f",stValue->Data.fData);
        LDR      R0,[R6, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        LDR.N    R1,??gTypeAdapter_9+0x4
        ADD      R0,SP,#+0
        BL       sprintf
//   52     break;
        B.N      ??gTypeAdapter_10
//   53   case Type_FP64:
//   54     stValue->Data.lfData=*((FP64 *)stValue->pData);
??gTypeAdapter_7:
        LDR      R0,[R6, #+12]
        LDRD     R2,R3,[R0, #+0]
        STRD     R2,R3,[R6, #+0]
//   55     sprintf(temp,"%-.2lf",stValue->Data.lfData);
        LDRD     R2,R3,[R6, #+0]
        LDR.N    R1,??gTypeAdapter_9+0x8
        ADD      R0,SP,#+0
        BL       sprintf
//   56     break;
        B.N      ??gTypeAdapter_10
//   57   default:
//   58     break;  
??gTypeAdapter_8:
        B.N      ??gTypeAdapter_10
//   59   }
//   60   while('\0' != *pSrcStr)
//   61   {
//   62     *pStrBase = *pSrcStr; 
??gTypeAdapter_11:
        LDRB     R0,[R5, #+0]
        STRB     R0,[R4, #+0]
//   63     pSrcStr++;
        ADDS     R5,R5,#+1
//   64     pStrBase++;
        ADDS     R4,R4,#+1
//   65   }
??gTypeAdapter_10:
        LDRB     R0,[R5, #+0]
        CMP      R0,#+0
        BNE.N    ??gTypeAdapter_11
//   66   *pStrBase = *pSrcStr; 
        LDRB     R0,[R5, #+0]
        STRB     R0,[R4, #+0]
//   67 }
        ADD      SP,SP,#+24
        POP      {R4-R6,PC}       ;; return
        Nop      
        DATA
??gTypeAdapter_9:
        DC8      0x25, 0x64, 0x00, 0x00
        DC32     `?<Constant "%-.2f">`
        DC32     `?<Constant "%-.2lf">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "%d"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%-.2f">`:
        DATA
        DC8 "%-.2f"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%-.2lf">`:
        DATA
        DC8 "%-.2lf"
        DC8 0

        END
// 
//  40 bytes in section .rodata
// 252 bytes in section .text
// 
// 252 bytes of CODE  memory
//  40 bytes of CONST memory
//
//Errors: none
//Warnings: none
