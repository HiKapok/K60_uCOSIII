///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      03/Nov/2015  20:45:49 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\ExtraFunction\ /
//                    ExtraFunction.c                                         /
//    Command line =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\ExtraFunction\ /
//                    ExtraFunction.c -D COMPILER_IAR -lCN                    /
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
//                    Files\FLASH\List\ExtraFunction.s                        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ExtraFunction

        #define SHT_PROGBITS 0x1

        EXTERN Boma
        EXTERN Cnt_SDbufS1
        EXTERN Cnt_SDbufS2
        EXTERN Cnt_SDbufS3
        EXTERN Cnt_SDbufS4
        EXTERN Cnt_SDbufS5
        EXTERN ExtKey_Init
        EXTERN Flag_SDRdy
        EXTERN KeyPad_Init
        EXTERN KeyPad_Mask
        EXTERN LED_Init
        EXTERN LedCtlSet
        EXTERN OLED_Close
        EXTERN OLED_Init
        EXTERN OLED_Mask
        EXTERN OLED_Proc
        EXTERN ReadBomaValue
        EXTERN SD_System_Init
        EXTERN Wait_SDRdy
        EXTERN sd_yes
        EXTERN write_stop
        EXTERN writebyte_ram

        PUBLIC AuxiliaryFunction
        PUBLIC BuzzerSet
        PUBLIC ExtInit_Normal
        PUBLIC ProcessKeyPad
        PUBLIC Process_BuzzerCtrl

// C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\ExtraFunction\ExtraFunction.c
//    1 #include "./ExtraFunction.h"
//    2 #include "../HardwareInterface/HardwareOperation.h"
//    3 #include "../ZLG7290/ZLG7290.h"
//    4 #include "../LEDCtl/LEDCtl_Ext.h"
//    5 #include "../OLED/OLED.h"
//    6 #include "../SD_System/SD_System.h"
//    7 
//    8 /**************************ÄÚ²¿±äÁ¿¶¨Òå**************************/
//    9 #if EN_Buzzer != 0
//   10 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   11 static INT16U Tim_Buzzer;                  /*·äÃùÆ÷Ê±¼ä±äÁ¿*/
Tim_Buzzer:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 static BuzzerData_t BuzzerQ[NUM_BuzzerQ];  /*·äÃùÆ÷»º³å¶ÓÁÐ*/
BuzzerQ:
        DS8 48

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   13 static INT8U BuzzerQ_Head,BuzzerQ_Rear;    /*·äÃùÆ÷»º³å¶ÓÁÐµÄÍ·Î²Ö¸Õë*/
BuzzerQ_Head:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
BuzzerQ_Rear:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   14 static INT8U BuzzerQ_Stat;                 /*·äÃùÆ÷»º³å¶ÓÁÐ×´Ì¬,=0±íÊ¾¶ÓÂú*/
BuzzerQ_Stat:
        DS8 1
//   15 
//   16 #endif
//   17 
//   18 /**************************ÄÚ²¿º¯Êý¶¨Òå**************************/
//   19 #if EN_SDCard != 0 
//   20 
//   21 /*Èç¹ûSD¿¨¶ÁÐ´ÖÐÊ¹ÓÃÁËË«»º´æ²¢Ê¹ÄÜÁËÍ³¼Æ¹¦ÄÜ,Ôò½«Í³¼Æ½á¹ûÐ´ÈëSD¿¨*/
//   22 #ifdef EN_SDbuf  
//   23 #ifdef EN_Cnt_SDbuf
//   24 /************************************************************************************************ 
//   25 * WriteVar_SD
//   26 * ½«16Î»ÎÞ·ûºÅÊý¾Ý°´ASCIIÂëµÄÐÎÊ½Ð´ÈëSD¿¨
//   27 * ÊäÈë²ÎÊý  dat:´úÐ´ÈëÊý¾Ý
//   28 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   29 static void WriteVar_SD(INT16U dat)
//   30 {
WriteVar_SD:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
//   31   INT16U div=10000,flag=0,tmp;
        MOVW     R5,#+10000
        MOVS     R6,#+0
        B.N      ??WriteVar_SD_0
//   32   for(;div!=0 ;div/=10)
//   33   {
//   34     tmp=(dat/div)%10;
??WriteVar_SD_1:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        SDIV     R0,R4,R5
        MOVS     R1,#+10
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
//   35     if(tmp!=0) flag=1;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BEQ.N    ??WriteVar_SD_2
        MOVS     R6,#+1
//   36     if(flag)
??WriteVar_SD_2:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BEQ.N    ??WriteVar_SD_3
//   37     {
//   38       writebyte_ram('0'+ tmp);
        ADDS     R0,R0,#+48
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//   39     }
//   40   }
??WriteVar_SD_3:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R0,#+10
        SDIV     R5,R5,R0
??WriteVar_SD_0:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BNE.N    ??WriteVar_SD_1
//   41   
//   42   if(flag == 0) writebyte_ram('0'); 
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BNE.N    ??WriteVar_SD_4
        MOVS     R0,#+48
        BL       writebyte_ram
//   43 }
??WriteVar_SD_4:
        POP      {R4-R6,PC}       ;; return
//   44 /************************************************************************************************ 
//   45 * BufTest_SD
//   46 * ½«SD¿¨Ë«»º´æµÄÊ¹ÓÃÇé¿öÌí¼Óµ½ÎÄ¼þµÄÄ©Î²
//   47 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   48 static void BufTest_SD()
//   49 {
BufTest_SD:
        PUSH     {R3-R7,LR}
//   50   INT16U s1,s2,s3,s4,s5;
//   51   
//   52   writebyte_ram('\r');
        MOVS     R0,#+13
        BL       writebyte_ram
//   53   writebyte_ram('\n');
        MOVS     R0,#+10
        BL       writebyte_ram
//   54   
//   55   s1=Cnt_SDbufS1;
        LDR.W    R0,??DataTable6
        LDRH     R0,[R0, #+0]
//   56   s2=Cnt_SDbufS2;
        LDR.W    R1,??DataTable6_1
        LDRH     R4,[R1, #+0]
//   57   s3=Cnt_SDbufS3;
        LDR.W    R1,??DataTable6_2
        LDRH     R5,[R1, #+0]
//   58   s4=Cnt_SDbufS4;
        LDR.W    R1,??DataTable6_3
        LDRH     R6,[R1, #+0]
//   59   s5=Cnt_SDbufS5;
        LDR.W    R1,??DataTable6_4
        LDRH     R7,[R1, #+0]
//   60   
//   61   WriteVar_SD(s1);
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       WriteVar_SD
//   62   writebyte_ram(',');
        MOVS     R0,#+44
        BL       writebyte_ram
//   63   WriteVar_SD(s2);
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       WriteVar_SD
//   64   writebyte_ram(',');
        MOVS     R0,#+44
        BL       writebyte_ram
//   65   WriteVar_SD(s3);
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       WriteVar_SD
//   66   writebyte_ram(','); 
        MOVS     R0,#+44
        BL       writebyte_ram
//   67   WriteVar_SD(s4);
        MOVS     R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       WriteVar_SD
//   68   writebyte_ram(','); 
        MOVS     R0,#+44
        BL       writebyte_ram
//   69   WriteVar_SD(s5);
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       WriteVar_SD
//   70 }
        POP      {R0,R4-R7,PC}    ;; return
//   71 #endif
//   72 #endif
//   73 
//   74 /************************************************************************************************ 
//   75 * Write_SD
//   76 * ½«Êý¾Ý°´ÕÕÌØ¶¨¸ñÊ½´æÈëSD¿¨
//   77 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   78 static void Write_SD(void)
//   79 {
Write_SD:
        PUSH     {R7,LR}
//   80   static INT16U cnt = 0;
//   81   
//   82   writebyte_ram( (byte) 0 );
        MOVS     R0,#+0
        BL       writebyte_ram
//   83   
//   84   if(SD_Packet == cnt)   
        LDR.W    R0,??DataTable6_5
        LDRH     R0,[R0, #+0]
        CMP      R0,#+100
        BNE.N    ??Write_SD_0
//   85   { // ½«Í¼ÏñÖ¡ÊýÐ´ÈëSD¿¨(×¢ÒâÊÇÊµ¼ÊÐ´ÈëSD¿¨ÀïµÄÖ¡Êý,¶ø²»ÊÇÖ´ÐÐ¿ØÖÆ²ßÂÔµÄ³¡Êý)
//   86 
//   87     writebyte_ram( (byte)(cnt%256) );         
        LDR.N    R0,??DataTable6_5
        LDRH     R1,[R0, #+0]
        MOV      R2,#+256
        SDIV     R0,R1,R2
        MLS      R0,R0,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//   88     writebyte_ram( (byte)(cnt>>8) );
        LDR.N    R0,??DataTable6_5
        LDRH     R0,[R0, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//   89     
//   90 #ifdef EN_Cnt_SDbuf        
//   91     BufTest_SD();
        BL       BufTest_SD
//   92 #endif
//   93      
//   94     write_stop();
        BL       write_stop
//   95   }
//   96   cnt++;
??Write_SD_0:
        LDR.N    R0,??DataTable6_5
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_5
        STRH     R0,[R1, #+0]
//   97 }
        POP      {R0,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
??cnt:
        DS8 2
//   98 #endif
//   99 
//  100 
//  101 #if EN_Buzzer != 0
//  102 /************************************************************************************************ 
//  103 * BuzzerCtrl_Init
//  104 * ·äÃùÆ÷¿ØÖÆ³õÊ¼»¯
//  105 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  106 static void BuzzerCtrl_Init(void)
//  107 {
//  108   BuzzerQ_Head = 0;
BuzzerCtrl_Init:
        LDR.N    R0,??DataTable6_6
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  109   BuzzerQ_Rear = 0;
        LDR.N    R0,??DataTable6_7
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  110   BuzzerQ_Stat = 1;
        LDR.N    R0,??DataTable6_8
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  111   Tim_Buzzer = 0;
        LDR.N    R0,??DataTable6_9
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  112 }
        BX       LR               ;; return
//  113 /************************************************************************************************ 
//  114 * Process_BuzzerCtrl
//  115 * ¸ù¾Ý·äÃùÆ÷¶ÓÁÐÖÐµÄÊý¾Ý½øÐÐ·äÃùÆ÷¿ØÖÆ
//  116 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  117 void Process_BuzzerCtrl(void)
//  118 {
Process_BuzzerCtrl:
        PUSH     {R4-R7}
//  119   BuzzerData_t *pbzr;
//  120   INT8U on1,off1,on2,off2;
//  121   INT16U tim;
//  122   
//  123   if(BuzzerQ_Rear != BuzzerQ_Head || BuzzerQ_Stat == 0)
        LDR.N    R0,??DataTable6_7
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable6_6
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??Process_BuzzerCtrl_0
        LDR.N    R0,??DataTable6_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??Process_BuzzerCtrl_1
//  124   {
//  125     pbzr = &BuzzerQ[BuzzerQ_Head];
??Process_BuzzerCtrl_0:
        LDR.N    R0,??DataTable6_6
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable6_10
        ADDS     R0,R1,R0, LSL #+3
//  126     on1 = pbzr->Tim_On1;
        LDRB     R1,[R0, #+4]
//  127     off1 = pbzr->Tim_Off1;
        LDRB     R2,[R0, #+5]
//  128     on2 = pbzr->Tim_On2;
        LDRB     R3,[R0, #+6]
//  129     off2 = pbzr->Tim_Off2;
        LDRB     R4,[R0, #+7]
//  130     tim = Tim_Buzzer % (pbzr->Tim_Total);
        LDR.N    R5,??DataTable6_9
        LDRH     R5,[R5, #+0]
        LDRH     R6,[R0, #+2]
        SDIV     R7,R5,R6
        MLS      R5,R6,R7,R5
//  131     
//  132     if(tim < on1 + off1)
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTAB    R6,R2,R1
        CMP      R5,R6
        BGE.N    ??Process_BuzzerCtrl_2
//  133     {
//  134       if(0 == tim)
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BNE.N    ??Process_BuzzerCtrl_3
//  135       {
//  136         if(0 != on1)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??Process_BuzzerCtrl_4
//  137         {
//  138           ON_Buzzer();
        LDR.N    R1,??DataTable6_11  ;; 0x400ff108
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x2000000
        LDR.N    R2,??DataTable6_11  ;; 0x400ff108
        STR      R1,[R2, #+0]
        B.N      ??Process_BuzzerCtrl_5
//  139         }
//  140         else
//  141         {
//  142           OFF_Buzzer();
??Process_BuzzerCtrl_4:
        LDR.N    R1,??DataTable6_12  ;; 0x400ff104
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x2000000
        LDR.N    R2,??DataTable6_12  ;; 0x400ff104
        STR      R1,[R2, #+0]
        B.N      ??Process_BuzzerCtrl_5
//  143         }
//  144       }
//  145       else
//  146       {
//  147         if(on1 == tim)
??Process_BuzzerCtrl_3:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R1,R5
        BNE.N    ??Process_BuzzerCtrl_5
//  148         {
//  149           OFF_Buzzer();        
        LDR.N    R1,??DataTable6_12  ;; 0x400ff104
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x2000000
        LDR.N    R2,??DataTable6_12  ;; 0x400ff104
        STR      R1,[R2, #+0]
        B.N      ??Process_BuzzerCtrl_5
//  150         }
//  151       }
//  152     }
//  153     else
//  154     {
//  155       if(on1 + off1 == tim)
??Process_BuzzerCtrl_2:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTAB    R4,R2,R1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R4,R5
        BNE.N    ??Process_BuzzerCtrl_6
//  156       {
//  157         if(0 != on2)
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BEQ.N    ??Process_BuzzerCtrl_5
//  158         {
//  159           ON_Buzzer();
        LDR.N    R1,??DataTable6_11  ;; 0x400ff108
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x2000000
        LDR.N    R2,??DataTable6_11  ;; 0x400ff108
        STR      R1,[R2, #+0]
        B.N      ??Process_BuzzerCtrl_5
//  160         }
//  161       }
//  162       else
//  163       {
//  164         if(on1 + off1 + on2 == tim)
??Process_BuzzerCtrl_6:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTAB    R1,R2,R1
        UXTAB    R1,R1,R3
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R1,R5
        BNE.N    ??Process_BuzzerCtrl_5
//  165         {
//  166           OFF_Buzzer();
        LDR.N    R1,??DataTable6_12  ;; 0x400ff104
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x2000000
        LDR.N    R2,??DataTable6_12  ;; 0x400ff104
        STR      R1,[R2, #+0]
//  167         }
//  168       }
//  169     }
//  170     
//  171     if((++Tim_Buzzer) >= pbzr->Tim_All)
??Process_BuzzerCtrl_5:
        LDR.N    R1,??DataTable6_9
        LDRH     R1,[R1, #+0]
        ADDS     R1,R1,#+1
        LDR.N    R2,??DataTable6_9
        STRH     R1,[R2, #+0]
        LDRH     R0,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,R0
        BCC.N    ??Process_BuzzerCtrl_1
//  172     { /*³ö¶Ó²Ù×÷*/
//  173       OFF_Buzzer();
        LDR.N    R0,??DataTable6_12  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable6_12  ;; 0x400ff104
        STR      R0,[R1, #+0]
//  174       if((++BuzzerQ_Head) == NUM_BuzzerQ)
        LDR.N    R0,??DataTable6_6
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_6
        STRB     R0,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+6
        BNE.N    ??Process_BuzzerCtrl_7
//  175       {
//  176         BuzzerQ_Head = 0;
        LDR.N    R0,??DataTable6_6
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  177       }
//  178       Tim_Buzzer = 0;
??Process_BuzzerCtrl_7:
        LDR.N    R0,??DataTable6_9
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  179       BuzzerQ_Stat = 1;
        LDR.N    R0,??DataTable6_8
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  180     }
//  181   }
//  182 }
??Process_BuzzerCtrl_1:
        POP      {R4-R7}
        BX       LR               ;; return
//  183 
//  184 #endif
//  185 
//  186 /**************************½Ó¿Úº¯Êý¶¨Òå**************************/
//  187 /************************************************************************************************ 
//  188 * AuxiliaryFunction
//  189 * Ö´ÐÐÒ»Ð©¸¨Öú¹¦ÄÜ,Ã¿³¡¿ØÖÆ²ßÂÔºó±»µ÷ÓÃ,ÈçÏòµ÷ÊÔ¹¤¾ß·¢ËÍÊý¾Ý¡¢¿ØÖÆ·äÃùÆ÷µÈ
//  190 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  191 void AuxiliaryFunction(void) 
//  192 {
AuxiliaryFunction:
        PUSH     {R7,LR}
//  193 #if EN_SDCard != 0     
//  194   if(sd_yes == 1)     /*Ð´SD¿¨£¬ÓÃÓÚÉÏÎ»»úµ÷ÊÔ*/
        LDR.N    R0,??DataTable6_13
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??AuxiliaryFunction_0
//  195   { 
//  196     Wait_SDRdy(SD_SHORT_Wait);
        MOVW     R0,#+5000
        BL       Wait_SDRdy
//  197     if(Flag_SDRdy)
        LDR.N    R0,??DataTable6_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??AuxiliaryFunction_0
//  198     {
//  199       Write_SD();
        BL       Write_SD
//  200     } 
//  201   }
//  202   C_WDOG_IntOn();
??AuxiliaryFunction_0:
        CPSID i         
        LDR.N    R0,??DataTable6_15  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable6_15  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        CPSIE i         
//  203 #endif
//  204 
//  205 #if EN_OLED != 0
//  206   C_WDOG_IntOn();
        CPSID i         
        LDR.N    R0,??DataTable6_15  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable6_15  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        CPSIE i         
//  207   if(OLED_Mask == 0)    
        LDR.N    R0,??DataTable6_16
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??AuxiliaryFunction_1
//  208   {
//  209     OLED_Proc();    
        BL       OLED_Proc
//  210   } 
//  211 #endif 
//  212   
//  213 }
??AuxiliaryFunction_1:
        POP      {R0,PC}          ;; return
//  214 /************************************************************************************************ 
//  215 * BuzzerSet
//  216 * Éè¶¨·äÃùÆ÷µÄÏìÉù(!!!×¢Òâ:¸Ãº¯Êý²»¾ß±¸¿É³åÈëÐÔ,½ûÖ¹ÔÚÖÐ¶ÏÀï¶ÔÆä½øÐÐµ÷ÓÃ!!!)
//  217 * Èë¿Ú²ÎÊý  tim_all:ÏìÉù³ÖÐøµÄ×ÜÊ±¼ä(µ¥Î»:³¡)
//  218             tim_on1:µÚÒ»ÖÜÆÚÄÚ·äÃùÆ÷¿ªÆôµÄÊ±¼ä(µ¥Î»:³¡)
//  219             tim_off1:µÚÒ»ÖÜÆÚÄÚ·äÃùÆ÷¹Ø±ÕµÄÊ±¼ä(µ¥Î»:³¡)
//  220             tim_on2:µÚ¶þÖÜÆÚÄÚ·äÃùÆ÷¿ªÆôµÄÊ±¼ä(µ¥Î»:³¡)
//  221             tim_off2:µÚ¶þÖÜÆÚÄÚ·äÃùÆ÷¹Ø±ÕµÄÊ±¼ä(µ¥Î»:³¡)
//  222 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  223 void BuzzerSet(INT16U tim_all,INT8U tim_on1,INT8U tim_off1,INT8U tim_on2,INT8U tim_off2)
//  224 {
BuzzerSet:
        PUSH     {R4-R6}
        LDR      R4,[SP, #+12]
//  225 #if EN_Buzzer != 0
//  226   
//  227   BuzzerData_t *pbzr; 
//  228   
//  229   if(tim_all != 0 && BuzzerQ_Stat != 0)
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BEQ.N    ??BuzzerSet_0
        LDR.N    R5,??DataTable6_8
        LDRB     R5,[R5, #+0]
        CMP      R5,#+0
        BEQ.N    ??BuzzerSet_0
//  230   { /*½«ÏìÉùµÄÐÅÏ¢Èë¶Ó*/
//  231     pbzr = &BuzzerQ[BuzzerQ_Rear];
        LDR.N    R5,??DataTable6_7
        LDRB     R5,[R5, #+0]
        LDR.N    R6,??DataTable6_10
        ADDS     R5,R6,R5, LSL #+3
//  232     pbzr->Tim_All = tim_all;
        STRH     R0,[R5, #+0]
//  233     pbzr->Tim_On1 = tim_on1;
        STRB     R1,[R5, #+4]
//  234     pbzr->Tim_Off1 = tim_off1;
        STRB     R2,[R5, #+5]
//  235     pbzr->Tim_On2 = tim_on2;
        STRB     R3,[R5, #+6]
//  236     pbzr->Tim_Off2 = tim_off2;
        STRB     R4,[R5, #+7]
//  237     pbzr->Tim_Total = tim_on1 + tim_off1 + tim_on2 + tim_off2;
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTAB    R0,R2,R1
        UXTAB    R0,R0,R3
        UXTAB    R0,R0,R4
        STRH     R0,[R5, #+2]
//  238       
//  239     if((++BuzzerQ_Rear) == NUM_BuzzerQ)
        LDR.N    R0,??DataTable6_7
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+6
        BNE.N    ??BuzzerSet_1
//  240     {
//  241       BuzzerQ_Rear = 0; 
        LDR.N    R0,??DataTable6_7
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  242     }
//  243     
//  244     /*¶ÓÂúµÄÅÐ¶¨*/
//  245     if(BuzzerQ_Rear == BuzzerQ_Head)    
??BuzzerSet_1:
        LDR.N    R0,??DataTable6_7
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable6_6
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??BuzzerSet_0
//  246     {
//  247       BuzzerQ_Stat = 0;
        LDR.N    R0,??DataTable6_8
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  248     }
//  249   }
//  250 
//  251 #else
//  252 
//  253   (void)tim_all;      /*±ÜÃâ±àÒëÆ÷µÄ¾¯¸æ*/
//  254   (void)tim_on1;
//  255   (void)tim_off1;
//  256   (void)tim_on2;
//  257   (void)tim_off2;
//  258       
//  259 #endif
//  260 }
??BuzzerSet_0:
        POP      {R4-R6}
        BX       LR               ;; return
//  261 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  262 void ProcessKeyPad(INT16U * Key_Value)
//  263 {
//  264   
//  265 }
ProcessKeyPad:
        BX       LR               ;; return
//  266 /************************************************************************************************ 
//  267 * ExtInit_Normal
//  268 * Õý³£Æô¶¯Ê±µÄ¶îÍâ³õÊ¼»¯,°üÀ¨Éè¶¨ÏµÍ³Ê±ÖÓÖÐ¶ÏÀïµÄ»Øµ÷º¯Êý¡¢Éè¶¨²ÎÊý¡¢³õÊ¼»¯µ÷ÊÔ¹¤¾ßµÈ¹¦ÄÜ
//  269 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  270 void ExtInit_Normal(void)
//  271 {
ExtInit_Normal:
        PUSH     {LR}
        SUB      SP,SP,#+12
//  272   /*Éè¶¨ÖÐ¶ÏÀïµÄ»Øµ÷º¯Êý*/
//  273   Boma=ReadBomaValue();
        BL       ReadBomaValue
        LDR.N    R1,??DataTable6_17
        STRH     R0,[R1, #+0]
//  274  
//  275   switch(Boma & 0x03)
        LDR.N    R0,??DataTable6_17
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??ExtInit_Normal_0
        CMP      R0,#+2
        BEQ.N    ??ExtInit_Normal_1
        BCC.N    ??ExtInit_Normal_2
        CMP      R0,#+3
        BEQ.N    ??ExtInit_Normal_3
        B.N      ??ExtInit_Normal_4
//  276   {
//  277     case 0  :
//  278               
//  279               break;
??ExtInit_Normal_0:
        B.N      ??ExtInit_Normal_5
//  280     case 1  :
//  281               
//  282               break;
??ExtInit_Normal_2:
        B.N      ??ExtInit_Normal_5
//  283     case 2  :
//  284              
//  285               break;
??ExtInit_Normal_1:
        B.N      ??ExtInit_Normal_5
//  286     case 3  :
//  287              
//  288               break;
??ExtInit_Normal_3:
        B.N      ??ExtInit_Normal_5
//  289     default : 
//  290               
//  291               break;
//  292   }
//  293 #if EN_LED != 0
//  294   LED_Init();
??ExtInit_Normal_4:
??ExtInit_Normal_5:
        BL       LED_Init
//  295   LedCtlSet(LED_Warning);
        MOVS     R0,#+5
        STR      R0,[SP, #+4]
        MOVS     R0,#+10
        STR      R0,[SP, #+0]
        MOVS     R3,#+5
        MOVS     R2,#+30
        MOVS     R1,#+100
        MOVS     R0,#+2
        BL       LedCtlSet
//  296   C_WDOG_IntOn();
        CPSID i         
        LDR.N    R0,??DataTable6_15  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable6_15  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        CPSIE i         
//  297 #endif
//  298   
//  299 #if EN_OLED != 0
//  300     if(0 == OLED_Mask && KOS_OK != OLED_Init()) { OLED_Mask = 1; OLED_Close(); }
        LDR.N    R0,??DataTable6_16
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??ExtInit_Normal_6
        BL       OLED_Init
        CMP      R0,#+0
        BEQ.N    ??ExtInit_Normal_6
        LDR.N    R0,??DataTable6_16
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        BL       OLED_Close
//  301 #endif
//  302   C_WDOG_IntOn();
??ExtInit_Normal_6:
        CPSID i         
        LDR.N    R0,??DataTable6_15  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable6_15  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        CPSIE i         
//  303 #if EN_KeyPad != 0
//  304   if(KeyPad_Mask == 0)
        LDR.N    R0,??DataTable6_18
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??ExtInit_Normal_7
//  305   {
//  306     KeyPad_Init(ProcessKeyPad);
        LDR.N    R0,??DataTable6_19
        BL       KeyPad_Init
//  307     ExtKey_Init();    
        BL       ExtKey_Init
//  308   }  
//  309 #endif
//  310   C_WDOG_IntOn();
??ExtInit_Normal_7:
        CPSID i         
        LDR.N    R0,??DataTable6_15  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable6_15  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        CPSIE i         
//  311   /*·äÃùÆ÷¿ØÖÆ³õÊ¼»¯*/
//  312 #if EN_Buzzer != 0
//  313   BuzzerCtrl_Init();
        BL       BuzzerCtrl_Init
//  314 #endif
//  315   /*µ÷ÊÔ¹¤¾ßµÄ³õÊ¼»¯*/
//  316 #if EN_SDCard != 0   
//  317   SD_System_Init();          /*SD¿¨³õÊ¼»¯*/
        BL       SD_System_Init
//  318   if(sd_yes == 0)
        LDR.N    R0,??DataTable6_13
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??ExtInit_Normal_8
//  319   {
//  320     LedCtlSet(LED_SysErr);
        MOVS     R0,#+5
        STR      R0,[SP, #+4]
        MOVS     R0,#+20
        STR      R0,[SP, #+0]
        MOVS     R3,#+10
        MOVS     R2,#+20
        MOVS     R1,#+250
        MOVS     R0,#+1
        BL       LedCtlSet
//  321   }
//  322 #endif 
//  323   C_WDOG_IntOn();
??ExtInit_Normal_8:
        CPSID i         
        LDR.N    R0,??DataTable6_15  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable6_15  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        CPSIE i         
//  324   BuzzerSet(BZR_SysStart);
        MOVS     R0,#+20
        STR      R0,[SP, #+0]
        MOVS     R3,#+40
        MOVS     R2,#+10
        MOVS     R1,#+50
        MOVS     R0,#+240
        BL       BuzzerSet
//  325 }
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     Cnt_SDbufS1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     Cnt_SDbufS2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     Cnt_SDbufS3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     Cnt_SDbufS4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     Cnt_SDbufS5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     ??cnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     BuzzerQ_Head

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     BuzzerQ_Rear

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     BuzzerQ_Stat

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     Tim_Buzzer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     BuzzerQ

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     0x400ff108

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_12:
        DC32     0x400ff104

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_13:
        DC32     sd_yes

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_14:
        DC32     Flag_SDRdy

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_15:
        DC32     0x4005200c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_16:
        DC32     OLED_Mask

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_17:
        DC32     Boma

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_18:
        DC32     KeyPad_Mask

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_19:
        DC32     ProcessKeyPad

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
//    55 bytes in section .bss
// 1 058 bytes in section .text
// 
// 1 058 bytes of CODE memory
//    55 bytes of DATA memory
//
//Errors: none
//Warnings: 1
