///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      03/Nov/2015  20:45:54 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\ZLG7290\ZLG729 /
//                    0.c                                                     /
//    Command line =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\ZLG7290\ZLG729 /
//                    0.c -D COMPILER_IAR -lCN "C:\Users\WangChangan\Desktop\ /
//                    K10Ð¡°å¶¨¸å\IAR Files\FLASH\List\" -lB                  /
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
//                    Files\FLASH\List\ZLG7290.s                              /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ZLG7290

        #define SHT_PROGBITS 0x1

        EXTERN EnableInt_Kinetis

        PUBLIC ExtKeyValue
        PUBLIC KeyPad_Init
        PUBLIC KeyPad_Mask
        PUBLIC Key_Valid
        PUBLIC Key_Value
        PUBLIC ZLG7290_ReadKeyValue
        PUBLIC ptrKeyPadFunc

// C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\ZLG7290\ZLG7290.c
//    1 #include "./ZLG7290.h"
//    2 #include "../Platform/Platform.h"
//    3 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 ptrKeyCallBackFunc ptrKeyPadFunc;
ptrKeyPadFunc:
        DS8 4
//    5 #if EN_KeyPad != 0
//    6 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    7 INT8U Key_Valid = 0;
Key_Valid:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//    8 INT16U Key_Value = 0;
Key_Value:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    9 INT8U KeyPad_Mask = 0;
KeyPad_Mask:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   10 INT16U ExtKeyValue = 0;
ExtKeyValue:
        DS8 2
//   11 /******************************************************************************
//   12 * º¯ÊýÃû³Æ: LongDelay_7290
//   13 * º¯Êý¹¦ÄÜ: 7290³¤Ê±¼äÑÓÊ±º¯Êý.
//   14 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   15 static void LongDelay_7290(void)
//   16 {
LongDelay_7290:
        SUB      SP,SP,#+4
//   17     volatile INT16U i, j;
//   18     
//   19     for(j = 120; j > 0; j--)
        MOVS     R0,#+120
        STRH     R0,[SP, #+0]
        B.N      ??LongDelay_7290_0
//   20     {
//   21         for(i = LONG_DELAY_TIME_7290; i > 0; i--) C_WDOG_IntOn();
??LongDelay_7290_1:
        CPSID i         
        LDR.W    R0,??DataTable9  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        CPSIE i         
        LDRH     R0,[SP, #+2]
        SUBS     R0,R0,#+1
        STRH     R0,[SP, #+2]
??LongDelay_7290_2:
        LDRH     R0,[SP, #+2]
        CMP      R0,#+1
        BCS.N    ??LongDelay_7290_1
        LDRH     R0,[SP, #+0]
        SUBS     R0,R0,#+1
        STRH     R0,[SP, #+0]
??LongDelay_7290_0:
        LDRH     R0,[SP, #+0]
        CMP      R0,#+1
        BCC.N    ??LongDelay_7290_3
        MOV      R0,#+900
        STRH     R0,[SP, #+2]
        B.N      ??LongDelay_7290_2
//   22     }
//   23 }
??LongDelay_7290_3:
        ADD      SP,SP,#+4
        BX       LR               ;; return
//   24 /******************************************************************************
//   25 * º¯ÊýÃû³Æ: ShortDelay_7290
//   26 * º¯Êý¹¦ÄÜ: 7290¶ÌÊ±¼äÑÓÊ±º¯Êý.
//   27 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   28 static void ShortDelay_7290(void)
//   29 { 
ShortDelay_7290:
        SUB      SP,SP,#+4
//   30     volatile INT16S Num = SHORT_DELAY_TIME_7290;
        MOVS     R0,#+90
        STRH     R0,[SP, #+2]
//   31     volatile INT16S i;
//   32   
//   33     while(Num--)
??ShortDelay_7290_0:
        LDRSH    R0,[SP, #+2]
        SUBS     R1,R0,#+1
        STRH     R1,[SP, #+2]
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BEQ.N    ??ShortDelay_7290_1
//   34     {
//   35         for(i = 0; i < 2; i++) C_WDOG_IntOn();
        MOVS     R0,#+0
        STRH     R0,[SP, #+0]
??ShortDelay_7290_2:
        LDRSH    R0,[SP, #+0]
        CMP      R0,#+2
        BGE.N    ??ShortDelay_7290_0
        CPSID i         
        LDR.W    R0,??DataTable9  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        CPSIE i         
        LDRH     R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STRH     R0,[SP, #+0]
        B.N      ??ShortDelay_7290_2
//   36     }
//   37 }
??ShortDelay_7290_1:
        ADD      SP,SP,#+4
        BX       LR               ;; return
//   38 
//   39 /******************************************************************************
//   40 * º¯ÊýÃû³Æ: StartI2C_7290
//   41 * º¯Êý¹¦ÄÜ: I2CÆô¶¯ÐÅºÅ.
//   42 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   43 static void StartI2C_7290(void)
//   44 {
StartI2C_7290:
        PUSH     {R7,LR}
//   45     SET_SCL_OUT_7290();
        LDR.W    R0,??DataTable9_1  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.W    R1,??DataTable9_1  ;; 0x400ff054
        STR      R0,[R1, #+0]
//   46     SET_SDA_OUT_7290();
        LDR.W    R0,??DataTable9_1  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.W    R1,??DataTable9_1  ;; 0x400ff054
        STR      R0,[R1, #+0]
//   47     
//   48     SET_SDA_HIGH_7290();  
        LDR.W    R0,??DataTable9_2  ;; 0x400ff044
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable9_2  ;; 0x400ff044
        STR      R0,[R1, #+0]
//   49     ShortDelay_7290();
        BL       ShortDelay_7290
//   50   
//   51     SET_SCL_HIGH_7290();
        LDR.N    R0,??DataTable9_2  ;; 0x400ff044
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable9_2  ;; 0x400ff044
        STR      R0,[R1, #+0]
//   52     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   53     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   54   
//   55     SET_SDA_LOW_7290();
        LDR.N    R0,??DataTable9_3  ;; 0x400ff048
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable9_3  ;; 0x400ff048
        STR      R0,[R1, #+0]
//   56     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   57     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   58 }
        POP      {R0,PC}          ;; return
//   59 /******************************************************************************
//   60 * º¯ÊýÃû³Æ: StopI2C_7290
//   61 * º¯Êý¹¦ÄÜ: I2C½áÊøÐÅºÅ.
//   62 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   63 static void StopI2C_7290(void)
//   64 {
StopI2C_7290:
        PUSH     {R7,LR}
//   65     SET_SCL_OUT_7290();
        LDR.N    R0,??DataTable9_1  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable9_1  ;; 0x400ff054
        STR      R0,[R1, #+0]
//   66     SET_SDA_OUT_7290();
        LDR.N    R0,??DataTable9_1  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable9_1  ;; 0x400ff054
        STR      R0,[R1, #+0]
//   67     
//   68     SET_SDA_LOW_7290();
        LDR.N    R0,??DataTable9_3  ;; 0x400ff048
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable9_3  ;; 0x400ff048
        STR      R0,[R1, #+0]
//   69     ShortDelay_7290();
        BL       ShortDelay_7290
//   70   
//   71     SET_SCL_HIGH_7290();
        LDR.N    R0,??DataTable9_2  ;; 0x400ff044
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable9_2  ;; 0x400ff044
        STR      R0,[R1, #+0]
//   72     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   73     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   74   
//   75     SET_SDA_HIGH_7290();
        LDR.N    R0,??DataTable9_2  ;; 0x400ff044
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable9_2  ;; 0x400ff044
        STR      R0,[R1, #+0]
//   76     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   77     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   78 }
        POP      {R0,PC}          ;; return
//   79 
//   80 /******************************************************************************
//   81 * º¯ÊýÃû³Æ: WackI2C_7290
//   82 * º¯Êý¹¦ÄÜ: ½ÓÊÕI2CÓ¦´ðÐÅºÅ.
//   83 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   84 static void WackI2C_7290(void)
//   85 { 
WackI2C_7290:
        PUSH     {R7,LR}
//   86     SET_SCL_OUT_7290();
        LDR.N    R0,??DataTable9_1  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable9_1  ;; 0x400ff054
        STR      R0,[R1, #+0]
//   87     SET_SDA_OUT_7290();
        LDR.N    R0,??DataTable9_1  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable9_1  ;; 0x400ff054
        STR      R0,[R1, #+0]
//   88     SET_SDA_HIGH_7290();
        LDR.N    R0,??DataTable9_2  ;; 0x400ff044
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable9_2  ;; 0x400ff044
        STR      R0,[R1, #+0]
//   89     ShortDelay_7290();
        BL       ShortDelay_7290
//   90   
//   91     SET_SCL_LOW_7290();
        LDR.N    R0,??DataTable9_3  ;; 0x400ff048
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable9_3  ;; 0x400ff048
        STR      R0,[R1, #+0]
//   92     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   93     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   94   
//   95     SET_SCL_HIGH_7290();
        LDR.N    R0,??DataTable9_2  ;; 0x400ff044
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable9_2  ;; 0x400ff044
        STR      R0,[R1, #+0]
//   96     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   97     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   98   
//   99     SET_SCL_LOW_7290();
        LDR.N    R0,??DataTable9_3  ;; 0x400ff048
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable9_3  ;; 0x400ff048
        STR      R0,[R1, #+0]
//  100     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  101     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  102 }
        POP      {R0,PC}          ;; return
//  103 
//  104 /******************************************************************************
//  105 * º¯ÊýÃû³Æ: WriteByteI2C_7290
//  106 * º¯Êý¹¦ÄÜ: Í¨¹ýI2C·¢ËÍÒ»×Ö½ÚÊý¾Ý.
//  107 * Èë¿Ú²ÎÊý: dat  ´ý·¢ËÍÊý¾Ý
//  108 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  109 static void WriteByteI2C_7290(INT8U dat)
//  110 {
WriteByteI2C_7290:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  111     INT8U i = 8, temp;
        MOVS     R5,#+8
//  112     
//  113     SET_SCL_OUT_7290();
        LDR.N    R0,??DataTable9_1  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable9_1  ;; 0x400ff054
        STR      R0,[R1, #+0]
//  114     SET_SDA_OUT_7290();
        LDR.N    R0,??DataTable9_1  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable9_1  ;; 0x400ff054
        STR      R0,[R1, #+0]
//  115     
//  116     SET_SCL_LOW_7290();
        LDR.N    R0,??DataTable9_3  ;; 0x400ff048
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable9_3  ;; 0x400ff048
        STR      R0,[R1, #+0]
//  117     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  118     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
        B.N      ??WriteByteI2C_7290_0
//  119 
//  120     while(i--)
//  121     {     
//  122       temp = dat & 0x80;
//  123       if(temp == 0)
//  124       {
//  125           SET_SDA_LOW_7290();
//  126       }
//  127       else
//  128       {
//  129           SET_SDA_HIGH_7290();
??WriteByteI2C_7290_1:
        LDR.N    R0,??DataTable9_2  ;; 0x400ff044
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable9_2  ;; 0x400ff044
        STR      R0,[R1, #+0]
//  130       }
//  131       ShortDelay_7290();ShortDelay_7290();
??WriteByteI2C_7290_2:
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  132       ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  133 
//  134       dat <<= 1;
        LSLS     R4,R4,#+1
//  135 
//  136       SET_SCL_HIGH_7290();
        LDR.N    R0,??DataTable9_2  ;; 0x400ff044
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable9_2  ;; 0x400ff044
        STR      R0,[R1, #+0]
//  137       ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  138       ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  139 
//  140       SET_SCL_LOW_7290();
        LDR.N    R0,??DataTable9_3  ;; 0x400ff048
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable9_3  ;; 0x400ff048
        STR      R0,[R1, #+0]
//  141       ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  142       ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
??WriteByteI2C_7290_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??WriteByteI2C_7290_3
        ANDS     R0,R4,#0x80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??WriteByteI2C_7290_1
        LDR.N    R0,??DataTable9_3  ;; 0x400ff048
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable9_3  ;; 0x400ff048
        STR      R0,[R1, #+0]
        B.N      ??WriteByteI2C_7290_2
//  143     }
//  144 
//  145     ShortDelay_7290();ShortDelay_7290();
??WriteByteI2C_7290_3:
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  146     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  147     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  148 }
        POP      {R0,R4,R5,PC}    ;; return
//  149 /******************************************************************************
//  150 * º¯ÊýÃû³Æ: ReadByteI2C_7290
//  151 * º¯Êý¹¦ÄÜ: Í¨¹ýI2C¶ÁÈ¡Ò»×Ö½ÚÊý¾Ý.
//  152 * ·µ»Ø²ÎÊý: ¶ÁÈ¡½á¹û
//  153 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  154 static INT8U ReadByteI2C_7290(void)
//  155 {
ReadByteI2C_7290:
        PUSH     {R3-R5,LR}
//  156     INT8U dat = 0x00;
        MOVS     R4,#+0
//  157     INT8U i   = 8;
        MOVS     R5,#+8
        B.N      ??ReadByteI2C_7290_0
//  158     
//  159     while(i--)
//  160     { 
//  161         SET_SCL_OUT_7290();
??ReadByteI2C_7290_1:
        LDR.N    R0,??DataTable9_1  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable9_1  ;; 0x400ff054
        STR      R0,[R1, #+0]
//  162         SET_SDA_OUT_7290();
        LDR.N    R0,??DataTable9_1  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable9_1  ;; 0x400ff054
        STR      R0,[R1, #+0]
//  163         
//  164         SET_SDA_HIGH_7290();
        LDR.N    R0,??DataTable9_2  ;; 0x400ff044
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable9_2  ;; 0x400ff044
        STR      R0,[R1, #+0]
//  165         ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  166         ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  167         
//  168         SET_SCL_OUT_7290();
        LDR.N    R0,??DataTable9_1  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable9_1  ;; 0x400ff054
        STR      R0,[R1, #+0]
//  169         SET_SDA_IN_7290();  /* SDAµÄ·½Ïò¸Ä±ä:SCLÊä³ö£¬SDAÊäÈë */
        LDR.N    R0,??DataTable9_1  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x20000
        LDR.N    R1,??DataTable9_1  ;; 0x400ff054
        STR      R0,[R1, #+0]
//  170         
//  171         dat <<= 1;
        LSLS     R4,R4,#+1
//  172         SET_SCL_LOW_7290();
        LDR.N    R0,??DataTable9_3  ;; 0x400ff048
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable9_3  ;; 0x400ff048
        STR      R0,[R1, #+0]
//  173         ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  174         ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  175 
//  176         SET_SCL_HIGH_7290();
        LDR.N    R0,??DataTable9_2  ;; 0x400ff044
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable9_2  ;; 0x400ff044
        STR      R0,[R1, #+0]
//  177         ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  178         ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  179 
//  180         if(READ_SDA_7290() != 0)
        LDR.N    R0,??DataTable9_4  ;; 0x400ff050
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+14
        BPL.N    ??ReadByteI2C_7290_0
//  181         {
//  182             dat |= 0x01;
        ORRS     R4,R4,#0x1
//  183         }
//  184     }
??ReadByteI2C_7290_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??ReadByteI2C_7290_1
//  185 
//  186     SET_SCL_OUT_7290();
        LDR.N    R0,??DataTable9_1  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable9_1  ;; 0x400ff054
        STR      R0,[R1, #+0]
//  187     SET_SDA_OUT_7290();
        LDR.N    R0,??DataTable9_1  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable9_1  ;; 0x400ff054
        STR      R0,[R1, #+0]
//  188     SET_SCL_LOW_7290();
        LDR.N    R0,??DataTable9_3  ;; 0x400ff048
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable9_3  ;; 0x400ff048
        STR      R0,[R1, #+0]
//  189     SET_SDA_HIGH_7290();
        LDR.N    R0,??DataTable9_2  ;; 0x400ff044
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable9_2  ;; 0x400ff044
        STR      R0,[R1, #+0]
//  190     
//  191     return dat;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//  192 }
//  193 
//  194 /************************************************************************************************ 
//  195 * IntKeyPad_Init
//  196 * ³õÊ¼»¯¼üÅÌÖÐ¶Ï(PTB19)
//  197 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  198 static void IntKeyPad_Init(void)
//  199 {
IntKeyPad_Init:
        PUSH     {R7,LR}
//  200   PORTB_PCR19 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK;
        LDR.N    R0,??DataTable9_5  ;; 0x4004a04c
        MOV      R1,#+258
        STR      R1,[R0, #+0]
//  201 	                                   /* Ê¹ÄÜÏÂÀ­µç×è */
//  202                                            /* ¸ÃÖÐ¶Ï½«±»ÉèÖÃÎªÏÂ½µÑØ */
//  203   (void)EnableInt_Kinetis(88);             /* ¿ªÆô¶ÔÓ¦µÄÖÐ¶Ï */
        MOVS     R0,#+88
        BL       EnableInt_Kinetis
//  204 }
        POP      {R0,PC}          ;; return
//  205 
//  206 /******************************************************************************
//  207 * º¯ÊýÃû³Æ: Init_Chip7290
//  208 * º¯Êý¹¦ÄÜ: ³õÊ¼»¯7290
//  209 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  210 static void Init_Chip7290(void)
//  211 {
Init_Chip7290:
        PUSH     {R7,LR}
//  212   INIT_SCL_7290();
        LDR.N    R0,??DataTable9_6  ;; 0x4004a05c
        MOVW     R1,#+259
        STR      R1,[R0, #+0]
//  213   INIT_SDA_7290();
        LDR.N    R0,??DataTable9_7  ;; 0x4004a044
        MOVW     R1,#+259
        STR      R1,[R0, #+0]
//  214   
//  215   StartI2C_7290();              
        BL       StartI2C_7290
//  216   WriteByteI2C_7290(SLVADDR_7290);
        MOVS     R0,#+112
        BL       WriteByteI2C_7290
//  217   WackI2C_7290();
        BL       WackI2C_7290
//  218 
//  219   WriteByteI2C_7290(0x0D);
        MOVS     R0,#+13
        BL       WriteByteI2C_7290
//  220   WackI2C_7290();
        BL       WackI2C_7290
//  221 
//  222   WriteByteI2C_7290(0x03);
        MOVS     R0,#+3
        BL       WriteByteI2C_7290
//  223   WackI2C_7290();
        BL       WackI2C_7290
//  224 
//  225   StopI2C_7290();
        BL       StopI2C_7290
//  226   LongDelay_7290();
        BL       LongDelay_7290
//  227 }
        POP      {R0,PC}          ;; return
//  228 
//  229 /************************************************************************************************ 
//  230 * KeyPad_Init
//  231 * ¼üÅÌ³õÊ¼»¯ÉèÖÃ
//  232 * PTB19-INT PTB17-SDA PTB23-SCL
//  233 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  234 void KeyPad_Init(ptrKeyCallBackFunc func)    
//  235 { 
KeyPad_Init:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  236   Init_Chip7290(); 
        BL       Init_Chip7290
//  237   IntKeyPad_Init();
        BL       IntKeyPad_Init
//  238   ptrKeyPadFunc = func;
        LDR.N    R0,??DataTable9_8
        STR      R4,[R0, #+0]
//  239   EN_KeyInt();
        LDR.N    R0,??DataTable9_5  ;; 0x4004a04c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xA0000
        LDR.N    R1,??DataTable9_5  ;; 0x4004a04c
        STR      R0,[R1, #+0]
//  240 } 
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0x4005200c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     0x400ff054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     0x400ff044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     0x400ff048

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     0x400ff050

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     0x4004a04c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_6:
        DC32     0x4004a05c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_7:
        DC32     0x4004a044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_8:
        DC32     ptrKeyPadFunc
//  241 
//  242 /******************************************************************************
//  243 * º¯ÊýÃû³Æ: Readkey_7290
//  244 * º¯Êý¹¦ÄÜ: ¶ÁÈ¡°´¼üÖµ.
//  245 * ·µ»Ø²ÎÊý: °´¼ü¼üÖµ
//  246 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  247 static INT8U Readkey_7290()
//  248 {
Readkey_7290:
        PUSH     {R4,LR}
//  249     INT8U key;
//  250 
//  251     StartI2C_7290();
        BL       StartI2C_7290
//  252     WriteByteI2C_7290(SLVADDR_7290);    /* Ð´´Ó»úµØÖ·       */
        MOVS     R0,#+112
        BL       WriteByteI2C_7290
//  253     WackI2C_7290();
        BL       WackI2C_7290
//  254 
//  255     WriteByteI2C_7290(SUB_KEY_7290);    /* Ð´¶ÁÈ¡»º³åÇøµØÖ· */
        MOVS     R0,#+1
        BL       WriteByteI2C_7290
//  256     WackI2C_7290();
        BL       WackI2C_7290
//  257 
//  258     StartI2C_7290();
        BL       StartI2C_7290
//  259     WriteByteI2C_7290(SLVADDR_7290+0x01);
        MOVS     R0,#+113
        BL       WriteByteI2C_7290
//  260     WackI2C_7290();
        BL       WackI2C_7290
//  261 
//  262     key = ReadByteI2C_7290();
        BL       ReadByteI2C_7290
        MOVS     R4,R0
//  263 
//  264     StopI2C_7290();
        BL       StopI2C_7290
//  265     LongDelay_7290();
        BL       LongDelay_7290
//  266 
//  267     return key;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return
//  268 }
//  269 /******************************************************************************
//  270 * º¯ÊýÃû³Æ: ReadRepeat_7290
//  271 * º¯Êý¹¦ÄÜ: ¶ÁÈ¡Á¬»÷´ÎÊý.
//  272 * ·µ»Ø²ÎÊý: Á¬»÷´ÎÊý
//  273 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  274 static INT8U ReadRepeat_7290()
//  275 {
ReadRepeat_7290:
        PUSH     {R4,LR}
//  276     INT8U cnt;
//  277 
//  278     StartI2C_7290();
        BL       StartI2C_7290
//  279     WriteByteI2C_7290(SLVADDR_7290);    /* Ð´´Ó»úµØÖ·       */
        MOVS     R0,#+112
        BL       WriteByteI2C_7290
//  280     WackI2C_7290();
        BL       WackI2C_7290
//  281 
//  282     WriteByteI2C_7290(REPEAT_CNT_7290);    /* Ð´¶ÁÈ¡»º³åÇøµØÖ· */
        MOVS     R0,#+2
        BL       WriteByteI2C_7290
//  283     WackI2C_7290();
        BL       WackI2C_7290
//  284 
//  285     StartI2C_7290();
        BL       StartI2C_7290
//  286     WriteByteI2C_7290(SLVADDR_7290+0x01);
        MOVS     R0,#+113
        BL       WriteByteI2C_7290
//  287     WackI2C_7290();
        BL       WackI2C_7290
//  288 
//  289     cnt = ReadByteI2C_7290();
        BL       ReadByteI2C_7290
        MOVS     R4,R0
//  290     StopI2C_7290();
        BL       StopI2C_7290
//  291     LongDelay_7290();
        BL       LongDelay_7290
//  292 
//  293     return cnt;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return
//  294 }
//  295 
//  296 /*
//  297 º¯Êý£ºZLG7290_ReadKeyValue()
//  298 ¹¦ÄÜ£ºÖ±½Ó¶ÁÈ¡¼üÖµºÍÁ¬»÷´ÎÊý
//  299 ·µ»Ø£º¼üÖµ£¬ÊýÖµ¼ü·µ»ØÊýÖµÁ¿£¬¹¦ÄÜ¼ü·µ»Ø¡®N¡¯,¡®Y¡¯,F1-¡®1¡¯,F2-¡®2¡¯,F3-¡®3¡¯,F4-¡®4¡¯
//  300  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  301 INT16U ZLG7290_ReadKeyValue() 
//  302 {
ZLG7290_ReadKeyValue:
        PUSH     {R4-R6,LR}
//  303     INT8U KeyValue = 0;
        MOVS     R4,#+0
//  304     INT8U KeyRepeat = 0;
        MOVS     R5,#+0
//  305     INT16U temp = 0;
        MOVS     R6,#+0
//  306     KeyValue=Readkey_7290();
        BL       Readkey_7290
        MOVS     R4,R0
//  307     KeyRepeat=ReadRepeat_7290();    
        BL       ReadRepeat_7290
        MOVS     R5,R0
//  308     switch (KeyValue) {
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??ZLG7290_ReadKeyValue_0
        CMP      R4,#+2
        BEQ.N    ??ZLG7290_ReadKeyValue_1
        CMP      R4,#+3
        BEQ.N    ??ZLG7290_ReadKeyValue_2
        CMP      R4,#+4
        BEQ.N    ??ZLG7290_ReadKeyValue_3
        CMP      R4,#+9
        BEQ.N    ??ZLG7290_ReadKeyValue_4
        CMP      R4,#+10
        BEQ.N    ??ZLG7290_ReadKeyValue_5
        CMP      R4,#+11
        BEQ.N    ??ZLG7290_ReadKeyValue_6
        CMP      R4,#+12
        BEQ.N    ??ZLG7290_ReadKeyValue_7
        CMP      R4,#+17
        BEQ.N    ??ZLG7290_ReadKeyValue_8
        CMP      R4,#+18
        BEQ.N    ??ZLG7290_ReadKeyValue_9
        CMP      R4,#+19
        BEQ.N    ??ZLG7290_ReadKeyValue_10
        CMP      R4,#+20
        BEQ.N    ??ZLG7290_ReadKeyValue_11
        CMP      R4,#+25
        BEQ.N    ??ZLG7290_ReadKeyValue_12
        CMP      R4,#+26
        BEQ.N    ??ZLG7290_ReadKeyValue_13
        CMP      R4,#+27
        BEQ.N    ??ZLG7290_ReadKeyValue_14
        CMP      R4,#+28
        BEQ.N    ??ZLG7290_ReadKeyValue_15
        B.N      ??ZLG7290_ReadKeyValue_16
//  309     case  0x09 :
//  310       KeyValue = 1;  
??ZLG7290_ReadKeyValue_4:
        MOVS     R4,#+1
//  311       break; 
//  312     case  0x0A :
//  313       KeyValue = 2;  
//  314       break;       
//  315     case  0x0B  :
//  316       KeyValue = 3;  
//  317       break; 
//  318     case  0x19 :
//  319       KeyValue = 4;  
//  320       break; 
//  321     case  0x1A :
//  322       KeyValue = 5;  
//  323       break; 
//  324     case  0x1B :
//  325       KeyValue = 6;  
//  326       break;      
//  327     case  0x11 :
//  328       KeyValue = 7;  
//  329       break; 
//  330     case  0x12 :
//  331       KeyValue = 8;  
//  332       break; 
//  333     case  0x13 :
//  334       KeyValue = 9;  
//  335       break; 
//  336     case  0x01 :
//  337       KeyValue = 'N';  
//  338       break;       
//  339     case  0x02 :
//  340       KeyValue = 0;  
//  341       break; 
//  342     case  0x03 :    
//  343       KeyValue = 'Y';  
//  344       break; 
//  345     case  0x0C :
//  346       KeyValue = '-';  
//  347       break; 
//  348     case  0x1C :    
//  349       KeyValue = '.';  
//  350       break;  
//  351     case  0x14 :
//  352       KeyValue = 'U';  
//  353       break; 
//  354     case  0x04 :    
//  355       KeyValue = 'D';  
//  356       break;
//  357     default:
//  358       return 0; 
//  359     }
//  360     temp = KeyRepeat;
??ZLG7290_ReadKeyValue_17:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R6,R5
//  361     temp <<= 8;
        LSLS     R6,R6,#+8
//  362     temp |= KeyValue;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ORRS     R6,R4,R6
//  363     return temp;
        MOVS     R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
??ZLG7290_ReadKeyValue_18:
        POP      {R4-R6,PC}       ;; return
??ZLG7290_ReadKeyValue_5:
        MOVS     R4,#+2
        B.N      ??ZLG7290_ReadKeyValue_17
??ZLG7290_ReadKeyValue_6:
        MOVS     R4,#+3
        B.N      ??ZLG7290_ReadKeyValue_17
??ZLG7290_ReadKeyValue_12:
        MOVS     R4,#+4
        B.N      ??ZLG7290_ReadKeyValue_17
??ZLG7290_ReadKeyValue_13:
        MOVS     R4,#+5
        B.N      ??ZLG7290_ReadKeyValue_17
??ZLG7290_ReadKeyValue_14:
        MOVS     R4,#+6
        B.N      ??ZLG7290_ReadKeyValue_17
??ZLG7290_ReadKeyValue_8:
        MOVS     R4,#+7
        B.N      ??ZLG7290_ReadKeyValue_17
??ZLG7290_ReadKeyValue_9:
        MOVS     R4,#+8
        B.N      ??ZLG7290_ReadKeyValue_17
??ZLG7290_ReadKeyValue_10:
        MOVS     R4,#+9
        B.N      ??ZLG7290_ReadKeyValue_17
??ZLG7290_ReadKeyValue_0:
        MOVS     R4,#+78
        B.N      ??ZLG7290_ReadKeyValue_17
??ZLG7290_ReadKeyValue_1:
        MOVS     R4,#+0
        B.N      ??ZLG7290_ReadKeyValue_17
??ZLG7290_ReadKeyValue_2:
        MOVS     R4,#+89
        B.N      ??ZLG7290_ReadKeyValue_17
??ZLG7290_ReadKeyValue_7:
        MOVS     R4,#+45
        B.N      ??ZLG7290_ReadKeyValue_17
??ZLG7290_ReadKeyValue_15:
        MOVS     R4,#+46
        B.N      ??ZLG7290_ReadKeyValue_17
??ZLG7290_ReadKeyValue_11:
        MOVS     R4,#+85
        B.N      ??ZLG7290_ReadKeyValue_17
??ZLG7290_ReadKeyValue_3:
        MOVS     R4,#+68
        B.N      ??ZLG7290_ReadKeyValue_17
??ZLG7290_ReadKeyValue_16:
        MOVS     R0,#+0
        B.N      ??ZLG7290_ReadKeyValue_18
//  364 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  365 
//  366 #endif
// 
//    10 bytes in section .bss
// 1 360 bytes in section .text
// 
// 1 360 bytes of CODE memory
//    10 bytes of DATA memory
//
//Errors: none
//Warnings: none
