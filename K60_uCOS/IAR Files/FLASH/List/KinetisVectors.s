///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      03/Nov/2015  20:45:51 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\KinetisDrivers /
//                    \KinetisVectors.c                                       /
//    Command line =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\KinetisDrivers /
//                    \KinetisVectors.c -D COMPILER_IAR -lCN                  /
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
//                    Files\FLASH\List\KinetisVectors.s                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME KinetisVectors

        #define SHT_PROGBITS 0x1

        EXTERN Key_ISR
        EXTERN NullFun_Kinetis
        EXTERN PTB19_ISR
        EXTERN PTC12_ISR
        EXTERN PTI0_ISR
        EXTERN StartUp_Kinetis
        EXTERN __SP_INIT

        PUBLIC __vector_table

// C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\KinetisDrivers\KinetisVectors.c
//    1 /************************************************************************************
//    2 
//    3 * KinetisVectors.c
//    4 
//    5 * ¶¨ÒåKinetisµÄÏòÁ¿±í¡£
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
//   23 #include "./KinetisVectors.h"
//   24 #include "./KinetisConfig.h"
//   25 
//   26 /* ÉùÃ÷Æô¶¯´úÂëÖ¸Õë */
//   27 extern void StartUp_Kinetis(void); 
//   28 /* ÉùÃ÷¶ÑÕ»Ö¸Õë */
//   29 extern K_int32u_t __SP_INIT[];      
//   30 
//   31 #if   defined(COMPILER_CW)    /* CWÖÐµÄ¶¨Òå·½Ê½ */ 
//   32 
//   33   #pragma define_section vectortable ".vectortable" ".vectortable" ".vectortable" far_abs R
//   34   __declspec(vectortable) const Ptr_VTOR_t VectorTable[] =
//   35     
//   36 #elif defined(COMPILER_IAR)   /* IARÖÐµÄ¶¨Òå·½Ê½ */ 
//   37     
//   38   #pragma location = ".intvec"

        SECTION `.intvec`:CONST:REORDER:NOROOT(2)
//   39   const Ptr_VTOR_t  __vector_table[] = 
__vector_table:
        DATA
        DC32 __SP_INIT, StartUp_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 PTI0_ISR, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 PTB19_ISR, PTC12_ISR, NullFun_Kinetis, Key_ISR, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis
        DC32 NullFun_Kinetis, NullFun_Kinetis, NullFun_Kinetis

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
//   41 #endif  
//   42 { /* ×Ô¶¨ÒåµÄÖÐ¶ÏÏòÁ¿±í(×¢ÒâÔÚIARÖÐÕâÀïµÄ±äÁ¿Ãû±ØÐëÊÇ__vector_table) */         
//   43   (Ptr_VTOR_t)__SP_INIT,       /* Initial SP */
//   44   (Ptr_VTOR_t)StartUp_Kinetis, /* Initial PC */
//   45   VECTOR_002,
//   46   VECTOR_003, 
//   47   VECTOR_004,
//   48   VECTOR_005,
//   49   VECTOR_006,
//   50   VECTOR_007,
//   51   VECTOR_008, 
//   52   VECTOR_009,
//   53   VECTOR_010,
//   54   VECTOR_011,
//   55   VECTOR_012,
//   56   VECTOR_013,
//   57   VECTOR_014,
//   58   VECTOR_015,
//   59   VECTOR_016,
//   60   VECTOR_017,
//   61   VECTOR_018,
//   62   VECTOR_019,
//   63   VECTOR_020,
//   64   VECTOR_021,
//   65   VECTOR_022,
//   66   VECTOR_023,
//   67   VECTOR_024,
//   68   VECTOR_025,
//   69   VECTOR_026,
//   70   VECTOR_027,
//   71   VECTOR_028,
//   72   VECTOR_029,
//   73   VECTOR_030,
//   74   VECTOR_031,
//   75   VECTOR_032,
//   76   VECTOR_033,
//   77   VECTOR_034,
//   78   VECTOR_035,
//   79   VECTOR_036,
//   80   VECTOR_037,
//   81   VECTOR_038,
//   82   VECTOR_039,
//   83   VECTOR_040,
//   84   VECTOR_041,
//   85   VECTOR_042,
//   86   VECTOR_043,
//   87   VECTOR_044,
//   88   VECTOR_045,
//   89   VECTOR_046,
//   90   VECTOR_047,
//   91   VECTOR_048,
//   92   VECTOR_049,
//   93   VECTOR_050,
//   94   VECTOR_051,
//   95   VECTOR_052,
//   96   VECTOR_053,
//   97   VECTOR_054,
//   98   VECTOR_055,
//   99   VECTOR_056,
//  100   VECTOR_057,
//  101   VECTOR_058,
//  102   VECTOR_059,
//  103   VECTOR_060,
//  104   VECTOR_061,
//  105   VECTOR_062,
//  106   VECTOR_063,
//  107   VECTOR_064,
//  108   VECTOR_065,
//  109   VECTOR_066,
//  110   VECTOR_067,
//  111   VECTOR_068,
//  112   VECTOR_069,
//  113   VECTOR_070,
//  114   VECTOR_071,
//  115   VECTOR_072,
//  116   VECTOR_073,
//  117   VECTOR_074,
//  118   VECTOR_075,
//  119   VECTOR_076,
//  120   VECTOR_077,
//  121   VECTOR_078,
//  122   VECTOR_079,
//  123   VECTOR_080,
//  124   VECTOR_081,
//  125   VECTOR_082,
//  126   VECTOR_083,
//  127   VECTOR_084,
//  128   VECTOR_085,
//  129   VECTOR_086,
//  130   VECTOR_087,
//  131   VECTOR_088,
//  132   VECTOR_089,
//  133   VECTOR_090,
//  134   VECTOR_091,
//  135   VECTOR_092,
//  136   VECTOR_093,
//  137   VECTOR_094,
//  138   VECTOR_095,
//  139   VECTOR_096,
//  140   VECTOR_097,
//  141   VECTOR_098,
//  142   VECTOR_099,
//  143   VECTOR_100,
//  144   VECTOR_101,
//  145   VECTOR_102,
//  146   VECTOR_103,
//  147   VECTOR_104,
//  148   VECTOR_105,
//  149   VECTOR_106,
//  150   VECTOR_107,
//  151   VECTOR_108,
//  152   VECTOR_109,
//  153   VECTOR_110,
//  154   VECTOR_111,
//  155   VECTOR_112,
//  156   VECTOR_113,
//  157   VECTOR_114,
//  158   VECTOR_115,
//  159   VECTOR_116,
//  160   VECTOR_117,
//  161   VECTOR_118,
//  162   VECTOR_119,
//  163 };
// 
// 480 bytes in section .intvec
// 
// 480 bytes of CONST memory
//
//Errors: none
//Warnings: none
