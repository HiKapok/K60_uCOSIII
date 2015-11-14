///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      03/Nov/2015  20:45:52 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\LEDCtl\LEDCtl. /
//                    c                                                       /
//    Command line =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\LEDCtl\LEDCtl. /
//                    c -D COMPILER_IAR -lCN "C:\Users\WangChangan\Desktop\K1 /
//                    0Ð¡°å¶¨¸å\IAR Files\FLASH\List\" -lB                    /
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
//                    Files\FLASH\List\LEDCtl.s                               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME LEDCtl

        #define SHT_PROGBITS 0x1

        PUBLIC LED_CtlProc
        PUBLIC LED_Init
        PUBLIC LedCtlSet

// C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\LEDCtl\LEDCtl.c
//    1 /************************************************************************************************
//    2 
//    3 * LEDCtl.c
//    4 
//    5 * Ö¸Ê¾µÆ¿ØÖÆÆ÷
//    6   
//    7 * Ö÷¿ØÐ¾Æ¬£ºMK10DN512VLL10
//    8   ¿ª·¢Æ½Ì¨£ºIAR Embedded Workbench 6.3
//    9   
//   10 * ×÷Õß£º Íõ²ý°²  (µÚÊ®½ìÉãÏñÍ·)  
//   11 
//   12 ************************************************************************************************/
//   13 #include "./LEDCtl.h"
//   14 
//   15 #if EN_LED != 0
//   16 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17 static LEDData_t LEDQueue[LEDColorEnd];         /*LED¿ØÖÆ»º³å¶ÓÁÐ*/
LEDQueue:
        DS8 180
//   18 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   19 static void setGreenLED(LedState state)
//   20 {
//   21   if(LED_ON == state)
setGreenLED:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??setGreenLED_0
//   22   {
//   23     (LED_PT_GREEN)->PCOR |= (1<<LED_INDEX_GREEN);
        LDR.W    R0,??DataTable8  ;; 0x400ff088
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable8  ;; 0x400ff088
        STR      R0,[R1, #+0]
        B.N      ??setGreenLED_1
//   24   }
//   25   else
//   26   {
//   27     (LED_PT_GREEN)->PSOR |= (1<<LED_INDEX_GREEN);
??setGreenLED_0:
        LDR.W    R0,??DataTable8_1  ;; 0x400ff084
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable8_1  ;; 0x400ff084
        STR      R0,[R1, #+0]
//   28   }
//   29 }
??setGreenLED_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   30 static void setRedLED(LedState state)
//   31 {
//   32   if(LED_ON == state)
setRedLED:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??setRedLED_0
//   33   {
//   34     (LED_PT_RED)->PCOR |= (1<<LED_INDEX_RED);
        LDR.W    R0,??DataTable8  ;; 0x400ff088
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable8  ;; 0x400ff088
        STR      R0,[R1, #+0]
        B.N      ??setRedLED_1
//   35   }
//   36   else
//   37   {
//   38     (LED_PT_RED)->PSOR |= (1<<LED_INDEX_RED);
??setRedLED_0:
        LDR.W    R0,??DataTable8_1  ;; 0x400ff084
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable8_1  ;; 0x400ff084
        STR      R0,[R1, #+0]
//   39   }
//   40 }
??setRedLED_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   41 static void setWhiteLED(LedState state)
//   42 {
//   43   if(LED_ON == state)
setWhiteLED:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??setWhiteLED_0
//   44   {
//   45     (LED_PT_WHITE)->PCOR |= (1<<LED_INDEX_WHITE);
        LDR.W    R0,??DataTable8  ;; 0x400ff088
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.W    R1,??DataTable8  ;; 0x400ff088
        STR      R0,[R1, #+0]
        B.N      ??setWhiteLED_1
//   46   }
//   47   else
//   48   {
//   49     (LED_PT_WHITE)->PSOR |= (1<<LED_INDEX_WHITE);
??setWhiteLED_0:
        LDR.W    R0,??DataTable8_1  ;; 0x400ff084
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.W    R1,??DataTable8_1  ;; 0x400ff084
        STR      R0,[R1, #+0]
//   50   }
//   51 }
??setWhiteLED_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   52 static void LED_IOInit(void)
//   53 {
//   54   ((LED_PORT_GREEN)->PCR[LED_INDEX_GREEN]) = PORT_PCR_MUX(1);
LED_IOInit:
        LDR.W    R0,??DataTable8_2  ;; 0x4004b01c
        MOV      R1,#+256
        STR      R1,[R0, #+0]
//   55   (LED_PT_GREEN)->PDDR |= (1<<LED_INDEX_GREEN); 
        LDR.W    R0,??DataTable8_3  ;; 0x400ff094
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable8_3  ;; 0x400ff094
        STR      R0,[R1, #+0]
//   56   
//   57   (LED_PORT_RED)->PCR[LED_INDEX_RED] = PORT_PCR_MUX(1);
        LDR.W    R0,??DataTable8_4  ;; 0x4004b024
        MOV      R1,#+256
        STR      R1,[R0, #+0]
//   58   (LED_PT_RED)->PDDR |= (1<<LED_INDEX_RED);
        LDR.W    R0,??DataTable8_3  ;; 0x400ff094
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable8_3  ;; 0x400ff094
        STR      R0,[R1, #+0]
//   59   
//   60   (LED_PORT_WHITE)->PCR[LED_INDEX_WHITE] = PORT_PCR_MUX(1);
        LDR.W    R0,??DataTable8_5  ;; 0x4004b02c
        MOV      R1,#+256
        STR      R1,[R0, #+0]
//   61   (LED_PT_WHITE)->PDDR |= (1<<LED_INDEX_WHITE);
        LDR.W    R0,??DataTable8_3  ;; 0x400ff094
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.W    R1,??DataTable8_3  ;; 0x400ff094
        STR      R0,[R1, #+0]
//   62 }
        BX       LR               ;; return
//   63 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   64 static void LED_QueueInit()
//   65 { 
//   66   for(INT8U index = LEDColorStart;index < LEDColorEnd;++index)
LED_QueueInit:
        MOVS     R0,#+0
        B.N      ??LED_QueueInit_0
//   67   {
//   68     LEDQueue[index].Tim = 0;
??LED_QueueInit_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+60
        LDR.W    R2,??DataTable8_6
        MLA      R1,R1,R0,R2
        MOVS     R2,#+0
        STRH     R2,[R1, #+0]
//   69     LEDQueue[index].Queue_Head = 0;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+60
        LDR.W    R2,??DataTable8_6
        MLA      R1,R1,R0,R2
        MOVS     R2,#+0
        STRB     R2,[R1, #+50]
//   70     LEDQueue[index].Queue_Rear = 0;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+60
        LDR.W    R2,??DataTable8_6
        MLA      R1,R1,R0,R2
        MOVS     R2,#+0
        STRB     R2,[R1, #+51]
//   71     LEDQueue[index].Queue_Stat = Empty; 
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+60
        LDR.W    R2,??DataTable8_6
        MLA      R1,R1,R0,R2
        MOVS     R2,#+2
        STRB     R2,[R1, #+52]
//   72   }
        ADDS     R0,R0,#+1
??LED_QueueInit_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BCC.N    ??LED_QueueInit_1
//   73   LEDQueue[Green].setLED = setGreenLED;
        LDR.W    R0,??DataTable8_6
        LDR.W    R1,??DataTable8_7
        STR      R1,[R0, #+56]
//   74   LEDQueue[Red].setLED = setRedLED;
        LDR.W    R0,??DataTable8_6
        LDR.W    R1,??DataTable8_8
        STR      R1,[R0, #+116]
//   75   LEDQueue[White].setLED = setWhiteLED;
        LDR.W    R0,??DataTable8_6
        LDR.W    R1,??DataTable8_9
        STR      R1,[R0, #+176]
//   76 }
        BX       LR               ;; return
//   77 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   78 static void LedQStaUpdate(INT8U id,LedQState state)
//   79 {
LedQStaUpdate:
        PUSH     {R4}
//   80   if(LEDQueue[id].Queue_Head == LEDQueue[id].Queue_Rear)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+60
        LDR.W    R3,??DataTable8_6
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+50]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R3,#+60
        LDR.W    R4,??DataTable8_6
        MLA      R3,R3,R0,R4
        LDRB     R3,[R3, #+51]
        CMP      R2,R3
        BNE.N    ??LedQStaUpdate_0
//   81   {
//   82     LEDQueue[id].Queue_Stat = state;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+60
        LDR.W    R3,??DataTable8_6
        MLA      R0,R2,R0,R3
        STRB     R1,[R0, #+52]
        B.N      ??LedQStaUpdate_1
//   83   }
//   84   else
//   85   {
//   86     LEDQueue[id].Queue_Stat = Normal;
??LedQStaUpdate_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+60
        LDR.W    R2,??DataTable8_6
        MLA      R0,R1,R0,R2
        MOVS     R1,#+1
        STRB     R1,[R0, #+52]
//   87   }
//   88 }
??LedQStaUpdate_1:
        POP      {R4}
        BX       LR               ;; return
//   89 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   90 static void LED_UpdateSta(INT8U id)
//   91 {
LED_UpdateSta:
        PUSH     {R3-R5,LR}
        MOVS     R1,R0
//   92   INT16U TimTemp = LEDQueue[id].Tim % LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_OnOff;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+60
        LDR.W    R2,??DataTable8_6
        MLA      R0,R0,R1,R2
        LDRH     R0,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+60
        LDR.W    R3,??DataTable8_6
        MLA      R2,R2,R1,R3
        LDRB     R2,[R2, #+50]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R3,#+60
        LDR.W    R4,??DataTable8_6
        MLA      R3,R3,R1,R4
        ADDS     R2,R3,R2, LSL #+3
        LDRB     R2,[R2, #+4]
        SDIV     R3,R0,R2
        MLS      R0,R2,R3,R0
//   93    
//   94   if(TimTemp < LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_On1 + LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_Off1)
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+60
        LDR.W    R3,??DataTable8_6
        MLA      R2,R2,R1,R3
        LDRB     R2,[R2, #+50]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R3,#+60
        LDR.W    R4,??DataTable8_6
        MLA      R3,R3,R1,R4
        ADDS     R2,R3,R2, LSL #+3
        LDRB     R2,[R2, #+5]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R3,#+60
        LDR.W    R4,??DataTable8_6
        MLA      R3,R3,R1,R4
        LDRB     R3,[R3, #+50]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R4,#+60
        LDR.W    R5,??DataTable8_6
        MLA      R4,R4,R1,R5
        ADDS     R3,R4,R3, LSL #+3
        LDRB     R3,[R3, #+6]
        UXTAB    R2,R3,R2
        CMP      R0,R2
        BGE.N    ??LED_UpdateSta_0
//   95   {
//   96     if(0 == TimTemp)
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??LED_UpdateSta_1
//   97     {
//   98       if(0 != LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_On1)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+60
        LDR.W    R2,??DataTable8_6
        MLA      R0,R0,R1,R2
        LDRB     R0,[R0, #+50]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+60
        LDR.W    R3,??DataTable8_6
        MLA      R2,R2,R1,R3
        ADDS     R0,R2,R0, LSL #+3
        LDRB     R0,[R0, #+5]
        CMP      R0,#+0
        BEQ.N    ??LED_UpdateSta_2
//   99       {
//  100         LEDQueue[id].setLED(LED_ON);
        MOVS     R0,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+60
        LDR.W    R3,??DataTable8_6
        MLA      R1,R2,R1,R3
        LDR      R1,[R1, #+56]
        BLX      R1
        B.N      ??LED_UpdateSta_3
//  101       }
//  102       else
//  103       {
//  104         LEDQueue[id].setLED(LED_OFF);
??LED_UpdateSta_2:
        MOVS     R0,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+60
        LDR.W    R3,??DataTable8_6
        MLA      R1,R2,R1,R3
        LDR      R1,[R1, #+56]
        BLX      R1
        B.N      ??LED_UpdateSta_3
//  105       }
//  106     }
//  107     else
//  108     {
//  109       if(TimTemp == LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_On1)
??LED_UpdateSta_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+60
        LDR.N    R3,??DataTable8_6
        MLA      R2,R2,R1,R3
        LDRB     R2,[R2, #+50]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R3,#+60
        LDR.N    R4,??DataTable8_6
        MLA      R3,R3,R1,R4
        ADDS     R2,R3,R2, LSL #+3
        LDRB     R2,[R2, #+5]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R0,R2
        BNE.W    ??LED_UpdateSta_3
//  110       {
//  111         LEDQueue[id].setLED(LED_OFF);
        MOVS     R0,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+60
        LDR.N    R3,??DataTable8_6
        MLA      R1,R2,R1,R3
        LDR      R1,[R1, #+56]
        BLX      R1
        B.N      ??LED_UpdateSta_3
//  112       }
//  113     }
//  114   }
//  115   else
//  116   {
//  117     if(LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_On1 + LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_Off1 == TimTemp)
??LED_UpdateSta_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+60
        LDR.N    R3,??DataTable8_6
        MLA      R2,R2,R1,R3
        LDRB     R2,[R2, #+50]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R3,#+60
        LDR.N    R4,??DataTable8_6
        MLA      R3,R3,R1,R4
        ADDS     R2,R3,R2, LSL #+3
        LDRB     R2,[R2, #+5]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R3,#+60
        LDR.N    R4,??DataTable8_6
        MLA      R3,R3,R1,R4
        LDRB     R3,[R3, #+50]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R4,#+60
        LDR.N    R5,??DataTable8_6
        MLA      R4,R4,R1,R5
        ADDS     R3,R4,R3, LSL #+3
        LDRB     R3,[R3, #+6]
        UXTAB    R2,R3,R2
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R2,R0
        BNE.N    ??LED_UpdateSta_4
//  118     {
//  119       if(0 != LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_On2)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+60
        LDR.N    R2,??DataTable8_6
        MLA      R0,R0,R1,R2
        LDRB     R0,[R0, #+50]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+60
        LDR.N    R3,??DataTable8_6
        MLA      R2,R2,R1,R3
        ADDS     R0,R2,R0, LSL #+3
        LDRB     R0,[R0, #+7]
        CMP      R0,#+0
        BEQ.N    ??LED_UpdateSta_3
//  120       {
//  121         LEDQueue[id].setLED(LED_ON);
        MOVS     R0,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+60
        LDR.N    R3,??DataTable8_6
        MLA      R1,R2,R1,R3
        LDR      R1,[R1, #+56]
        BLX      R1
        B.N      ??LED_UpdateSta_3
//  122       }
//  123     }
//  124     else
//  125     {
//  126       if(LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_On1 + LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_Off1 + LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_On2 == TimTemp)
??LED_UpdateSta_4:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+60
        LDR.N    R3,??DataTable8_6
        MLA      R2,R2,R1,R3
        LDRB     R2,[R2, #+50]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R3,#+60
        LDR.N    R4,??DataTable8_6
        MLA      R3,R3,R1,R4
        ADDS     R2,R3,R2, LSL #+3
        LDRB     R2,[R2, #+5]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R3,#+60
        LDR.N    R4,??DataTable8_6
        MLA      R3,R3,R1,R4
        LDRB     R3,[R3, #+50]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R4,#+60
        LDR.N    R5,??DataTable8_6
        MLA      R4,R4,R1,R5
        ADDS     R3,R4,R3, LSL #+3
        LDRB     R3,[R3, #+6]
        UXTAB    R2,R3,R2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R3,#+60
        LDR.N    R4,??DataTable8_6
        MLA      R3,R3,R1,R4
        LDRB     R3,[R3, #+50]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R4,#+60
        LDR.N    R5,??DataTable8_6
        MLA      R4,R4,R1,R5
        ADDS     R3,R4,R3, LSL #+3
        LDRB     R3,[R3, #+7]
        UXTAB    R2,R2,R3
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R2,R0
        BNE.N    ??LED_UpdateSta_3
//  127       {
//  128         LEDQueue[id].setLED(LED_OFF);
        MOVS     R0,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+60
        LDR.N    R3,??DataTable8_6
        MLA      R1,R2,R1,R3
        LDR      R1,[R1, #+56]
        BLX      R1
//  129       }
//  130     }
//  131   }
//  132 }
??LED_UpdateSta_3:
        POP      {R0,R4,R5,PC}    ;; return
//  133 
//  134 #endif
//  135 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  136 void LED_Init(void)
//  137 {
LED_Init:
        PUSH     {R7,LR}
//  138 #if EN_LED != 0
//  139   LED_IOInit();
        BL       LED_IOInit
//  140   setGreenLED(LED_OFF);
        MOVS     R0,#+1
        BL       setGreenLED
//  141   setRedLED(LED_OFF);
        MOVS     R0,#+1
        BL       setRedLED
//  142   setWhiteLED(LED_OFF);
        MOVS     R0,#+1
        BL       setWhiteLED
//  143   LED_QueueInit();
        BL       LED_QueueInit
//  144 #else
//  145   return;
//  146 #endif
//  147 }
        POP      {R0,PC}          ;; return
//  148 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  149 INT8U LedCtlSet(LEDColor id,
//  150                 INT16U tim_all,
//  151                 INT8U tim_on1,
//  152                 INT8U tim_off1,
//  153                 INT8U tim_on2,
//  154                 INT8U tim_off2
//  155                )
//  156 {
LedCtlSet:
        PUSH     {R3-R7,LR}
        LDR      R4,[SP, #+24]
        LDR      R5,[SP, #+28]
//  157 #if EN_LED != 0
//  158   if(Full != LEDQueue[id].Queue_Stat)//¶ÓÁÐÎ´Âú
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R6,#+60
        LDR.N    R7,??DataTable8_6
        MLA      R6,R6,R0,R7
        LDRB     R6,[R6, #+52]
        CMP      R6,#+0
        BEQ.W    ??LedCtlSet_0
//  159   {
//  160     LEDQueue[id].Tim = 0;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R6,#+60
        LDR.N    R7,??DataTable8_6
        MLA      R6,R6,R0,R7
        MOVS     R7,#+0
        STRH     R7,[R6, #+0]
//  161     LEDQueue[id].CtlData[LEDQueue[id].Queue_Rear].Tim_All = tim_all;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R6,#+60
        LDR.N    R7,??DataTable8_6
        MLA      R6,R6,R0,R7
        LDRB     R6,[R6, #+51]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R7,#+60
        LDR.W    R12,??DataTable8_6
        MLA      R7,R7,R0,R12
        ADDS     R6,R7,R6, LSL #+3
        STRH     R1,[R6, #+2]
//  162     LEDQueue[id].CtlData[LEDQueue[id].Queue_Rear].Tim_On1 = tim_on1;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+60
        LDR.N    R6,??DataTable8_6
        MLA      R1,R1,R0,R6
        LDRB     R1,[R1, #+51]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R6,#+60
        LDR.N    R7,??DataTable8_6
        MLA      R6,R6,R0,R7
        ADDS     R1,R6,R1, LSL #+3
        STRB     R2,[R1, #+5]
//  163     LEDQueue[id].CtlData[LEDQueue[id].Queue_Rear].Tim_Off1 = tim_off1;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+60
        LDR.N    R6,??DataTable8_6
        MLA      R1,R1,R0,R6
        LDRB     R1,[R1, #+51]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R6,#+60
        LDR.N    R7,??DataTable8_6
        MLA      R6,R6,R0,R7
        ADDS     R1,R6,R1, LSL #+3
        STRB     R3,[R1, #+6]
//  164     LEDQueue[id].CtlData[LEDQueue[id].Queue_Rear].Tim_On2 = tim_on2;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+60
        LDR.N    R6,??DataTable8_6
        MLA      R1,R1,R0,R6
        LDRB     R1,[R1, #+51]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R6,#+60
        LDR.N    R7,??DataTable8_6
        MLA      R6,R6,R0,R7
        ADDS     R1,R6,R1, LSL #+3
        STRB     R4,[R1, #+7]
//  165     LEDQueue[id].CtlData[LEDQueue[id].Queue_Rear].Tim_Off2 = tim_off2;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+60
        LDR.N    R6,??DataTable8_6
        MLA      R1,R1,R0,R6
        LDRB     R1,[R1, #+51]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R6,#+60
        LDR.N    R7,??DataTable8_6
        MLA      R6,R6,R0,R7
        ADDS     R1,R6,R1, LSL #+3
        STRB     R5,[R1, #+8]
//  166     LEDQueue[id].CtlData[LEDQueue[id].Queue_Rear].Tim_OnOff = tim_on1 + tim_off1 + tim_on2 + tim_off2;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+60
        LDR.N    R6,??DataTable8_6
        MLA      R1,R1,R0,R6
        LDRB     R1,[R1, #+51]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R6,#+60
        LDR.N    R7,??DataTable8_6
        MLA      R6,R6,R0,R7
        ADDS     R1,R6,R1, LSL #+3
        ADDS     R2,R3,R2
        ADDS     R2,R4,R2
        ADDS     R2,R5,R2
        STRB     R2,[R1, #+4]
//  167     LED_EnQueue(id);//Èë¶Ó
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+60
        LDR.N    R2,??DataTable8_6
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+51]
        ADDS     R1,R1,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+60
        LDR.N    R3,??DataTable8_6
        MLA      R2,R2,R0,R3
        STRB     R1,[R2, #+51]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+60
        LDR.N    R2,??DataTable8_6
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+51]
        MOVS     R2,#+6
        SDIV     R3,R1,R2
        MLS      R1,R2,R3,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+60
        LDR.N    R3,??DataTable8_6
        MLA      R2,R2,R0,R3
        STRB     R1,[R2, #+51]
//  168     LedQStaUpdate(id,Full);//¸üÐÂ¶ÓÁÐ×´Ì¬
        MOVS     R1,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LedQStaUpdate
//  169     return KOS_OK;
        MOVS     R0,#+0
        B.N      ??LedCtlSet_1
//  170   }
//  171   else
//  172   {
//  173     return KOS_ERR;
??LedCtlSet_0:
        MOVS     R0,#+1
??LedCtlSet_1:
        POP      {R1,R4-R7,PC}    ;; return
//  174   }
//  175 #else
//  176   return KOS_OK;
//  177 #endif
//  178 }
//  179 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  180 void LED_CtlProc(void)
//  181 {
LED_CtlProc:
        PUSH     {R4,LR}
//  182 #if EN_LED != 0
//  183   for(INT8U index = LEDColorStart;index < LEDColorEnd;++index)
        MOVS     R4,#+0
        B.N      ??LED_CtlProc_0
//  184   {
//  185     if(Empty != LEDQueue[index].Queue_Stat)
//  186     {
//  187       if(LEDQueue[index].CtlData[LEDQueue[index].Queue_Head].Tim_All == LEDQueue[index].Tim)
//  188       {
//  189         LEDQueue[index].Tim = 0;
//  190         LED_DeQueue(index);//³ö¶Ó
//  191         LedQStaUpdate(index,Empty);//¸üÐÂ¶ÓÁÐ×´Ì¬
//  192         LED_UpdateSta(index);
//  193       }
//  194       else
//  195       {   
//  196         LED_UpdateSta(index);
??LED_CtlProc_1:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LED_UpdateSta
//  197         LEDQueue[index].Tim++;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+60
        LDR.N    R1,??DataTable8_6
        MLA      R0,R0,R4,R1
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+60
        LDR.N    R2,??DataTable8_6
        MLA      R1,R1,R4,R2
        STRH     R0,[R1, #+0]
//  198       }
??LED_CtlProc_2:
        ADDS     R4,R4,#+1
??LED_CtlProc_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+3
        BCS.N    ??LED_CtlProc_3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+60
        LDR.N    R1,??DataTable8_6
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+52]
        CMP      R0,#+2
        BEQ.N    ??LED_CtlProc_2
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+60
        LDR.N    R1,??DataTable8_6
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+50]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+60
        LDR.N    R2,??DataTable8_6
        MLA      R1,R1,R4,R2
        ADDS     R0,R1,R0, LSL #+3
        LDRH     R0,[R0, #+2]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+60
        LDR.N    R2,??DataTable8_6
        MLA      R1,R1,R4,R2
        LDRH     R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??LED_CtlProc_1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+60
        LDR.N    R1,??DataTable8_6
        MLA      R0,R0,R4,R1
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+60
        LDR.N    R1,??DataTable8_6
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+50]
        ADDS     R0,R0,#+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+60
        LDR.N    R2,??DataTable8_6
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+50]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+60
        LDR.N    R1,??DataTable8_6
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+50]
        MOVS     R1,#+6
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+60
        LDR.N    R2,??DataTable8_6
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+50]
        MOVS     R1,#+2
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LedQStaUpdate
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LED_UpdateSta
        B.N      ??LED_CtlProc_2
//  199     }
//  200   }
//  201 #else
//  202 
//  203 #endif
//  204 }
??LED_CtlProc_3:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0x400ff088

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     0x400ff084

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     0x4004b01c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     0x400ff094

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     0x4004b024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     0x4004b02c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     LEDQueue

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     setGreenLED

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_8:
        DC32     setRedLED

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_9:
        DC32     setWhiteLED

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
//   180 bytes in section .bss
// 1 528 bytes in section .text
// 
// 1 528 bytes of CODE memory
//   180 bytes of DATA memory
//
//Errors: none
//Warnings: none
