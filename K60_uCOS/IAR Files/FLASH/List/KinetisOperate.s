///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      03/Nov/2015  20:45:50 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\KinetisDrivers /
//                    \KinetisOperate.c                                       /
//    Command line =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\KinetisDrivers /
//                    \KinetisOperate.c -D COMPILER_IAR -lCN                  /
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
//                    Files\FLASH\List\KinetisOperate.s                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME KinetisOperate

        #define SHT_PROGBITS 0x1

        PUBLIC EnableInt_Kinetis
        PUBLIC NullFun_Kinetis
        PUBLIC SetIntPri_Kinetis

// C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\KinetisDrivers\KinetisOperate.c
//    1 /************************************************************************************
//    2 
//    3 * KinetisOperate.c
//    4 
//    5 * ¶¨ÒåKinetisµÄ»ù±¾µ×²ã²Ù×÷º¯Êý(ÖÐ¶ÏµÄÉèÖÃÓëCPUÄ£Ê½µÄÉèÖÃ)¡£
//    6 
//    7 * ËùÖ§³ÖµÄÐ¾Æ¬:   K10ÏµÁÐÓëK60ÏµÁÐ
//    8 * ËùÖ§³ÖµÄ±àÒëÆ÷: CodeWarrior 10.x or IAR 6.30
//    9 
//   10 * ¸Ãµ×²ãÇý¶¯ÓÉ±àÒëÆ÷×Ô¶¯Éú³ÉµÄÆô¶¯´úÂëºÍ·ÉË¼¿¨¶û¹Ù·½Àý³ÌÕûÀí¡¢ÐÞ¸Ä¶ø³É¡£
//   11 
//   12 * °æÈ¨ËùÓÐ: É½¶«´óÑ§ÖÇÄÜ³µ¹¤×÷ÊÒ
//   13 * ×÷Õß:     ËïÎÄ½¡       (µÚÁù½ìÉãÏñÍ·)
//   14 * ÌØ±ðÃùÐ»: ¼Í³É         (µÚËÄ½ìÉãÏñÍ·)
//   15 * PS: ¸Ãµ×²ãÇý¶¯ÊÇÔÚ¼¼Êõ´óÉñ¡¢ËÄ³¯ÔªÀÏ¡ª¡ªÎ°´óµÄ¼ÍÊ¦ÐÖµÄÖ¸µ¼Óë°ïÖúÏÂÍê³ÉµÄ£¬¹ÊÔÚ´ËÌØ±ðÃùÐ»¡£
//   16 *     ÓûÉîÈëÑ§Ï°Kinetis£¬¿ÉÒÔµÇÂ¼¼ÍÊ¦ÐÖµÄ²©¿Íhttp://blog.chinaaet.com/jihceng0622
//   17 
//   18 * ³ÌÐò°æ±¾: V1.02 
//   19 * ¸üÐÂÊ±¼ä: 2012-05-01
//   20 
//   21 *************************************************************************************/
//   22 
//   23 #include "./KinetisConfig.h"
//   24 
//   25 /* ÉùÃ÷ÖÐ¶ÏÏòÁ¿±í */
//   26 extern K_int32u_t __Sword_Vector__[]; 
//   27 
//   28 /************************************************************************************************ 
//   29 * EnableInt_Kinetis
//   30 * ¿ªÆôÄ³ÖÐ¶Ï
//   31 * Èë¿Ú²ÎÊý: irq ÖÐ¶Ï±êºÅ(×¢Òâ²»ÊÇÏòÁ¿±íÖÐµÄÏòÁ¿ºÅ,ÊÇÏòÁ¿ºÅ-16)
//   32 * ·µ»Ø²ÎÊý: Éè¶¨½á¹û,Éè¶¨³É¹¦·µ»ØNOERR_Kinetis
//   33 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   34 Kinetis_Error_t EnableInt_Kinetis(K_int32u_t irq)
//   35 {
//   36   K_int32u_t div;
//   37 
//   38 #if EN_CheckOpt_Kinetis != 0
//   39   Kinetis_Error_t err = NOERR_Kinetis;
//   40   
//   41   if (irq > 91)
//   42   {
//   43     err |= ERR_IntNum_Kinetis;  
//   44   }
//   45   if(__Sword_Vector__[irq + 16] == (K_int32u_t)NullFun_Kinetis)
//   46   {
//   47     err |= ERR_IntISR_Kinetis;
//   48   }
//   49   
//   50   if(err != NOERR_Kinetis)
//   51   {
//   52     return err;
//   53   }
//   54 #endif
//   55 
//   56   /* Determine which of the NVICISERs corresponds to the irq */
//   57   div = irq >> 5;
EnableInt_Kinetis:
        LSRS     R1,R0,#+5
//   58 
//   59   if(div == 0)
        CMP      R1,#+0
        BNE.N    ??EnableInt_Kinetis_0
//   60   {
//   61     NVICICPR0 = 1 << (irq & 0x1F);
        MOVS     R1,#+1
        ANDS     R2,R0,#0x1F
        LSLS     R1,R1,R2
        LDR.N    R2,??DataTable1  ;; 0xe000e280
        STR      R1,[R2, #+0]
//   62     NVICISER0 = 1 << (irq & 0x1F);
        MOVS     R1,#+1
        ANDS     R0,R0,#0x1F
        LSLS     R0,R1,R0
        LDR.N    R1,??DataTable1_1  ;; 0xe000e100
        STR      R0,[R1, #+0]
        B.N      ??EnableInt_Kinetis_1
//   63   } 
//   64   else if(div == 1)
??EnableInt_Kinetis_0:
        CMP      R1,#+1
        BNE.N    ??EnableInt_Kinetis_2
//   65   {
//   66     NVICICPR1 = 1 << (irq & 0x1F);
        MOVS     R1,#+1
        ANDS     R2,R0,#0x1F
        LSLS     R1,R1,R2
        LDR.N    R2,??DataTable1_2  ;; 0xe000e284
        STR      R1,[R2, #+0]
//   67     NVICISER1 = 1 << (irq & 0x1F);
        MOVS     R1,#+1
        ANDS     R0,R0,#0x1F
        LSLS     R0,R1,R0
        LDR.N    R1,??DataTable1_3  ;; 0xe000e104
        STR      R0,[R1, #+0]
        B.N      ??EnableInt_Kinetis_1
//   68   }
//   69   else
//   70   {
//   71     NVICICPR2 = 1 << (irq & 0x1F);
??EnableInt_Kinetis_2:
        MOVS     R1,#+1
        ANDS     R2,R0,#0x1F
        LSLS     R1,R1,R2
        LDR.N    R2,??DataTable1_4  ;; 0xe000e288
        STR      R1,[R2, #+0]
//   72     NVICISER2 = 1 << (irq & 0x1F);
        MOVS     R1,#+1
        ANDS     R0,R0,#0x1F
        LSLS     R0,R1,R0
        LDR.N    R1,??DataTable1_5  ;; 0xe000e108
        STR      R0,[R1, #+0]
//   73   }   
//   74   
//   75   return NOERR_Kinetis;
??EnableInt_Kinetis_1:
        MOVS     R0,#+0
        BX       LR               ;; return
//   76 }
//   77 /************************************************************************************************ 
//   78 * SetIntPri_Kinetis
//   79 * Éè¶¨ÖÐ¶ÏÓÅÏÈ¼¶
//   80 * Èë¿Ú²ÎÊý: irq  ÖÐ¶Ï±êºÅ(×¢Òâ²»ÊÇÏòÁ¿±íÖÐµÄÏòÁ¿ºÅ,ÊÇÏòÁ¿ºÅ-16)
//   81 *           prio ÖÐ¶ÏÓÅÏÈ¼¶(È¡Öµ0-15,ÖµÔ½Ð¡ÓÅÏÈ¼¶Ô½¸ß)
//   82 * ·µ»Ø²ÎÊý: Éè¶¨½á¹û,Éè¶¨³É¹¦·µ»ØNOERR_Kinetis
//   83 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   84 Kinetis_Error_t SetIntPri_Kinetis(K_int32u_t irq, K_int32u_t prio)
//   85 {
//   86   /*irq priority pointer*/
//   87   K_int8u_t *prio_reg;
//   88 
//   89 #if EN_CheckOpt_Kinetis != 0
//   90   Kinetis_Error_t err = NOERR_Kinetis;
//   91   
//   92   if (irq > 91) 
//   93   {
//   94     err |= ERR_IntNum_Kinetis;  
//   95   }
//   96   if (prio > 15)
//   97   {
//   98     err |= ERR_IntPri_Kinetis;
//   99   }
//  100   if(__Sword_Vector__[irq + 16] == (K_int32u_t)NullFun_Kinetis)
//  101   {
//  102     err |= ERR_IntISR_Kinetis;
//  103   }
//  104   
//  105   if(err != NOERR_Kinetis)
//  106   {
//  107     return err;
//  108   }
//  109 #endif
//  110 
//  111   /* Determine which of the NVICIPx corresponds to the irq */
//  112   prio_reg = (K_int8u_t *)(((K_int32u_t)&NVICIP0) + irq);
SetIntPri_Kinetis:
        ADD      R0,R0,#-536870912
        ADDS     R0,R0,#+58368
//  113   /* Assign priority to IRQ */
//  114   *prio_reg = ( (prio & 0x000F) << (8 - ARM_INTERRUPT_LEVEL_BITS) );   
        LSLS     R1,R1,#+4
        STRB     R1,[R0, #+0]
//  115 
//  116   return NOERR_Kinetis;
        MOVS     R0,#+0
        BX       LR               ;; return
//  117 }
//  118 #if EN_DisableInt_Kinetis != 0
//  119 /************************************************************************************************ 
//  120 * DisableInt_Kinetis
//  121 * ½ûÓÃÄ³ÖÐ¶Ï
//  122 * Èë¿Ú²ÎÊý: irq ÖÐ¶Ï±êºÅ(×¢Òâ²»ÊÇÏòÁ¿±íÖÐµÄÏòÁ¿ºÅ,ÊÇÏòÁ¿ºÅ-16)
//  123 * ·µ»Ø²ÎÊý: Éè¶¨½á¹û,Éè¶¨³É¹¦·µ»ØNOERR_Kinetis
//  124 ************************************************************************************************/
//  125 Kinetis_Error_t DisableInt_Kinetis(K_int32u_t irq)
//  126 {
//  127   K_int32u_t div;
//  128     
//  129 #if EN_CheckOpt_Kinetis != 0
//  130   Kinetis_Error_t err = NOERR_Kinetis;
//  131     
//  132   if (irq > 91)
//  133   {
//  134     err |= ERR_IntNum_Kinetis;  
//  135   }
//  136     
//  137   if(err != NOERR_Kinetis)
//  138   {
//  139     return err;
//  140   }
//  141 #endif
//  142 
//  143   /* Determine which of the NVICICERs corresponds to the irq */
//  144   div = irq >> 5;
//  145 
//  146   if(div == 0)
//  147   {
//  148     NVICICER0 = 1 << (irq & 0x1F);
//  149   }
//  150   else if(div == 1)
//  151   {
//  152     NVICICER1 = 1 << (irq & 0x1F);
//  153   }
//  154   else
//  155   {
//  156     NVICICER2 = 1 << (irq & 0x1F);
//  157   } 
//  158 
//  159   return NOERR_Kinetis;
//  160 }
//  161 #endif
//  162 #if EN_StopFun_Kinetis != 0
//  163 /************************************************************************************************ 
//  164 * Stop_Kinetis
//  165 * ½«KinetisÉèÖÃÔÚStopÄ£Ê½
//  166 ************************************************************************************************/
//  167 void Stop_Kinetis(void)
//  168 {
//  169   /* Set the SLEEPDEEP bit to enable deep sleep mode (STOP) */
//  170   SCB_SCR |= SCB_SCR_SLEEPDEEP_MASK;  
//  171 
//  172   /* WFI instruction will start entry into STOP mode */
//  173   asm("WFI");
//  174 }
//  175 #endif
//  176 #if EN_WaitFun_Kinetis != 0
//  177 /************************************************************************************************ 
//  178 * Wait_Kinetis
//  179 * ½«KinetisÉèÖÃÔÚWaitÄ£Ê½
//  180 ************************************************************************************************/
//  181 void Wait_Kinetis(void)
//  182 {
//  183   /* 
//  184    * Clear the SLEEPDEEP bit to make sure we go into WAIT (sleep) mode instead
//  185    * of deep sleep.
//  186    */
//  187   SCB_SCR &= ~SCB_SCR_SLEEPDEEP_MASK;  
//  188 
//  189   /* WFI instruction will start entry into WAIT mode */
//  190   asm("WFI");
//  191 }
//  192 #endif
//  193 /************************************************************************************************ 
//  194 * NullFun_Kinetis
//  195 * KinetisµÄ¿Õ²Ù×÷º¯Êý
//  196 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  197 void NullFun_Kinetis(void)
//  198 { /* ½øÈë¿Õº¯Êý, Ö±½ÓÊ¹³µ¸´Î» */
//  199   UNLOCK_WatchDog;       /* ½âËø¿ªÃÅ¹· */
NullFun_Kinetis:
        LDR.N    R0,??DataTable1_6  ;; 0x4005200e
        MOVW     R1,#+50464
        STRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable1_6  ;; 0x4005200e
        MOVW     R1,#+55592
        STRH     R1,[R0, #+0]
//  200 	
//  201   WDOG_PRESC = 0;        /* ÉèÖÃÊ±ÖÓ·ÖÆµÊýÎª1 */
        LDR.N    R0,??DataTable1_7  ;; 0x40052016
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  202 	
//  203   WDOG_TOVALH = 0x000E;  /* ÉèÖÃÒç³öÖÜÆÚ */
        LDR.N    R0,??DataTable1_8  ;; 0x40052004
        MOVS     R1,#+14
        STRH     R1,[R0, #+0]
//  204   WDOG_TOVALL = 0xA600;
        LDR.N    R0,??DataTable1_9  ;; 0x40052006
        MOV      R1,#+42496
        STRH     R1,[R0, #+0]
//  205 	
//  206   WDOG_STCTRLH = 0x4003; /* ¹Ø±ÕTestModeºÍWindowMode,Ñ¡ÔñÊ±ÖÓÎª×ÜÏßÊ±ÖÓ,²¢Ê¹ÄÜ¿ªÃÅ¹· */
        LDR.N    R0,??DataTable1_10  ;; 0x40052000
        MOVW     R1,#+16387
        STRH     R1,[R0, #+0]
//  207   
//  208   WDOG_UNLOCK = 0xC520;
        LDR.N    R0,??DataTable1_6  ;; 0x4005200e
        MOVW     R1,#+50464
        STRH     R1,[R0, #+0]
//  209   
//  210   for(;;) ;
??NullFun_Kinetis_0:
        B.N      ??NullFun_Kinetis_0
//  211 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0xe000e284

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0xe000e104

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0xe000e288

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0xe000e108

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     0x4005200e

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     0x40052016

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     0x40052004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     0x40052006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     0x40052000

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
// 210 bytes in section .text
// 
// 210 bytes of CODE memory
//
//Errors: none
//Warnings: none
