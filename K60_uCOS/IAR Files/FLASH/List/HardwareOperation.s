///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      03/Nov/2015  20:45:50 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\HardwareInterf /
//                    ace\HardwareOperation.c                                 /
//    Command line =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\HardwareInterf /
//                    ace\HardwareOperation.c -D COMPILER_IAR -lCN            /
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
//                    Files\FLASH\List\HardwareOperation.s                    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME HardwareOperation

        #define SHT_PROGBITS 0x1

        EXTERN EnableInt_Kinetis

        PUBLIC Boma
        PUBLIC Enternet_Init
        PUBLIC ExtKeyProc
        PUBLIC ExtKey_Init
        PUBLIC ReadBomaValue
        PUBLIC ptrExtKeyProc

// C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\HardwareInterface\HardwareOperation.c
//    1 #include "./HardwareOperation.h"
//    2 #include "../Platform/Platform.h"
//    3 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 ptrKeyCallBackFunc ptrExtKeyProc;
ptrExtKeyProc:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//    5 INT16U Boma = 0;
Boma:
        DS8 2
//    6 /************************************************************************************************ 
//    7 * ReadBomaValue
//    8 * ¶ÁÈ¡²¦Âë¿ª¹ØµÄÉè¶¨(¶ÁÈ¡¶ÔÓ¦µÄ¶þ½øÖÆÊý)
//    9 * ·µ»Ø²ÎÊý  ²¦Âë¿ª¹ØµÄµ±Ç°Öµ
//   10 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   11 INT16U ReadBomaValue(void)
//   12 {
ReadBomaValue:
        SUB      SP,SP,#+4
//   13   INT16U boma,boma_again;
//   14   volatile INT16U i;
//   15   
//   16   do
//   17   {    
//   18     boma=READ_Boma();
??ReadBomaValue_0:
        LDR.N    R0,??DataTable2  ;; 0x400ff050
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+9,#+1
        EORS     R0,R0,#0x1
        LDR.N    R1,??DataTable2  ;; 0x400ff050
        LDR      R1,[R1, #+0]
        MVNS     R1,R1
        LSRS     R1,R1,#+15
        ANDS     R1,R1,#0x2
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable2  ;; 0x400ff050
        LDR      R1,[R1, #+0]
        MVNS     R1,R1
        LSRS     R1,R1,#+16
        ANDS     R1,R1,#0x4
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable2  ;; 0x400ff050
        LDR      R1,[R1, #+0]
        MVNS     R1,R1
        LSRS     R1,R1,#+17
        ANDS     R1,R1,#0x8
        ORRS     R0,R1,R0
//   19     
//   20     for(i=0;i<300;i++) ; /*ÑÓÊ±ÔÙ´Î¼ì²âÒÔ·ÀÖ¹¸ÉÈÅ*/
        MOVS     R1,#+0
        STRH     R1,[SP, #+0]
        B.N      ??ReadBomaValue_1
??ReadBomaValue_2:
        LDRH     R1,[SP, #+0]
        ADDS     R1,R1,#+1
        STRH     R1,[SP, #+0]
??ReadBomaValue_1:
        LDRH     R1,[SP, #+0]
        MOV      R2,#+300
        CMP      R1,R2
        BCC.N    ??ReadBomaValue_2
//   21     
//   22     boma_again=READ_Boma();
        LDR.N    R1,??DataTable2  ;; 0x400ff050
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+9,#+1
        EORS     R1,R1,#0x1
        LDR.N    R2,??DataTable2  ;; 0x400ff050
        LDR      R2,[R2, #+0]
        MVNS     R2,R2
        LSRS     R2,R2,#+15
        ANDS     R2,R2,#0x2
        ORRS     R1,R2,R1
        LDR.N    R2,??DataTable2  ;; 0x400ff050
        LDR      R2,[R2, #+0]
        MVNS     R2,R2
        LSRS     R2,R2,#+16
        ANDS     R2,R2,#0x4
        ORRS     R1,R2,R1
        LDR.N    R2,??DataTable2  ;; 0x400ff050
        LDR      R2,[R2, #+0]
        MVNS     R2,R2
        LSRS     R2,R2,#+17
        ANDS     R2,R2,#0x8
        ORRS     R1,R2,R1
//   23     
//   24   } while(boma != boma_again);
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R0,R1
        BNE.N    ??ReadBomaValue_0
//   25   
//   26   return boma;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ADD      SP,SP,#+4
        BX       LR               ;; return
//   27 }
//   28 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   29 void ExtKeyProc(INT16U * Key)
//   30 {
//   31   
//   32 }
ExtKeyProc:
        BX       LR               ;; return
//   33 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   34 void ExtKey_Init(void)
//   35 {
ExtKey_Init:
        PUSH     {R7,LR}
//   36   PORTE_PCR16 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK;
        LDR.N    R0,??DataTable2_1  ;; 0x4004d040
        MOV      R1,#+258
        STR      R1,[R0, #+0]
//   37   PORTE_PCR24 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK;
        LDR.N    R0,??DataTable2_2  ;; 0x4004d060
        MOV      R1,#+258
        STR      R1,[R0, #+0]
//   38 	                                   /* Ê¹ÄÜÏÂÀ­µç×è */
//   39                                            /* ¸ÃÖÐ¶Ï½«±»ÉèÖÃÎªÏÂ½µÑØ */
//   40   (void)EnableInt_Kinetis(91);             /* ¿ªÆô¶ÔÓ¦µÄÖÐ¶Ï */
        MOVS     R0,#+91
        BL       EnableInt_Kinetis
//   41   ptrExtKeyProc = ExtKeyProc;
        LDR.N    R1,??DataTable2_3
        LDR.N    R2,??DataTable2_4
        STR      R2,[R1, #+0]
//   42   EN_ExtKeyInt();
        LDR.N    R1,??DataTable2_1  ;; 0x4004d040
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xA0000
        LDR.N    R2,??DataTable2_1  ;; 0x4004d040
        STR      R1,[R2, #+0]
        LDR.N    R1,??DataTable2_2  ;; 0x4004d060
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xA0000
        LDR.N    R2,??DataTable2_2  ;; 0x4004d060
        STR      R1,[R2, #+0]
//   43 }
        POP      {R0,PC}          ;; return
//   44 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   45 void Enternet_Init(void)
//   46 {
Enternet_Init:
        PUSH     {R7,LR}
//   47   PORTC_PCR12 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK;
        LDR.N    R0,??DataTable2_5  ;; 0x4004b030
        MOV      R1,#+258
        STR      R1,[R0, #+0]
//   48 	                                   /* Ê¹ÄÜÏÂÀ­µç×è */
//   49                                            /* ¸ÃÖÐ¶Ï½«±»ÉèÖÃÎªÏÂ½µÑØ */
//   50   (void)EnableInt_Kinetis(89);             /* ¿ªÆô¶ÔÓ¦µÄÖÐ¶Ï */
        MOVS     R0,#+89
        BL       EnableInt_Kinetis
//   51   EN_EnternetInt();
        LDR.N    R1,??DataTable2_5  ;; 0x4004b030
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xA0000
        LDR.N    R2,??DataTable2_5  ;; 0x4004b030
        STR      R1,[R2, #+0]
//   52 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x400ff050

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x4004d040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x4004d060

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     ptrExtKeyProc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     ExtKeyProc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x4004b030

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   53 
//   54 
//   55 
// 
//   6 bytes in section .bss
// 266 bytes in section .text
// 
// 266 bytes of CODE memory
//   6 bytes of DATA memory
//
//Errors: none
//Warnings: 2
