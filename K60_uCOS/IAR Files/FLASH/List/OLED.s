///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      03/Nov/2015  20:45:52 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\OLED\OLED.c    /
//    Command line =  C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\OLED\OLED.c    /
//                    -D COMPILER_IAR -lCN "C:\Users\WangChangan\Desktop\K10– /
//                    °∞Â∂®∏Â\IAR Files\FLASH\List\" -lB                      /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\FLASH\List\" -o "C:\Users\WangChangan\Desktop\K10 /
//                    –°∞Â∂®∏Â\IAR Files\FLASH\Obj\" --no_cse --no_unroll     /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files\IAR Systems\Embedded Workbench 6.0    /
//                    Evaluation\arm\INC\c\DLib_Config_Normal.h" -I           /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\..\Project_Headers\" -I                           /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\..\KinetisDrivers\" -I                            /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\..\ExtraFunction\" -I                             /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\..\Hardware_Interface\" -I                        /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\..\Make_Decision\" -I                             /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\..\Math\" -I "C:\Users\WangChangan\Desktop\K10–°∞ /
//                    Â∂®∏Â\IAR Files\..\Original_Process\" -I                /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\..\Platform\" -I "C:\Users\WangChangan\Desktop\K1 /
//                    0–°∞Â∂®∏Â\IAR Files\..\SD_System\" -I                   /
//                    "C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR           /
//                    Files\..\Source\" -I "C:\Users\WangChangan\Desktop\K10– /
//                    °∞Â∂®∏Â\IAR Files\..\System_Init\" -Ol                  /
//    List file    =  C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\IAR            /
//                    Files\FLASH\List\OLED.s                                 /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME OLED

        #define SHT_PROGBITS 0x1

        EXTERN free
        EXTERN gTypeAdapter
        EXTERN malloc
        EXTERN strlen

        PUBLIC ASCII_0608
        PUBLIC DataMap
        PUBLIC OLED_Clear
        PUBLIC OLED_Close
        PUBLIC OLED_Init
        PUBLIC OLED_IsLowPwr
        PUBLIC OLED_Mask
        PUBLIC OLED_Proc
        PUBLIC OLED_Refresh_Gram
        PUBLIC OLED_Refresh_SeleteGram
        PUBLIC OLED_SetLowPower
        PUBLIC OLED_SetNormalPower
        PUBLIC WriteTips
        PUBLIC ptrDisplay_GRAM
        PUBLIC stDataMap

// C:\Users\WangChangan\Desktop\K10–°∞Â∂®∏Â\OLED\OLED.c
//    1 /************************************************************************************************
//    2 
//    3 * OLED.c
//    4 
//    5 *  π”√OLEDƒ£øÈΩ¯––µ˜ ‘”≤º˛÷ß≥÷ƒ£øÈ
//    6   
//    7 * ÷˜øÿ–æ∆¨£∫MK10DN512VLL10
//    8   ø™∑¢∆ΩÃ®£∫IAR Embedded Workbench 6.3
//    9   
//   10 * ◊˜’ﬂ£∫ Õı≤˝∞≤  (µ⁄ ÆΩÏ…„œÒÕ∑)  
//   11 
//   12 ************************************************************************************************/
//   13 #include "./OLED.h"
//   14 #include "../TypeAdapter/TypeAdapter.h"
//   15 #include <stdlib.h>
//   16 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17 t_OLED_GRAM ptrDisplay_GRAM = NULL;
ptrDisplay_GRAM:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   18 INT8U OLED_Mask=0;//ƒ¨»œ≤ª∆¡±Œ“∫æß
OLED_Mask:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   19 INT8U OLED_IsLowPwr=0;//ƒ¨»œø™∆Ù“∫æßœ‘ æ
OLED_IsLowPwr:
        DS8 1

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "sdbus">`:
        DATA
        DC8 "sdbus"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MAXspeed">`:
        DATA
        DC8 "MAXspeed"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   20 void * const DataMap[PARAM_SHOW_LENGTH][3] = 
DataMap:
        DATA
        DC32 `?<Constant "sdbus">`, OLED_Mask, 0H, `?<Constant "MAXspeed">`
        DC32 OLED_Mask, 0H, `?<Constant "MAXspeed">`, OLED_Mask, 0H
        DC32 `?<Constant "MAXspeed">`, OLED_Mask, 0H, `?<Constant "MAXspeed">`
        DC32 OLED_Mask, 0H
//   21 {
//   22   {"sdbus",&OLED_Mask,(void *)Type_INT8U},
//   23   {"MAXspeed",&OLED_Mask,(void *)Type_INT8U},
//   24   {"MAXspeed",&OLED_Mask,(void *)Type_INT8U},
//   25   {"MAXspeed",&OLED_Mask,(void *)Type_INT8U},
//   26   {"MAXspeed",&OLED_Mask,(void *)Type_INT8U},
//   27 };

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
//   28 ParamSt stDataMap[PARAM_SHOW_LENGTH];
stDataMap:
        DS8 120
//   29 
//   30 //≥£”√ASCII±Ì
//   31 //∆´“∆¡ø32
//   32 //ASCII◊÷∑˚ºØ
//   33 //∆´“∆¡ø32
//   34 //¥Û–°:12*6

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   35 const unsigned char ASCII_0608[][6]={
ASCII_0608:
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 95, 0, 0, 0, 0, 7, 0, 7, 0, 0, 20, 127
        DC8 20, 127, 20, 0, 36, 42, 127, 42, 18, 0, 35, 19, 8, 100, 98, 0, 54
        DC8 73, 85, 34, 80, 0, 0, 5, 3, 0, 0, 0, 0, 28, 34, 65, 0, 0, 0, 65, 34
        DC8 28, 0, 0, 20, 8, 62, 8, 20, 0, 8, 8, 62, 8, 8, 0, 0, 80, 48, 0, 0
        DC8 0, 8, 8, 8, 8, 8, 0, 0, 96, 96, 0, 0, 0, 32, 16, 8, 4, 2, 0, 62, 81
        DC8 73, 69, 62, 0, 0, 66, 127, 64, 0, 0, 66, 97, 81, 73, 70, 0, 33, 65
        DC8 69, 75, 49, 0, 24, 20, 18, 127, 16, 0, 39, 69, 69, 69, 57, 0, 60
        DC8 74, 73, 73, 48, 0, 1, 113, 9, 5, 3, 0, 54, 73, 73, 73, 54, 0, 6, 73
        DC8 73, 41, 30, 0, 0, 54, 54, 0, 0, 0, 0, 86, 54, 0, 0, 0, 8, 20, 34
        DC8 65, 0, 0, 20, 20, 20, 20, 20, 0, 0, 65, 34, 20, 8, 0, 2, 1, 81, 9
        DC8 6, 0, 50, 73, 121, 65, 62, 0, 126, 17, 17, 17, 126, 0, 127, 73, 73
        DC8 73, 54, 0, 62, 65, 65, 65, 34, 0, 127, 65, 65, 34, 28, 0, 127, 73
        DC8 73, 73, 65, 0, 127, 9, 9, 9, 1, 0, 62, 65, 73, 73, 122, 0, 127, 8
        DC8 8, 8, 127, 0, 0, 65, 127, 65, 0, 0, 32, 64, 65, 63, 1, 0, 127, 8
        DC8 20, 34, 65, 0, 127, 64, 64, 64, 64, 0, 127, 2, 12, 2, 127, 0, 127
        DC8 4, 8, 16, 127, 0, 62, 65, 65, 65, 62, 0, 127, 9, 9, 9, 6, 0, 62, 65
        DC8 81, 33, 94, 0, 127, 9, 25, 41, 70, 0, 70, 73, 73, 73, 49, 0, 1, 1
        DC8 127, 1, 1, 0, 63, 64, 64, 64, 63, 0, 31, 32, 64, 32, 31, 0, 63, 64
        DC8 56, 64, 63, 0, 99, 20, 8, 20, 99, 0, 7, 8, 112, 8, 7, 0, 97, 81, 73
        DC8 69, 67, 0, 0, 127, 65, 65, 0, 0, 2, 4, 8, 16, 32, 0, 0, 65, 65, 127
        DC8 0, 0, 4, 2, 1, 2, 4, 0, 64, 64, 64, 64, 64, 0, 0, 1, 2, 4, 0, 0, 32
        DC8 84, 84, 84, 120, 0, 127, 72, 68, 68, 56, 0, 56, 68, 68, 68, 32, 0
        DC8 56, 68, 68, 72, 127, 0, 56, 84, 84, 84, 24, 0, 8, 126, 9, 1, 2, 0
        DC8 12, 82, 82, 82, 62, 0, 127, 8, 4, 4, 120, 0, 0, 68, 125, 64, 0, 0
        DC8 32, 64, 68, 61, 0, 0, 127, 16, 40, 68, 0, 0, 0, 65, 127, 64, 0, 0
        DC8 124, 4, 24, 4, 120, 0, 124, 8, 4, 4, 120, 0, 56, 68, 68, 68, 56, 0
        DC8 124, 20, 20, 20, 8, 0, 8, 20, 20, 24, 124, 0, 124, 8, 4, 4, 8, 0
        DC8 72, 84, 84, 84, 32, 0, 4, 63, 68, 64, 32, 0, 60, 64, 64, 32, 124, 0
        DC8 28, 32, 64, 32, 28, 0, 60, 64, 48, 64, 60, 0, 68, 40, 16, 40, 68, 0
        DC8 12, 80, 80, 80, 60, 0, 68, 100, 84, 76, 68, 0, 0, 8, 54, 65, 0, 0
        DC8 0, 0, 127, 0, 0, 0, 0, 65, 54, 8, 0, 0, 16, 8, 8, 16, 8, 0, 120, 70
        DC8 65, 70, 120
//   36    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00} // 20
//   37   ,{0x00, 0x00, 0x00, 0x5f, 0x00, 0x00} // 21 !
//   38   ,{0x00, 0x00, 0x07, 0x00, 0x07, 0x00} // 22 "
//   39   ,{0x00, 0x14, 0x7f, 0x14, 0x7f, 0x14} // 23 #
//   40   ,{0x00, 0x24, 0x2a, 0x7f, 0x2a, 0x12} // 24 $
//   41   ,{0x00, 0x23, 0x13, 0x08, 0x64, 0x62} // 25 %
//   42   ,{0x00, 0x36, 0x49, 0x55, 0x22, 0x50} // 26 &
//   43   ,{0x00, 0x00, 0x05, 0x03, 0x00, 0x00} // 27 '
//   44   ,{0x00, 0x00, 0x1c, 0x22, 0x41, 0x00} // 28 (
//   45   ,{0x00, 0x00, 0x41, 0x22, 0x1c, 0x00} // 29 )
//   46   ,{0x00, 0x14, 0x08, 0x3e, 0x08, 0x14} // 2a *
//   47   ,{0x00, 0x08, 0x08, 0x3e, 0x08, 0x08} // 2b +
//   48   ,{0x00, 0x00, 0x50, 0x30, 0x00, 0x00} // 2c ,
//   49   ,{0x00, 0x08, 0x08, 0x08, 0x08, 0x08} // 2d -
//   50   ,{0x00, 0x00, 0x60, 0x60, 0x00, 0x00} // 2e .
//   51   ,{0x00, 0x20, 0x10, 0x08, 0x04, 0x02} // 2f /
//   52   ,{0x00, 0x3e, 0x51, 0x49, 0x45, 0x3e} // 30 0
//   53   ,{0x00, 0x00, 0x42, 0x7f, 0x40, 0x00} // 31 1
//   54   ,{0x00, 0x42, 0x61, 0x51, 0x49, 0x46} // 32 2
//   55   ,{0x00, 0x21, 0x41, 0x45, 0x4b, 0x31} // 33 3
//   56   ,{0x00, 0x18, 0x14, 0x12, 0x7f, 0x10} // 34 4
//   57   ,{0x00, 0x27, 0x45, 0x45, 0x45, 0x39} // 35 5
//   58   ,{0x00, 0x3c, 0x4a, 0x49, 0x49, 0x30} // 36 6
//   59   ,{0x00, 0x01, 0x71, 0x09, 0x05, 0x03} // 37 7
//   60   ,{0x00, 0x36, 0x49, 0x49, 0x49, 0x36} // 38 8
//   61   ,{0x00, 0x06, 0x49, 0x49, 0x29, 0x1e} // 39 9
//   62   ,{0x00, 0x00, 0x36, 0x36, 0x00, 0x00} // 3a :
//   63   ,{0x00, 0x00, 0x56, 0x36, 0x00, 0x00} // 3b ;
//   64   ,{0x00, 0x08, 0x14, 0x22, 0x41, 0x00} // 3c <
//   65   ,{0x00, 0x14, 0x14, 0x14, 0x14, 0x14} // 3d =
//   66   ,{0x00, 0x00, 0x41, 0x22, 0x14, 0x08} // 3e >
//   67   ,{0x00, 0x02, 0x01, 0x51, 0x09, 0x06} // 3f ?
//   68   ,{0x00, 0x32, 0x49, 0x79, 0x41, 0x3e} // 40 @
//   69   ,{0x00, 0x7e, 0x11, 0x11, 0x11, 0x7e} // 41 A
//   70   ,{0x00, 0x7f, 0x49, 0x49, 0x49, 0x36} // 42 B
//   71   ,{0x00, 0x3e, 0x41, 0x41, 0x41, 0x22} // 43 C
//   72   ,{0x00, 0x7f, 0x41, 0x41, 0x22, 0x1c} // 44 D
//   73   ,{0x00, 0x7f, 0x49, 0x49, 0x49, 0x41} // 45 E
//   74   ,{0x00, 0x7f, 0x09, 0x09, 0x09, 0x01} // 46 F
//   75   ,{0x00, 0x3e, 0x41, 0x49, 0x49, 0x7a} // 47 G
//   76   ,{0x00, 0x7f, 0x08, 0x08, 0x08, 0x7f} // 48 H
//   77   ,{0x00, 0x00, 0x41, 0x7f, 0x41, 0x00} // 49 I
//   78   ,{0x00, 0x20, 0x40, 0x41, 0x3f, 0x01} // 4a J
//   79   ,{0x00, 0x7f, 0x08, 0x14, 0x22, 0x41} // 4b K
//   80   ,{0x00, 0x7f, 0x40, 0x40, 0x40, 0x40} // 4c L
//   81   ,{0x00, 0x7f, 0x02, 0x0c, 0x02, 0x7f} // 4d M
//   82   ,{0x00, 0x7f, 0x04, 0x08, 0x10, 0x7f} // 4e N
//   83   ,{0x00, 0x3e, 0x41, 0x41, 0x41, 0x3e} // 4f O
//   84   ,{0x00, 0x7f, 0x09, 0x09, 0x09, 0x06} // 50 P
//   85   ,{0x00, 0x3e, 0x41, 0x51, 0x21, 0x5e} // 51 Q
//   86   ,{0x00, 0x7f, 0x09, 0x19, 0x29, 0x46} // 52 R
//   87   ,{0x00, 0x46, 0x49, 0x49, 0x49, 0x31} // 53 S
//   88   ,{0x00, 0x01, 0x01, 0x7f, 0x01, 0x01} // 54 T
//   89   ,{0x00, 0x3f, 0x40, 0x40, 0x40, 0x3f} // 55 U
//   90   ,{0x00, 0x1f, 0x20, 0x40, 0x20, 0x1f} // 56 V
//   91   ,{0x00, 0x3f, 0x40, 0x38, 0x40, 0x3f} // 57 W
//   92   ,{0x00, 0x63, 0x14, 0x08, 0x14, 0x63} // 58 X
//   93   ,{0x00, 0x07, 0x08, 0x70, 0x08, 0x07} // 59 Y
//   94   ,{0x00, 0x61, 0x51, 0x49, 0x45, 0x43} // 5a Z
//   95   ,{0x00, 0x00, 0x7f, 0x41, 0x41, 0x00} // 5b [
//   96   ,{0x00, 0x02, 0x04, 0x08, 0x10, 0x20} // 5c \//
//   97   ,{0x00, 0x00, 0x41, 0x41, 0x7f, 0x00} // 5d ]
//   98   ,{0x00, 0x04, 0x02, 0x01, 0x02, 0x04} // 5e ^
//   99   ,{0x00, 0x40, 0x40, 0x40, 0x40, 0x40} // 5f _
//  100   ,{0x00, 0x00, 0x01, 0x02, 0x04, 0x00} // 60 `
//  101   ,{0x00, 0x20, 0x54, 0x54, 0x54, 0x78} // 61 a
//  102   ,{0x00, 0x7f, 0x48, 0x44, 0x44, 0x38} // 62 b
//  103   ,{0x00, 0x38, 0x44, 0x44, 0x44, 0x20} // 63 c
//  104   ,{0x00, 0x38, 0x44, 0x44, 0x48, 0x7f} // 64 d
//  105   ,{0x00, 0x38, 0x54, 0x54, 0x54, 0x18} // 65 e
//  106   ,{0x00, 0x08, 0x7e, 0x09, 0x01, 0x02} // 66 f
//  107   ,{0x00, 0x0c, 0x52, 0x52, 0x52, 0x3e} // 67 g
//  108   ,{0x00, 0x7f, 0x08, 0x04, 0x04, 0x78} // 68 h
//  109   ,{0x00, 0x00, 0x44, 0x7d, 0x40, 0x00} // 69 i
//  110   ,{0x00, 0x20, 0x40, 0x44, 0x3d, 0x00} // 6a j
//  111   ,{0x00, 0x7f, 0x10, 0x28, 0x44, 0x00} // 6b k
//  112   ,{0x00, 0x00, 0x41, 0x7f, 0x40, 0x00} // 6c l
//  113   ,{0x00, 0x7c, 0x04, 0x18, 0x04, 0x78} // 6d m
//  114   ,{0x00, 0x7c, 0x08, 0x04, 0x04, 0x78} // 6e n
//  115   ,{0x00, 0x38, 0x44, 0x44, 0x44, 0x38} // 6f o
//  116   ,{0x00, 0x7c, 0x14, 0x14, 0x14, 0x08} // 70 p
//  117   ,{0x00, 0x08, 0x14, 0x14, 0x18, 0x7c} // 71 q
//  118   ,{0x00, 0x7c, 0x08, 0x04, 0x04, 0x08} // 72 r
//  119   ,{0x00, 0x48, 0x54, 0x54, 0x54, 0x20} // 73 s
//  120   ,{0x00, 0x04, 0x3f, 0x44, 0x40, 0x20} // 74 t
//  121   ,{0x00, 0x3c, 0x40, 0x40, 0x20, 0x7c} // 75 u
//  122   ,{0x00, 0x1c, 0x20, 0x40, 0x20, 0x1c} // 76 v
//  123   ,{0x00, 0x3c, 0x40, 0x30, 0x40, 0x3c} // 77 w
//  124   ,{0x00, 0x44, 0x28, 0x10, 0x28, 0x44} // 78 x
//  125   ,{0x00, 0x0c, 0x50, 0x50, 0x50, 0x3c} // 79 y
//  126   ,{0x00, 0x44, 0x64, 0x54, 0x4c, 0x44} // 7a z
//  127   ,{0x00, 0x00, 0x08, 0x36, 0x41, 0x00} // 7b {
//  128   ,{0x00, 0x00, 0x00, 0x7f, 0x00, 0x00} // 7c |
//  129   ,{0x00, 0x00, 0x41, 0x36, 0x08, 0x00} // 7d }
//  130   ,{0x00, 0x10, 0x08, 0x08, 0x10, 0x08} // 7e ~
//  131   ,{0x00, 0x78, 0x46, 0x41, 0x46, 0x78} // 7f (delete)
//  132 };
//  133 
//  134 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  135 static void OLED_IO_Init()
//  136 { 
//  137   //Never modify this function!  
//  138   ((OLED_PORT_SCL)->PCR[OLED_INDEX_SCL]) = PORT_PCR_MUX(1);
OLED_IO_Init:
        LDR.W    R0,??DataTable13  ;; 0x4004a054
        MOV      R1,#+256
        STR      R1,[R0, #+0]
//  139   ((OLED_PORT_SDA)->PCR[OLED_INDEX_SDA]) = PORT_PCR_MUX(1);
        LDR.W    R0,??DataTable13_1  ;; 0x4004a004
        MOV      R1,#+256
        STR      R1,[R0, #+0]
//  140   ((OLED_PORT_DC)->PCR[OLED_INDEX_DC])   = PORT_PCR_MUX(1);
        LDR.W    R0,??DataTable13_2  ;; 0x4004a00c
        MOV      R1,#+256
        STR      R1,[R0, #+0]
//  141   ((OLED_PORT_RST)->PCR[OLED_INDEX_RST]) = PORT_PCR_MUX(1);
        LDR.W    R0,??DataTable13_3  ;; 0x4004a028
        MOV      R1,#+256
        STR      R1,[R0, #+0]
//  142     
//  143   OLED_PT_SCL->PDDR |= (1<<OLED_INDEX_SCL);
        LDR.W    R0,??DataTable13_4  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200000
        LDR.W    R1,??DataTable13_4  ;; 0x400ff054
        STR      R0,[R1, #+0]
//  144   OLED_PT_SDA->PDDR |= (1<<OLED_INDEX_SDA);
        LDR.W    R0,??DataTable13_4  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.W    R1,??DataTable13_4  ;; 0x400ff054
        STR      R0,[R1, #+0]
//  145   OLED_PT_DC->PDDR  |= (1<<OLED_INDEX_DC);
        LDR.W    R0,??DataTable13_4  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable13_4  ;; 0x400ff054
        STR      R0,[R1, #+0]
//  146   OLED_PT_RST->PDDR |= (1<<OLED_INDEX_RST);
        LDR.W    R0,??DataTable13_4  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R1,??DataTable13_4  ;; 0x400ff054
        STR      R0,[R1, #+0]
//  147 }
        BX       LR               ;; return
//  148 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  149 static void OLED_ReqGram(void)
//  150 {
OLED_ReqGram:
        PUSH     {R7,LR}
//  151   ptrDisplay_GRAM = (t_OLED_GRAM) malloc (8 * sizeof(t_OLED_GRAM));
        MOVS     R0,#+32
        BL       malloc
        LDR.W    R1,??DataTable13_5
        STR      R0,[R1, #+0]
//  152 }
        POP      {R0,PC}          ;; return
//  153 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  154 static void OLED_FreeRam()
//  155 {
OLED_FreeRam:
        PUSH     {R4,LR}
//  156   if(NULL != ptrDisplay_GRAM){ free(ptrDisplay_GRAM); }
        LDR.W    R0,??DataTable13_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??OLED_FreeRam_0
        LDR.W    R0,??DataTable13_5
        LDR      R0,[R0, #+0]
        BL       free
//  157   ptrDisplay_GRAM = NULL;
??OLED_FreeRam_0:
        LDR.W    R0,??DataTable13_5
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  158   for(INT8U index = 0;index < PARAM_SHOW_LENGTH;++index)
        MOVS     R4,#+0
        B.N      ??OLED_FreeRam_1
//  159   {
//  160     if(NULL != stDataMap[index].lpstr)
??OLED_FreeRam_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+24
        LDR.W    R1,??DataTable13_6
        MLA      R0,R0,R4,R1
        LDR      R0,[R0, #+8]
        CMP      R0,#+0
        BEQ.N    ??OLED_FreeRam_3
//  161       free(stDataMap[index].lpstr);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+24
        LDR.W    R1,??DataTable13_6
        MLA      R0,R0,R4,R1
        LDR      R0,[R0, #+8]
        BL       free
//  162     stDataMap[index].lpstr = NULL;
??OLED_FreeRam_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+24
        LDR.W    R1,??DataTable13_6
        MLA      R0,R0,R4,R1
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
//  163   }
        ADDS     R4,R4,#+1
??OLED_FreeRam_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+5
        BCC.N    ??OLED_FreeRam_2
//  164 }
        POP      {R4,PC}          ;; return
//  165 /*****************************************************************************
//  166  ∫Ø  ˝ √˚  : OLED_Write_Byte
//  167  π¶ƒ‹√Ë ˆ  : œÚOLED–¥ ˝æ›ªÚ’ﬂ√¸¡Ó
//  168   ‰»Î≤Œ ˝  : Dat¥˝–¥»Î£¨Opt ˝æ›√¸¡Ó—°‘Ò£®0√¸¡Ó£¨1 ˝æ›£© 
//  169   ‰≥ˆ≤Œ ˝  : NONE
//  170  ∑µ ªÿ ÷µ  : NONE
//  171 *****************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  172 static void OLED_Write_Byte(INT8U Dat,INT8U Opt)
//  173 {
//  174     INT8U index=8;
OLED_Write_Byte:
        MOVS     R2,#+8
//  175     
//  176     if(Opt) OLED_DCH;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??OLED_Write_Byte_0
        LDR.W    R1,??DataTable13_7  ;; 0x400ff044
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x8
        LDR.W    R3,??DataTable13_7  ;; 0x400ff044
        STR      R1,[R3, #+0]
        B.N      ??OLED_Write_Byte_1
//  177     else OLED_DCL;  
??OLED_Write_Byte_0:
        LDR.W    R1,??DataTable13_8  ;; 0x400ff048
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x8
        LDR.W    R3,??DataTable13_8  ;; 0x400ff048
        STR      R1,[R3, #+0]
//  178     OLED_SCLL;
??OLED_Write_Byte_1:
        LDR.W    R1,??DataTable13_8  ;; 0x400ff048
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x200000
        LDR.W    R3,??DataTable13_8  ;; 0x400ff048
        STR      R1,[R3, #+0]
        B.N      ??OLED_Write_Byte_2
//  179     
//  180     while (index--)
//  181     {
//  182         if(Dat&0x80){ OLED_SDAH; }
//  183         else{ OLED_SDAL; }
??OLED_Write_Byte_3:
        LDR.W    R1,??DataTable13_8  ;; 0x400ff048
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x2
        LDR.W    R3,??DataTable13_8  ;; 0x400ff048
        STR      R1,[R3, #+0]
//  184         OLED_SCLH;
??OLED_Write_Byte_4:
        LDR.W    R1,??DataTable13_7  ;; 0x400ff044
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x200000
        LDR.W    R3,??DataTable13_7  ;; 0x400ff044
        STR      R1,[R3, #+0]
//  185         asm("nop");
        nop              
//  186         OLED_SCLL;    
        LDR.W    R1,??DataTable13_8  ;; 0x400ff048
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x200000
        LDR.W    R3,??DataTable13_8  ;; 0x400ff048
        STR      R1,[R3, #+0]
//  187         Dat <<= 1;    
        LSLS     R0,R0,#+1
??OLED_Write_Byte_2:
        MOVS     R1,R2
        SUBS     R2,R1,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??OLED_Write_Byte_5
        LSLS     R1,R0,#+24
        BPL.N    ??OLED_Write_Byte_3
        LDR.W    R1,??DataTable13_7  ;; 0x400ff044
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x2
        LDR.W    R3,??DataTable13_7  ;; 0x400ff044
        STR      R1,[R3, #+0]
        B.N      ??OLED_Write_Byte_4
//  188     }
//  189 }
??OLED_Write_Byte_5:
        BX       LR               ;; return
//  190 
//  191 //∏¸–¬œ‘¥ÊµΩLCD		 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  192 void OLED_Refresh_Gram(void)
//  193 {
OLED_Refresh_Gram:
        PUSH     {R3-R5,LR}
//  194     INT8U i,n;		    
//  195     for(i=0;i<8;i++)  
        MOVS     R4,#+0
        B.N      ??OLED_Refresh_Gram_0
//  196     {  
//  197         OLED_Write_Byte(0xB0+i,OLED_CMD);    //…Ë÷√“≥µÿ÷∑£®0~7£©
//  198         OLED_Write_Byte(0x00,OLED_CMD);      //…Ë÷√œ‘ æŒª÷√-¡–µÕµÿ÷∑
//  199         OLED_Write_Byte(0x10,OLED_CMD);      //…Ë÷√œ‘ æŒª÷√-¡–∏ﬂµÿ÷∑   
//  200         for(n=0;n<132;n++)
//  201           OLED_Write_Byte(ptrDisplay_GRAM[n][i],OLED_DATA);
??OLED_Refresh_Gram_1:
        MOVS     R1,#+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+132
        LDR.W    R2,??DataTable13_5
        LDR      R2,[R2, #+0]
        MLA      R0,R0,R5,R2
        LDRB     R0,[R4, R0]
        BL       OLED_Write_Byte
        ADDS     R5,R5,#+1
??OLED_Refresh_Gram_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+132
        BCC.N    ??OLED_Refresh_Gram_1
        ADDS     R4,R4,#+1
??OLED_Refresh_Gram_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BCS.N    ??OLED_Refresh_Gram_3
        MOVS     R1,#+0
        SUBS     R0,R4,#+80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_Write_Byte
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       OLED_Write_Byte
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       OLED_Write_Byte
        MOVS     R5,#+0
        B.N      ??OLED_Refresh_Gram_2
//  202     }   
//  203 }
??OLED_Refresh_Gram_3:
        POP      {R0,R4,R5,PC}    ;; return
//  204 //∏¸–¬ƒ≥“ª––œ‘¥ÊµΩLCD		 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  205 void OLED_Refresh_SeleteGram(INT8U id)
//  206 {
OLED_Refresh_SeleteGram:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  207   OLED_Write_Byte(0xB0+id,OLED_CMD);    //…Ë÷√“≥µÿ÷∑£®0~7£©
        MOVS     R1,#+0
        SUBS     R0,R4,#+80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_Write_Byte
//  208   OLED_Write_Byte(0x00,OLED_CMD);      //…Ë÷√œ‘ æŒª÷√-¡–µÕµÿ÷∑
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       OLED_Write_Byte
//  209   OLED_Write_Byte(0x10,OLED_CMD);      //…Ë÷√œ‘ æŒª÷√-¡–∏ﬂµÿ÷∑   
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       OLED_Write_Byte
//  210   for(INT8U n=0;n<132;n++)
        MOVS     R5,#+0
        B.N      ??OLED_Refresh_SeleteGram_0
//  211     OLED_Write_Byte(ptrDisplay_GRAM[n][id],OLED_DATA); 
??OLED_Refresh_SeleteGram_1:
        MOVS     R1,#+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+132
        LDR.W    R2,??DataTable13_5
        LDR      R2,[R2, #+0]
        MLA      R0,R0,R5,R2
        LDRB     R0,[R4, R0]
        BL       OLED_Write_Byte
        ADDS     R5,R5,#+1
??OLED_Refresh_SeleteGram_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+132
        BCC.N    ??OLED_Refresh_SeleteGram_1
//  212 }
        POP      {R0,R4,R5,PC}    ;; return
//  213 /*****************************************************************************
//  214  ∫Ø  ˝ √˚  : OLED_SetPos
//  215  π¶ƒ‹√Ë ˆ  : …Ë÷√œ‘ æ◊¯±Í
//  216   ‰»Î≤Œ ˝  : INT8U X  
//  217              INT8U Y  
//  218   ‰≥ˆ≤Œ ˝  : NONE
//  219  ∑µ ªÿ ÷µ  : NONE
//  220 *****************************************************************************/
//  221 //0xb0+0~7±Ì æ“≥0~7
//  222 //0x00+0~16±Ì æΩ´128¡–∑÷≥…16◊È∆‰µÿ÷∑‘⁄ƒ≥◊È÷–µƒµ⁄º∏¡–
//  223 //0x10+0~16±Ì æΩ´128¡–∑÷≥…16◊È∆‰µÿ÷∑À˘‘⁄µ⁄º∏◊È
//  224 static void OLED_SetPos(INT8U X, INT8U Y)
//  225 { 
//  226     OLED_Write_Byte(0xB0+Y,OLED_CMD);
//  227     OLED_Write_Byte(((X&0xF0)>>4)|0x10,OLED_CMD);
//  228     OLED_Write_Byte((X&0x0F)|0x00,OLED_CMD); 
//  229 } 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  230 static void OLED_RST(void)
//  231 {
//  232     OLED_SCLH;      
OLED_RST:
        LDR.W    R0,??DataTable13_7  ;; 0x400ff044
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200000
        LDR.W    R1,??DataTable13_7  ;; 0x400ff044
        STR      R0,[R1, #+0]
//  233     OLED_RSTL;
        LDR.W    R0,??DataTable13_8  ;; 0x400ff048
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R1,??DataTable13_8  ;; 0x400ff048
        STR      R0,[R1, #+0]
//  234     //¥”…œµÁµΩœ¬√Êø™ º≥ı ºªØ“™”–◊„πªµƒ ±º‰£¨º¥µ»¥˝IC∏¥ŒªÕÍ±œ      
//  235     for(INT16U i=0;i<1000;++i){ asm("nop"); } 
        MOVS     R0,#+0
        B.N      ??OLED_RST_0
??OLED_RST_1:
        nop              
        ADDS     R0,R0,#+1
??OLED_RST_0:
        MOV      R1,#+1000
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BCC.N    ??OLED_RST_1
//  236     OLED_RSTH;
        LDR.W    R0,??DataTable13_7  ;; 0x400ff044
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R1,??DataTable13_7  ;; 0x400ff044
        STR      R0,[R1, #+0]
//  237 }
        BX       LR               ;; return
//  238 
//  239 /*****************************************************************************
//  240  ∫Ø  ˝ √˚  : OLED_ChipInit
//  241  π¶ƒ‹√Ë ˆ  : OLED≥ı ºªØ
//  242   ‰»Î≤Œ ˝  : void  
//  243   ‰≥ˆ≤Œ ˝  : NONE
//  244  ∑µ ªÿ ÷µ  : NONE
//  245 *****************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  246 static void OLED_ChipInit(void)        
//  247 {
OLED_ChipInit:
        PUSH     {R7,LR}
//  248     OLED_Write_Byte(0xAE,OLED_CMD); //πÿ±’œ‘ æ
        MOVS     R1,#+0
        MOVS     R0,#+174
        BL       OLED_Write_Byte
//  249     OLED_Write_Byte(0xD5,OLED_CMD); //…Ë÷√ ±÷”∑÷∆µ“Ú◊”,’µ¥∆µ¬ 
        MOVS     R1,#+0
        MOVS     R0,#+213
        BL       OLED_Write_Byte
//  250     OLED_Write_Byte(0x80,OLED_CMD); //[3:0],∑÷∆µ“Ú◊”;[7:4],’µ¥∆µ¬ 
        MOVS     R1,#+0
        MOVS     R0,#+128
        BL       OLED_Write_Byte
//  251     OLED_Write_Byte(0xA8,OLED_CMD); //…Ë÷√«˝∂Ø¬∑ ˝
        MOVS     R1,#+0
        MOVS     R0,#+168
        BL       OLED_Write_Byte
//  252     OLED_Write_Byte(0x3F,OLED_CMD); //ƒ¨»œ0x3F(1-64)63
        MOVS     R1,#+0
        MOVS     R0,#+63
        BL       OLED_Write_Byte
//  253     OLED_Write_Byte(0xD3,OLED_CMD); //…Ë÷√œ‘ æ∆´“∆(º¥‘⁄…Ë∂®µƒª˘¥°…œ◊‘∂Øº”…œ“ª∂®µƒ∆´“∆¡ø,◊®÷∏––µÿ÷∑µƒ∆´“∆£¨∂‘¡–µÿ÷∑Œﬁ”∞œÏ)
        MOVS     R1,#+0
        MOVS     R0,#+211
        BL       OLED_Write_Byte
//  254     OLED_Write_Byte(0x00,OLED_CMD); //ƒ¨»œŒ™0
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       OLED_Write_Byte
//  255     OLED_Write_Byte(0x40,OLED_CMD); //…Ë÷√œ‘ æø™ º––[5:0],–– ˝.
        MOVS     R1,#+0
        MOVS     R0,#+64
        BL       OLED_Write_Byte
//  256     OLED_Write_Byte(0x8D,OLED_CMD); //µÁ∫…±√…Ë÷√
        MOVS     R1,#+0
        MOVS     R0,#+141
        BL       OLED_Write_Byte
//  257     OLED_Write_Byte(0x14,OLED_CMD); //bit2,ø™∆Ù/πÿ±’ 
        MOVS     R1,#+0
        MOVS     R0,#+20
        BL       OLED_Write_Byte
//  258     OLED_Write_Byte(0x20,OLED_CMD); //…Ë÷√ƒ⁄¥Êµÿ÷∑ƒ£ Ω
        MOVS     R1,#+0
        MOVS     R0,#+32
        BL       OLED_Write_Byte
//  259     OLED_Write_Byte(0x02,OLED_CMD); //[1:0],00,¡–µÿ÷∑ƒ£ Ω;01,––µÿ÷∑ƒ£ Ω;10,“≥µÿ÷∑ƒ£ Ω;ƒ¨»œ10; 
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       OLED_Write_Byte
//  260     OLED_Write_Byte(0xA0,OLED_CMD); //∂Œ÷ÿ∂®“Â…Ë÷√bit0:0,0->0;1,0->127;
        MOVS     R1,#+0
        MOVS     R0,#+160
        BL       OLED_Write_Byte
//  261     //A1¡–…®√ËÀ≥–Úæ˘Œ™◊‘◊ÛœÚ”“£¨A0¡–…®√ËÀ≥–Úæ˘Œ™◊‘”“œÚ◊Û	
//  262     //COM…®√Ë∑ΩœÚ£∫0xC0:COM0-COM63 ; 0xC8:COM63-COM0
//  263     OLED_Write_Byte(0xC0,OLED_CMD);// …Ë÷√COM…®√Ë∑ΩœÚ;bit3:0,∆’Õ®ƒ£ Ω;1,÷ÿ∂®“Âƒ£ Ω COM[N-1]->COM0;N:«˝∂Ø¬∑ ˝
        MOVS     R1,#+0
        MOVS     R0,#+192
        BL       OLED_Write_Byte
//  264     OLED_Write_Byte(0xDA,OLED_CMD);//…Ë÷√COM”≤º˛“˝Ω≈≈‰÷√
        MOVS     R1,#+0
        MOVS     R0,#+218
        BL       OLED_Write_Byte
//  265     OLED_Write_Byte(0x12,OLED_CMD); //[5:4]≈‰÷√
        MOVS     R1,#+0
        MOVS     R0,#+18
        BL       OLED_Write_Byte
//  266     //µ⁄4Œª0æˆ∂® «¡¨–¯…®√ËCOM∂À(0,1...32...63)ªπ «1ΩªÃÊ…®√ËCOM∂À(0,32,1,33....31,63)
//  267     //◊¢“‚ µº  ‰≥ˆÀ≥–ÚŒ™0£¨32£¨1£¨33.....31£¨63£¨“Ú¥À¡¨–¯…®√Ë∂‘”¶ΩªÃÊœ‘ æ£¨ΩªÃÊ…®√Ë∂‘”¶¡¨–¯œ‘ æ
//  268     //µ⁄ŒÂŒªæˆ∂® «∑Ò∂‘COM0-COM31”ÎCOM32-COM63Ω¯––÷ÿ”≥…‰£¨1Œ™‘ –Ì£¨0Œ™Ω˚÷π
//  269 
//  270     OLED_Write_Byte(0x81,OLED_CMD); //∂‘±»∂»…Ë÷√
        MOVS     R1,#+0
        MOVS     R0,#+129
        BL       OLED_Write_Byte
//  271     OLED_Write_Byte(0xEF,OLED_CMD); //1~255,ƒ¨»œ0X7F(¡¡∂»…Ë÷√£¨‘Ω¥Û‘Ω¡¡)
        MOVS     R1,#+0
        MOVS     R0,#+239
        BL       OLED_Write_Byte
//  272     OLED_Write_Byte(0xD9,OLED_CMD); //…Ë÷√‘§≥‰µÁ÷‹∆⁄
        MOVS     R1,#+0
        MOVS     R0,#+217
        BL       OLED_Write_Byte
//  273     OLED_Write_Byte(0xF1,OLED_CMD); //[3:0],PHASE 1;[7:4],PHASE 2;
        MOVS     R1,#+0
        MOVS     R0,#+241
        BL       OLED_Write_Byte
//  274     OLED_Write_Byte(0xDB,OLED_CMD); //…Ë÷√VCOMHµÁ—π±∂¬ 
        MOVS     R1,#+0
        MOVS     R0,#+219
        BL       OLED_Write_Byte
//  275     OLED_Write_Byte(0x30,OLED_CMD); //[6:4] 000,0.65*vcc;001,0.77*vcc;011,0.83*vcc;
        MOVS     R1,#+0
        MOVS     R0,#+48
        BL       OLED_Write_Byte
//  276     OLED_Write_Byte(0xA4,OLED_CMD); //»´æ÷œ‘ æø™∆Ùbit0:1,ø™∆Ù;0,πÿ±’;(∞◊∆¡/∫⁄∆¡ )
        MOVS     R1,#+0
        MOVS     R0,#+164
        BL       OLED_Write_Byte
//  277     OLED_Write_Byte(0xA6,OLED_CMD); //…Ë÷√œ‘ æ∑Ω Ω;bit0:1,∑¥œ‡œ‘ æ;0,’˝≥£œ‘ æ
        MOVS     R1,#+0
        MOVS     R0,#+166
        BL       OLED_Write_Byte
//  278     OLED_Write_Byte(0xAF,OLED_CMD); //ø™∆Ùœ‘ æ	
        MOVS     R1,#+0
        MOVS     R0,#+175
        BL       OLED_Write_Byte
//  279 } 
        POP      {R0,PC}          ;; return
//  280 
//  281 //ø™∆ÙOLEDœ‘ æ    

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  282 static void OLED_Display_On(void)
//  283 {
OLED_Display_On:
        PUSH     {R7,LR}
//  284       OLED_Write_Byte(0x8D,OLED_CMD);  //…Ë÷√µÁ∫…±√√¸¡Ó
        MOVS     R1,#+0
        MOVS     R0,#+141
        BL       OLED_Write_Byte
//  285       OLED_Write_Byte(0x14,OLED_CMD);  //ø™µÁ∫…±√
        MOVS     R1,#+0
        MOVS     R0,#+20
        BL       OLED_Write_Byte
//  286       OLED_Write_Byte(0xAF,OLED_CMD);  //ø™œ‘ æ
        MOVS     R1,#+0
        MOVS     R0,#+175
        BL       OLED_Write_Byte
//  287 }
        POP      {R0,PC}          ;; return
//  288 //πÿ±’OLEDœ‘ æ     

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  289 static void OLED_Display_Off(void)
//  290 {
OLED_Display_Off:
        PUSH     {R7,LR}
//  291       OLED_Write_Byte(0x8D,OLED_CMD);  //…Ë÷√µÁ∫…±√√¸¡Ó
        MOVS     R1,#+0
        MOVS     R0,#+141
        BL       OLED_Write_Byte
//  292       OLED_Write_Byte(0x10,OLED_CMD);  //πÿµÁ∫…±√
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       OLED_Write_Byte
//  293       OLED_Write_Byte(0xAE,OLED_CMD);  //πÿœ‘ æ
        MOVS     R1,#+0
        MOVS     R0,#+174
        BL       OLED_Write_Byte
//  294 }	
        POP      {R0,PC}          ;; return
//  295 	   			 
//  296 //«Â∆¡∫Ø ˝,«ÂÕÍ∆¡,’˚∏ˆ∆¡ƒª «∫⁄…´µƒ£¨∫Õ√ªµ„¡¡“ª—˘	  

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  297 void OLED_Clear(void)  
//  298 {  
//  299   INT8U i,n;  
//  300   for(i=0;i<8;++i)
OLED_Clear:
        MOVS     R0,#+0
        B.N      ??OLED_Clear_0
//  301   {
//  302     for(n=0;n<132;++n)
//  303     {
//  304       ptrDisplay_GRAM[n][i]=0x00;
??OLED_Clear_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+132
        LDR.N    R3,??DataTable13_5
        LDR      R3,[R3, #+0]
        MLA      R2,R2,R1,R3
        MOVS     R3,#+0
        STRB     R3,[R0, R2]
//  305     }
        ADDS     R1,R1,#+1
??OLED_Clear_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+132
        BCC.N    ??OLED_Clear_1
        ADDS     R0,R0,#+1
??OLED_Clear_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+8
        BCS.N    ??OLED_Clear_3
        MOVS     R1,#+0
        B.N      ??OLED_Clear_2
//  306   }
//  307 }
??OLED_Clear_3:
        BX       LR               ;; return
//  308 
//  309 //‘⁄÷∏∂®Œª÷√œ‘ æ“ª∏ˆ◊÷∑˚,∞¸¿®≤ø∑÷◊÷∑˚
//  310 //x:0~127
//  311 //y:0~63
//  312 //mode:0,∑¥∞◊œ‘ æ;1,’˝≥£œ‘ æ				 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  313 static void OLED_Write_Char(INT8U x,INT8U y,INT8U chr,INT8U mode)
//  314 {      			      			    
OLED_Write_Char:
        PUSH     {R4-R7}
//  315     INT8U t;
//  316     chr=chr-' ';//µ√µΩ∆´“∆∫Ûµƒ÷µ			   
        SUBS     R2,R2,#+32
//  317     for(t=0;t<6;t++)//∞¥–––¥»Î£¨“ªπ≤–¥size––
        MOVS     R4,#+0
        B.N      ??OLED_Write_Char_0
//  318     {   
//  319         if(mode) 
//  320         {
//  321             ptrDisplay_GRAM[x+t][y/8]=ASCII_0608[chr][t];  //µ˜”√0608◊÷ÃÂ
//  322         }
//  323         else //∑¥∞◊œ‘ æ
//  324         {
//  325             ptrDisplay_GRAM[x+t][y/8]=~ASCII_0608[chr][t];  //µ˜”√0608◊÷ÃÂ
??OLED_Write_Char_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R5,#+8
        SDIV     R5,R1,R5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTAB    R6,R4,R0
        MOVS     R7,#+132
        LDR.W    R12,??DataTable13_5
        LDR      R12,[R12, #+0]
        MLA      R6,R7,R6,R12
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R7,#+6
        LDR.W    R12,??DataTable13_9
        MLA      R7,R7,R2,R12
        LDRB     R7,[R4, R7]
        MVNS     R7,R7
        STRB     R7,[R5, R6]
//  326         }	
??OLED_Write_Char_2:
        ADDS     R4,R4,#+1
??OLED_Write_Char_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+6
        BCS.N    ??OLED_Write_Char_3
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BEQ.N    ??OLED_Write_Char_1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R5,#+8
        SDIV     R5,R1,R5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTAB    R6,R4,R0
        MOVS     R7,#+132
        LDR.W    R12,??DataTable13_5
        LDR      R12,[R12, #+0]
        MLA      R6,R7,R6,R12
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R7,#+6
        LDR.W    R12,??DataTable13_9
        MLA      R7,R7,R2,R12
        LDRB     R7,[R4, R7]
        STRB     R7,[R5, R6]
        B.N      ??OLED_Write_Char_2
//  327     }  
//  328 }
??OLED_Write_Char_3:
        POP      {R4-R7}
        BX       LR               ;; return
//  329 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  330 INT8U OLED_SetLowPower(void)
//  331 {
OLED_SetLowPower:
        PUSH     {R7,LR}
//  332   if(0 == OLED_IsLowPwr)
        LDR.N    R0,??DataTable13_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??OLED_SetLowPower_0
//  333   {
//  334     OLED_Display_Off();
        BL       OLED_Display_Off
//  335     OLED_IsLowPwr = 1;
        LDR.N    R0,??DataTable13_10
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  336     return KOS_OK;
        MOVS     R0,#+0
        B.N      ??OLED_SetLowPower_1
//  337   }
//  338   else
//  339   {
//  340     return KOS_ERR;
??OLED_SetLowPower_0:
        MOVS     R0,#+1
??OLED_SetLowPower_1:
        POP      {R1,PC}          ;; return
//  341   }
//  342 }
//  343 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  344 INT8U OLED_SetNormalPower(void)
//  345 {
OLED_SetNormalPower:
        PUSH     {R7,LR}
//  346   if(1 == OLED_IsLowPwr)
        LDR.N    R0,??DataTable13_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??OLED_SetNormalPower_0
//  347   {
//  348     OLED_Display_On();
        BL       OLED_Display_On
//  349     OLED_IsLowPwr = 0;
        LDR.N    R0,??DataTable13_10
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  350     return KOS_OK;
        MOVS     R0,#+0
        B.N      ??OLED_SetNormalPower_1
//  351   }
//  352   else
//  353   {
//  354     return KOS_ERR;
??OLED_SetNormalPower_0:
        MOVS     R0,#+1
??OLED_SetNormalPower_1:
        POP      {R1,PC}          ;; return
//  355   }
//  356 }
//  357 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  358 static void OLED_StrCpy(char * des,const char * src)
//  359 {
OLED_StrCpy:
        B.N      ??OLED_StrCpy_0
//  360   while(*src)
//  361   {
//  362     *des = *src;
??OLED_StrCpy_1:
        LDRB     R2,[R1, #+0]
        STRB     R2,[R0, #+0]
//  363     src++;
        ADDS     R1,R1,#+1
//  364     des++;
        ADDS     R0,R0,#+1
//  365   }
??OLED_StrCpy_0:
        LDRB     R2,[R1, #+0]
        CMP      R2,#+0
        BNE.N    ??OLED_StrCpy_1
//  366   *des = *src;
        LDRB     R1,[R1, #+0]
        STRB     R1,[R0, #+0]
//  367 }
        BX       LR               ;; return
//  368 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  369 static INT8U OLED_DataShowInit()
//  370 {
OLED_DataShowInit:
        PUSH     {R3-R5,LR}
//  371   INT8U err_code = KOS_OK;
        MOVS     R4,#+0
//  372   for(INT8U index = 0;index < PARAM_SHOW_LENGTH;++index)
        MOVS     R5,#+0
        B.N      ??OLED_DataShowInit_0
//  373   {
//  374     stDataMap[index].lpstr = NULL;
//  375     stDataMap[index].lpstr = (char *) malloc (30 * sizeof(char));
//  376     if(NULL == stDataMap[index].lpstr){ err_code += KOS_ERR; }
//  377     else
//  378     {
//  379       OLED_StrCpy(stDataMap[index].lpstr,(char *)DataMap[index][0]);
??OLED_DataShowInit_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+12
        LDR.N    R1,??DataTable13_11
        MLA      R0,R0,R5,R1
        LDR      R1,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+24
        LDR.N    R2,??DataTable13_6
        MLA      R0,R0,R5,R2
        LDR      R0,[R0, #+8]
        BL       OLED_StrCpy
//  380       stDataMap[index].pData = DataMap[index][1];
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+24
        LDR.N    R1,??DataTable13_6
        MLA      R0,R0,R5,R1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+12
        LDR.N    R2,??DataTable13_11
        MLA      R1,R1,R5,R2
        LDR      R1,[R1, #+4]
        STR      R1,[R0, #+12]
//  381       stDataMap[index].typeID = (DataType)DataMap[index][2];
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+24
        LDR.N    R1,??DataTable13_6
        MLA      R0,R0,R5,R1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+12
        LDR.N    R2,??DataTable13_11
        MLA      R1,R1,R5,R2
        LDR      R1,[R1, #+8]
        STRB     R1,[R0, #+17]
//  382       stDataMap[index].orgLength = strlen(DataMap[index][0]);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+12
        LDR.N    R1,??DataTable13_11
        MLA      R0,R0,R5,R1
        LDR      R0,[R0, #+0]
        BL       strlen
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+24
        LDR.N    R2,??DataTable13_6
        MLA      R1,R1,R5,R2
        STRB     R0,[R1, #+16]
//  383       err_code += KOS_OK;
//  384     }
??OLED_DataShowInit_2:
        ADDS     R5,R5,#+1
??OLED_DataShowInit_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+5
        BCS.N    ??OLED_DataShowInit_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+24
        LDR.N    R1,??DataTable13_6
        MLA      R0,R0,R5,R1
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R0,#+30
        BL       malloc
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+24
        LDR.N    R2,??DataTable13_6
        MLA      R1,R1,R5,R2
        STR      R0,[R1, #+8]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+24
        LDR.N    R1,??DataTable13_6
        MLA      R0,R0,R5,R1
        LDR      R0,[R0, #+8]
        CMP      R0,#+0
        BNE.N    ??OLED_DataShowInit_1
        ADDS     R4,R4,#+1
        B.N      ??OLED_DataShowInit_2
//  385   }
//  386   return err_code;
??OLED_DataShowInit_3:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//  387 }
//  388 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  389 static void Show_Param(INT8U id,ParamSt *param){
Show_Param:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  390   INT8U index = 0;
        MOVS     R6,#+0
//  391   INT8U cnt = 0;
        MOVS     R7,#+0
//  392   char *src = param->lpstr;
        LDR      R8,[R5, #+8]
//  393   gTypeAdapter(param);
        MOVS     R0,R5
        BL       gTypeAdapter
        B.N      ??Show_Param_0
//  394   for(;cnt < param->orgLength;++cnt)
//  395   {
//  396     OLED_Write_Char(index,id*8,*src,0);
??Show_Param_1:
        MOVS     R3,#+0
        LDRB     R2,[R8, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R1,R4,#+3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_Write_Char
//  397     index+=6;
        ADDS     R6,R6,#+6
//  398     src++;
        ADDS     R8,R8,#+1
//  399   }
        ADDS     R7,R7,#+1
??Show_Param_0:
        LDRB     R0,[R5, #+16]
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,R0
        BCC.N    ??Show_Param_1
//  400   while(*src){
??Show_Param_2:
        LDRB     R0,[R8, #+0]
        CMP      R0,#+0
        BEQ.N    ??Show_Param_3
//  401     OLED_Write_Char(index,id*8,*src,1);
        MOVS     R3,#+1
        LDRB     R2,[R8, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R1,R4,#+3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_Write_Char
//  402     index+=6;
        ADDS     R6,R6,#+6
//  403     src++;
        ADDS     R8,R8,#+1
        B.N      ??Show_Param_2
//  404   }
//  405   while(index<122){
//  406     OLED_Write_Char(index,id*8,' ',1);
??Show_Param_4:
        MOVS     R3,#+1
        MOVS     R2,#+32
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R1,R4,#+3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_Write_Char
//  407     index+=6;
        ADDS     R6,R6,#+6
//  408   }
??Show_Param_3:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+122
        BCC.N    ??Show_Param_4
//  409   OLED_Refresh_SeleteGram(id);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_Refresh_SeleteGram
//  410 }
        POP      {R4-R8,PC}       ;; return
//  411 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  412 void WriteTips(INT8U id,INT8U *pre,const char *str){
WriteTips:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  413   INT8U index=0;
        MOVS     R7,#+0
        B.N      ??WriteTips_0
//  414   while(*pre){
//  415     OLED_Write_Char(index,id*8,*pre,0);
??WriteTips_1:
        MOVS     R3,#+0
        LDRB     R2,[R5, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R1,R4,#+3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_Write_Char
//  416     index+=6;
        ADDS     R7,R7,#+6
//  417     pre++;
        ADDS     R5,R5,#+1
//  418   }
??WriteTips_0:
        LDRB     R0,[R5, #+0]
        CMP      R0,#+0
        BNE.N    ??WriteTips_1
//  419   while(*str){
??WriteTips_2:
        LDRB     R0,[R6, #+0]
        CMP      R0,#+0
        BEQ.N    ??WriteTips_3
//  420     OLED_Write_Char(index,id*8,*str,0);
        MOVS     R3,#+0
        LDRB     R2,[R6, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R1,R4,#+3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_Write_Char
//  421     index+=6;
        ADDS     R7,R7,#+6
//  422     str++;
        ADDS     R6,R6,#+1
        B.N      ??WriteTips_2
//  423   }
//  424   while(index<122){
//  425     OLED_Write_Char(index,id*8,' ',1);
??WriteTips_4:
        MOVS     R3,#+1
        MOVS     R2,#+32
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R1,R4,#+3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_Write_Char
//  426     index+=6;
        ADDS     R7,R7,#+6
//  427   }
??WriteTips_3:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+122
        BCC.N    ??WriteTips_4
//  428   OLED_Refresh_SeleteGram(id);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_Refresh_SeleteGram
//  429 }
        POP      {R0,R4-R7,PC}    ;; return
//  430 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  431 void OLED_Proc(void)
//  432 {
OLED_Proc:
        PUSH     {R4,LR}
//  433   for(INT8U index = 0;index < PARAM_SHOW_LENGTH;++index)
        MOVS     R4,#+0
        B.N      ??OLED_Proc_0
//  434   {
//  435     Show_Param(index,&stDataMap[index]);
??OLED_Proc_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+24
        LDR.N    R1,??DataTable13_6
        MLA      R1,R0,R4,R1
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Show_Param
//  436   }
        ADDS     R4,R4,#+1
??OLED_Proc_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+5
        BCC.N    ??OLED_Proc_1
//  437 }
        POP      {R4,PC}          ;; return
//  438 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  439 INT8U OLED_Init(void)
//  440 {
OLED_Init:
        PUSH     {R7,LR}
//  441   OLED_ReqGram();// ◊œ»…Í«Î“∫æßœ‘¥Ê
        BL       OLED_ReqGram
//  442   if(NULL == ptrDisplay_GRAM) return KOS_ERR;//ƒ⁄¥Ê∑÷≈‰ ß∞‹£¨“∫æß≥ı ºªØ ß∞‹
        LDR.N    R0,??DataTable13_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??OLED_Init_0
        MOVS     R0,#+1
        B.N      ??OLED_Init_1
//  443   OLED_IO_Init();
??OLED_Init_0:
        BL       OLED_IO_Init
//  444   OLED_RST();
        BL       OLED_RST
//  445   OLED_ChipInit();
        BL       OLED_ChipInit
//  446   OLED_Display_On();
        BL       OLED_Display_On
//  447   OLED_Clear();
        BL       OLED_Clear
//  448   OLED_Refresh_Gram();
        BL       OLED_Refresh_Gram
//  449   if(KOS_OK != OLED_DataShowInit()) return KOS_ERR;
        BL       OLED_DataShowInit
        CMP      R0,#+0
        BEQ.N    ??OLED_Init_2
        MOVS     R0,#+1
        B.N      ??OLED_Init_1
//  450   else return KOS_OK;
??OLED_Init_2:
        MOVS     R0,#+0
??OLED_Init_1:
        POP      {R1,PC}          ;; return
//  451 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0x4004a054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     0x4004a004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     0x4004a00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_3:
        DC32     0x4004a028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_4:
        DC32     0x400ff054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_5:
        DC32     ptrDisplay_GRAM

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_6:
        DC32     stDataMap

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_7:
        DC32     0x400ff044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_8:
        DC32     0x400ff048

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_9:
        DC32     ASCII_0608

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_10:
        DC32     OLED_IsLowPwr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_11:
        DC32     DataMap
//  452 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  453 void OLED_Close(void)
//  454 {
OLED_Close:
        PUSH     {R7,LR}
//  455   OLED_Clear();
        BL       OLED_Clear
//  456   OLED_Refresh_Gram();
        BL       OLED_Refresh_Gram
//  457   OLED_Display_Off();
        BL       OLED_Display_Off
//  458   OLED_FreeRam();
        BL       OLED_FreeRam
//  459 }
        POP      {R0,PC}          ;; return

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
//   126 bytes in section .bss
//   656 bytes in section .rodata
// 1 664 bytes in section .text
// 
// 1 664 bytes of CODE  memory
//   656 bytes of CONST memory
//   126 bytes of DATA  memory
//
//Errors: none
//Warnings: 3
