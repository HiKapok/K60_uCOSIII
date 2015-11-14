///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      03/Nov/2015  20:45:50 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\FTFL\FTFL.c    /
//    Command line =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\FTFL\FTFL.c    /
//                    -D COMPILER_IAR -lCN "C:\Users\WangChangan\Desktop\K10Ð /
//                    ¡°å¶¨¸å\IAR Files\FLASH\List\" -lB                      /
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
//                    Files\FLASH\List\FTFL.s                                 /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME FTFL

        #define SHT_PROGBITS 0x1

        EXTERN malloc

        PUBLIC FTFL_EraseSector
        PUBLIC FTFL_Init
        PUBLIC FTFL_IsCmdLaunched
        PUBLIC FTFL_ReadFlash
        PUBLIC FTFL_WriteLongWord

// C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\FTFL\FTFL.c
//    1 #include "FTFL.h"
//    2 #include "stdlib.h"
//    3 #include "inttypes.h"
//    4 
//    5 /*******************************************************************************
//    6 * º¯ÊýÃû³Æ£ºFTFL_Init
//    7 * Èë¿Ú²ÎÊý£º
//    8 * ·µ»Ø²ÎÊý£º
//    9 * Ãè    Êö£º³õÊ¼»¯FTFLÄ£¿é
//   10 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   11 void FTFL_Init (void)
//   12 {
//   13   SIM_SCGC6 |= SIM_SCGC6_FTFL_MASK;
FTFL_Init:
        LDR.N    R0,??DataTable3  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable3  ;; 0x4004803c
        STR      R0,[R1, #+0]
//   14 }
        BX       LR               ;; return
//   15 /*******************************************************************************
//   16 * º¯ÊýÃû³Æ£ºFTFL_IsCmdLaunched
//   17 * Èë¿Ú²ÎÊý£º
//   18 * ·µ»Ø²ÎÊý£º
//   19 * Ãè    Êö£ºÖ´ÐÐ²¢ÅÐ¶ÏFTFLÖ¸ÁîÊÇ·ñ³É¹¦
//   20 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   21 uint8_t FTFL_IsCmdLaunched (void)
//   22 {
//   23   uint32_t nWaitCnt = 0; // µÈ´ý¼ÆÊýÆ÷
FTFL_IsCmdLaunched:
        MOVS     R0,#+0
//   24   
//   25   if (FTFL_IsAccessErr () || FTFL_IsProtectionViolated ())
        LDR.N    R1,??DataTable3_1  ;; 0x40020000
        LDRB     R1,[R1, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+26
        BMI.N    ??FTFL_IsCmdLaunched_0
        LDR.N    R1,??DataTable3_1  ;; 0x40020000
        LDRB     R1,[R1, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+27
        BPL.N    ??FTFL_IsCmdLaunched_1
//   26   {
//   27     // Èç¹ûÒÑ·¢Éú·ÃÎÊÔ½È¨»ò±£»¤ÇøÎó·ÃÎÊ£¬Çå³ýÆä²úÉúµÄ´íÎó±êÖ¾£¬·ñÔòFTFLÃüÁîÎÞ·¨Ö´ÐÐ
//   28     FTFL_ClearErrBits ();
??FTFL_IsCmdLaunched_0:
        LDR.N    R1,??DataTable3_1  ;; 0x40020000
        LDRB     R1,[R1, #+0]
        ORRS     R1,R1,#0x30
        LDR.N    R2,??DataTable3_1  ;; 0x40020000
        STRB     R1,[R2, #+0]
//   29   }
//   30   
//   31   // Çå³ýCCIFÎ»£¬Æô¶¯ÃüÁîµÄÖ´ÐÐ
//   32   FTFL_FSTAT = FTFL_FSTAT_CCIF_MASK;
??FTFL_IsCmdLaunched_1:
        LDR.N    R1,??DataTable3_1  ;; 0x40020000
        MOVS     R2,#+128
        STRB     R2,[R1, #+0]
//   33   // µÈ´ýFTFL²Ù×÷Íê³É
//   34   while (((nWaitCnt++) <= 100000) && (!FTFL_IsCmdFinish ()));
??FTFL_IsCmdLaunched_2:
        MOVS     R1,R0
        ADDS     R0,R1,#+1
        LDR.N    R2,??DataTable3_2  ;; 0x186a1
        CMP      R1,R2
        BCS.N    ??FTFL_IsCmdLaunched_3
        LDR.N    R1,??DataTable3_1  ;; 0x40020000
        LDRB     R1,[R1, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+7
        CMP      R1,#+0
        BEQ.N    ??FTFL_IsCmdLaunched_2
//   35   
//   36   // ´íÎó´¦Àí
//   37   if (nWaitCnt > 100000)
??FTFL_IsCmdLaunched_3:
        LDR.N    R1,??DataTable3_2  ;; 0x186a1
        CMP      R0,R1
        BCC.N    ??FTFL_IsCmdLaunched_4
//   38   {
//   39     // Èô³¬Ê±£¬Ôò·µ»Ø´íÎó
//   40     return FTFL_CODE_ERR;
        MOVS     R0,#+240
        B.N      ??FTFL_IsCmdLaunched_5
//   41   }
//   42   
//   43   if (FTFL_IsAccessErr () || FTFL_IsProtectionViolated ())
??FTFL_IsCmdLaunched_4:
        LDR.N    R0,??DataTable3_1  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R0,R0,#+26
        BMI.N    ??FTFL_IsCmdLaunched_6
        LDR.N    R0,??DataTable3_1  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R0,R0,#+27
        BPL.N    ??FTFL_IsCmdLaunched_7
//   44   {
//   45     // Èç¹û·¢Éú·ÃÎÊÔ½È¨»ò±£»¤ÇøÎó·ÃÎÊ£¬·µ»Ø´íÎó
//   46     return FTFL_CODE_ERR;
??FTFL_IsCmdLaunched_6:
        MOVS     R0,#+240
        B.N      ??FTFL_IsCmdLaunched_5
//   47   }
//   48   // ²Ù×÷ÕýÈ·Íê³É£¬·µ»ØÌáÊ¾Âë
//   49   return FTFL_CODE_SUCCESS;
??FTFL_IsCmdLaunched_7:
        MOVS     R0,#+241
??FTFL_IsCmdLaunched_5:
        BX       LR               ;; return
//   50 }
//   51 /*******************************************************************************
//   52 * º¯ÊýÃû³Æ£ºFTFL_EraseSector
//   53 * Èë¿Ú²ÎÊý£ºuint16_t iSectorNo £ºÉÈÇøºÅ
//   54 * ·µ»Ø²ÎÊý£ºFTFL_CODE_ERR£º²Ù×÷Ê§°Ü£»FTFL_CODE_SUCCESS£º²Ù×÷³É¹¦
//   55 * Ãè    Êö£º²Á³ý³ÌÐòflashÉÈÇø
//   56 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   57 uint8_t FTFL_EraseSector (uint16_t iSectorNo)
//   58 {
FTFL_EraseSector:
        PUSH     {R7,LR}
//   59   union{
//   60     uint32_t addrs_word;
//   61     uint8_t addrs_byte[4];
//   62   }union_addrs; // ÁªºÏÌå£¬ÓÃÓÚµØÖ·¼ÆËã
//   63   
//   64   // Èë²ÎºÏ·¨ÐÔ¼ìÑé
//   65   if (iSectorNo < 2)
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+2
        BCS.N    ??FTFL_EraseSector_0
//   66   {
//   67     /* flashµÄ0ºÅsectorÎªÖÐ¶ÏÏòÁ¿ÒÔ¼°Òýµ¼µÄ´æ´¢Î»ÖÃ£¬²»¿É¸²¸Ç
//   68     £¬ÎªÈ·±£°²È«£¬´ÓµÚÈýÇø¿ªÊ¼Ð´£»K10DN512ÓÐ512K flash£¬Ã¿Çø2K
//   69     £¬¹²ÓÐ256¸öÇø                                             */
//   70     return FTFL_CODE_ERR;
        MOVS     R0,#+240
        B.N      ??FTFL_EraseSector_1
//   71   }
//   72   
//   73   // ¼ÆËãÇøÆ«ÒÆµØÖ·
//   74   union_addrs.addrs_word = (((uint32_t)iSectorNo) << 11);
??FTFL_EraseSector_0:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSLS     R0,R0,#+11
        STR      R0,[SP, #+0]
//   75   
//   76   // ×°ÔØÖ¸Áî
//   77   FTFL_FCCOB0 = FTFL_CMD_EFS;  // ²Á³ýÉÈÇøÖ¸Áî
        LDR.N    R0,??DataTable3_3  ;; 0x40020007
        MOVS     R1,#+9
        STRB     R1,[R0, #+0]
//   78   FTFL_FCCOB1 = union_addrs.addrs_byte[2]; // ÉÈÇøµØÖ·
        LDRB     R0,[SP, #+2]
        LDR.N    R1,??DataTable3_4  ;; 0x40020006
        STRB     R0,[R1, #+0]
//   79   FTFL_FCCOB2 = union_addrs.addrs_byte[1];
        LDRB     R0,[SP, #+1]
        LDR.N    R1,??DataTable3_5  ;; 0x40020005
        STRB     R0,[R1, #+0]
//   80   FTFL_FCCOB3 = union_addrs.addrs_byte[0];
        LDR.N    R0,??DataTable3_6  ;; 0x40020004
        LDRB     R1,[SP, #+0]
        STRB     R1,[R0, #+0]
//   81   
//   82   if (FTFL_CODE_ERR == FTFL_IsCmdLaunched ())
        BL       FTFL_IsCmdLaunched
        CMP      R0,#+240
        BNE.N    ??FTFL_EraseSector_2
//   83   {
//   84     // ÈôÖ¸ÁîÖ´ÐÐÊ§°Ü£¬·µ»Ø´íÎóÂë
//   85     return FTFL_CODE_ERR;
        MOVS     R0,#+240
        B.N      ??FTFL_EraseSector_1
//   86   }
//   87   // ²Ù×÷³É¹¦£¬·µ»ØÌáÊ¾Âë
//   88   return FTFL_CODE_SUCCESS;
??FTFL_EraseSector_2:
        MOVS     R0,#+241
??FTFL_EraseSector_1:
        POP      {R1,PC}          ;; return
//   89 }
//   90 /*******************************************************************************
//   91 * º¯ÊýÃû³Æ£ºFTFL_WriteLongWord
//   92 * Èë¿Ú²ÎÊý£ºuint16_t iSectorNo £ºÉÈÇøºÅ£»
//   93             uint16_t iOffset£ºÆ«ÒÆµØÖ·£»
//   94             uint8_t iByte[4]£ºÐ´ÈëµÄËÄ×Ö½Ú
//   95 * ·µ»Ø²ÎÊý£ºFTFL_CODE_ERR£º²Ù×÷Ê§°Ü£»FTFL_CODE_SUCCESS£º²Ù×÷³É¹¦
//   96 * Ãè    Êö£ºÐ´Èë³ÌÐòflashËÄ¸ö×Ö½Ú
//   97 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   98 uint8_t FTFL_WriteLongWord (uint16_t iSectorNo, uint16_t iOffset, uint8_t iByte[4])
//   99 {
FTFL_WriteLongWord:
        PUSH     {R7,LR}
//  100   union{
//  101     uint32_t addrs_word;
//  102     uint8_t addrs_byte[4];
//  103   }union_addrs; // ÁªºÏÌå£¬ÓÃÓÚµØÖ·¼ÆËã
//  104   
//  105   // Èë²ÎºÏ·¨ÐÔ¼ìÑé
//  106   if (iSectorNo < 2)
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+2
        BCS.N    ??FTFL_WriteLongWord_0
//  107   {
//  108     /* flashµÄ0ºÅsectorÎªÖÐ¶ÏÏòÁ¿ÒÔ¼°Òýµ¼µÄ´æ´¢Î»ÖÃ£¬²»¿É¸²¸Ç
//  109     £¬ÎªÈ·±£°²È«£¬´ÓµÚÈýÇø¿ªÊ¼Ð´£»K10DN512ÓÐ512K flash£¬Ã¿Çø2K
//  110     £¬¹²ÓÐ256¸öÇø                                             */
//  111     return FTFL_CODE_ERR;
        MOVS     R0,#+240
        B.N      ??FTFL_WriteLongWord_1
//  112   }
//  113   
//  114   // ¼ÆËãÇøÆ«ÒÆµØÖ·
//  115   union_addrs.addrs_word = (((uint32_t)iSectorNo) << 11) + iOffset;
??FTFL_WriteLongWord_0:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSLS     R0,R0,#+11
        UXTAH    R0,R0,R1
        STR      R0,[SP, #+0]
//  116   
//  117   // ×°ÔØÖ¸Áî
//  118   FTFL_FCCOB0 = FTFL_CMD_PGM4;  // ²Á³ýÉÈÇøÖ¸Áî
        LDR.N    R0,??DataTable3_3  ;; 0x40020007
        MOVS     R1,#+6
        STRB     R1,[R0, #+0]
//  119   FTFL_FCCOB1 = union_addrs.addrs_byte[2];   // ÉÈÇøµØÖ·
        LDRB     R0,[SP, #+2]
        LDR.N    R1,??DataTable3_4  ;; 0x40020006
        STRB     R0,[R1, #+0]
//  120   FTFL_FCCOB2 = union_addrs.addrs_byte[1];
        LDRB     R0,[SP, #+1]
        LDR.N    R1,??DataTable3_5  ;; 0x40020005
        STRB     R0,[R1, #+0]
//  121   FTFL_FCCOB3 = union_addrs.addrs_byte[0];
        LDR.N    R0,??DataTable3_6  ;; 0x40020004
        LDRB     R1,[SP, #+0]
        STRB     R1,[R0, #+0]
//  122   // ×°ÔØÊý¾Ý            
//  123   FTFL_FCCOB4 = iByte[3];
        LDRB     R0,[R2, #+3]
        LDR.N    R1,??DataTable3_7  ;; 0x4002000b
        STRB     R0,[R1, #+0]
//  124   FTFL_FCCOB5 = iByte[2];
        LDRB     R0,[R2, #+2]
        LDR.N    R1,??DataTable3_8  ;; 0x4002000a
        STRB     R0,[R1, #+0]
//  125   FTFL_FCCOB6 = iByte[1];
        LDRB     R0,[R2, #+1]
        LDR.N    R1,??DataTable3_9  ;; 0x40020009
        STRB     R0,[R1, #+0]
//  126   FTFL_FCCOB7 = iByte[0];
        LDR.N    R0,??DataTable3_10  ;; 0x40020008
        LDRB     R1,[R2, #+0]
        STRB     R1,[R0, #+0]
//  127   
//  128   if (FTFL_CODE_ERR == FTFL_IsCmdLaunched ())
        BL       FTFL_IsCmdLaunched
        CMP      R0,#+240
        BNE.N    ??FTFL_WriteLongWord_2
//  129   {
//  130     // ÈôÖ¸ÁîÖ´ÐÐÊ§°Ü£¬·µ»Ø´íÎóÂë
//  131     return FTFL_CODE_ERR;
        MOVS     R0,#+240
        B.N      ??FTFL_WriteLongWord_1
//  132   }
//  133   // ²Ù×÷³É¹¦£¬·µ»ØÌáÊ¾Âë
//  134   return FTFL_CODE_SUCCESS;
??FTFL_WriteLongWord_2:
        MOVS     R0,#+241
??FTFL_WriteLongWord_1:
        POP      {R1,PC}          ;; return
//  135 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x40020000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x186a1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x40020007

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x40020006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x40020005

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     0x40020004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     0x4002000b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     0x4002000a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     0x40020009

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     0x40020008
//  136 /*******************************************************************************
//  137 * º¯ÊýÃû³Æ£ºFTFL_ReadFlash
//  138 * Èë¿Ú²ÎÊý£ºuint16_t iSectorNo £ºÉÈÇøºÅ£»uint16_t iOffset£ºÆ«ÒÆµØÖ·£»uint16_t nByteCnt£º¶Á³öÊý¾ÝµÄ¸öÊý
//  139 * ·µ»Ø²ÎÊý£ºNULL£º²Ù×÷Ê§°Ü£»uint8_t* addrsBkp£º»º´æÇøÊ×µØÖ·
//  140 * Ãè    Êö£ºÐ´Èë³ÌÐòflashËÄ¸ö×Ö½Ú
//  141 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  142 uint8_t * FTFL_ReadFlash (uint16_t iSectorNo, uint16_t iOffset, uint16_t nByteCnt)
//  143 {
FTFL_ReadFlash:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  144   uint32_t addrs = 0; // flashµØÖ·
        MOVS     R7,#+0
//  145   
//  146   uint8_t* recBuffer = (uint8_t*) malloc (nByteCnt * sizeof (uint8_t)); // ·ÖÅä½ÓÊÜ»º´æ
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,R6
        BL       malloc
        MOVS     R1,R0
//  147   uint8_t* addrsBkp = NULL; // »º´æÊ×µØÖ·±¸·Ý
        MOVS     R0,#+0
//  148   if (NULL == recBuffer)
        CMP      R1,#+0
        BNE.N    ??FTFL_ReadFlash_0
//  149   {
//  150     // Èô·ÖÅäÊ§°Ü£¬ÔòËµÃ÷ÄÚ´æ¶ÑÒÑºÄ¾¡£¬·µ»Ø´íÎó
//  151     return (uint8_t*)NULL;
        MOVS     R0,#+0
        B.N      ??FTFL_ReadFlash_1
//  152   }
//  153   addrsBkp = recBuffer; // ±£´æ»º´æµØÖ·
??FTFL_ReadFlash_0:
        MOVS     R0,R1
//  154   // ¼ÆËãÄ¿±êµØÖ·
//  155   addrs = (((uint32_t)iSectorNo) << 11) + iOffset;
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LSLS     R2,R4,#+11
        UXTAH    R7,R2,R5
        B.N      ??FTFL_ReadFlash_2
//  156   // ¶ÁÈ¡nByteCnt×Ö½ÚµØÖ·
//  157   while (nByteCnt--)
//  158   {
//  159     *recBuffer++ = *((uint8_t*)addrs++); // -1ÊÇÒòÎªÒÔaddrs¿ªÊ¼ÖÁaddrs + n - 1
??FTFL_ReadFlash_3:
        LDRB     R2,[R7, #+0]
        STRB     R2,[R1, #+0]
        ADDS     R7,R7,#+1
        ADDS     R1,R1,#+1
//  160   }
??FTFL_ReadFlash_2:
        MOVS     R2,R6
        SUBS     R6,R2,#+1
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BNE.N    ??FTFL_ReadFlash_3
//  161   // ·µ»Ø»º´æÇøµØÖ·
//  162   return addrsBkp;
??FTFL_ReadFlash_1:
        POP      {R1,R4-R7,PC}    ;; return
//  163 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  164 
// 
// 376 bytes in section .text
// 
// 376 bytes of CODE memory
//
//Errors: none
//Warnings: none
