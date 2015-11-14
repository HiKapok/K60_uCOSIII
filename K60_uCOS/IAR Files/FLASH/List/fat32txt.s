///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      03/Nov/2015  20:45:54 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\SD_System\fat3 /
//                    2txt.c                                                  /
//    Command line =  C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\SD_System\fat3 /
//                    2txt.c -D COMPILER_IAR -lCN                             /
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
//                    Files\FLASH\List\fat32txt.s                             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME fat32txt

        #define SHT_PROGBITS 0x1

        EXTERN CloseSD
        EXTERN Flag_SDRdy
        EXTERN SD_driver_Init
        EXTERN SetSD_High
        EXTERN SetSD_Low
        EXTERN Wait_SDRdy
        EXTERN __aeabi_memcpy4
        EXTERN flag_err_sd
        EXTERN sd_init
        EXTERN sd_initover
        EXTERN sd_readsingleblock
        EXTERN sd_writesingleblock
        EXTERN sd_yes

        PUBLIC Cnt_SDbufS1
        PUBLIC Cnt_SDbufS2
        PUBLIC Cnt_SDbufS3
        PUBLIC Cnt_SDbufS4
        PUBLIC Cnt_SDbufS5
        PUBLIC SD_System_Init
        PUBLIC SD_System_Init_Ext
        PUBLIC fat32_init
        PUBLIC search_addr_sd
        PUBLIC search_fat
        PUBLIC test_sd
        PUBLIC write_dir
        PUBLIC write_fat
        PUBLIC write_stop
        PUBLIC writebyte_ram
        PUBLIC writeram_sd


        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "If you see these word...">`:
        DATA
        DC8 49H, 66H, 20H, 79H, 6FH, 75H, 20H, 73H
        DC8 65H, 65H, 20H, 74H, 68H, 65H, 73H, 65H
        DC8 20H, 77H, 6FH, 72H, 64H, 73H, 2CH, 20H
        DC8 79H, 6FH, 75H, 20H, 53H, 44H, 20H, 61H
        DC8 6EH, 64H, 20H, 68H, 61H, 72H, 64H, 77H
        DC8 61H, 72H, 65H, 20H, 69H, 73H, 20H, 4FH
        DC8 4BH, 21H, 0
        DC8 0
// C:\Users\WangChangan\Desktop\K10Ð¡°å¶¨¸å\SD_System\fat32txt.c
//    1 /******************************************************************************
//    2 
//    3 * fat32txt.c
//    4 
//    5 * fat32ÎÄ¼þÏµÍ³²Ù×÷£¨Ð´µ¥¸ö´óµÄTXTÎÄ¼þ£© 
//    6 
//    7 * µÚÒ»×÷Õß£º  ¼Í³É   (µÚËÄ½ìÉãÏñÍ·)
//    8   ÍêÉÆÓëÕûÀí£ºËïÎÄ½¡ (µÚÁù½ìÉãÏñÍ·)
//    9 * °æ±¾£ºV1.15 (ÓëV1.13¡¢v1.14°æÏà¼æÈÝ,²»Ê¹ÄÜË«»º´æÊ±ÓëV1.10Ö®ºóµÄ°æ±¾Ïà¼æÈÝ)
//   10 * °æ±¾¸üÐÂÊ±¼ä£º2012Äê1ÔÂ30ÈÕ
//   11  
//   12 ******************************************************************************/
//   13 
//   14 #include "./SD_System.h"
//   15                                   
//   16 #if EN_SDCard != 0                
//   17 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   18 static byte_sd const dir_sd[32]=                             /************By Sword************/
dir_sd:
        DATA
        DC8 65, 44, 123, 140, 78, 227, 78, 10, 78, 77, 79, 15, 0, 49, 58, 103
        DC8 46, 0, 108, 0, 110, 0, 107, 0, 0, 0, 0, 0, 255, 255, 255, 255
//   19 {
//   20 0x41,0x2c,0x7b,0x8c,0x4e,0xe3,0x4e,0x0a,0x4e,0x4d,0x4f,0x0f,0x00,0x31,0x3a,0x67,
//   21 0x2e,0x00,0x6c,0x00,0x6e,0x00,0x6b,0x00,0x00,0x00,0x00,0x00,0xff,0xff,0xff,0xff 
//   22 };
//   23 //¾í±êÊôÐÔ,µ±¼ì²âµ½¸ùÄ¿Â¼µÄµÚÒ»¸öµ¥ÔªÎª¿ÕÊ±Ð´Èë¸ÃÄÚÈÝ

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   24 static byte_sd const file_property[15]=
file_property:
        DATA
        DC8 32, 24, 0, 0, 0, 100, 59, 100, 59, 0, 0, 0, 0, 100, 59, 0
//   25 {0x20,0x18,0x00,0x00,0x00,0x64,0x3b,0x64,0x3b,0x00,0x00,0x00,0x00,0x64,0x3b};
//   26 //ÎÄ¼þÊôÐÔ

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   27 static byte_sd  file_name[11]=                               /************By Sword************/
file_name:
        DATA
        DC8 67, 65, 82, 45, 45, 48, 48, 48, 84, 88, 84, 0
//   28 {'C','A','R','-','-','0','0','0',0x54,0x58,0x54};
//   29 //ÎÄ¼þÃû³Æ(º¬À©Õ¹Ãû)
//   30 //×¢,Ó¢ÎÄ×ÖÄ¸±ØÐë´óÐ´£¬·ñÔòÎÄ¼þ´ò²»¿ª£¡£¡£¡
//   31 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   32 static dword_sd add_sta,add_dir,add_f1,add_f2;               /************By Sword************/
add_sta:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
add_dir:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
add_f1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
add_f2:
        DS8 4
//   33 //Æô¶¯ÉÈÇø¡¢¸ùÄ¿Â¼¡¢fat1¡¢fat2µÄÊ×µØÖ·£¨³õÊ¼Öµ£©

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   34 static dword_sd p_datasector;      //Êý¾ÝÉÈÇøÖ¸Õë            /************By Sword************/
p_datasector:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   35 static word_sd  p_sector;  //ÉÈÇøÖ¸Õë                        /************By Sword************/
p_sector:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   36 static dword_sd file_size=0;
file_size:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   37 static byte_sd  sector_cluster; //Ã¿ÉÈÇø¶ÔÓ¦µÄ´ØÊý
sector_cluster:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   38 static dword_sd sector_sta;     //Æô¶¯ÉÈÇøÉÈÇøÊý
sector_sta:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   39 static dword_sd sector_fat;     //fat±íÉÈÇøÊý
sector_fat:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   40 static word_sd  cluster_number,ram_number;
cluster_number:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
ram_number:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   41 static word_sd  cnt_cluster;
cnt_cluster:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   42 static word_sd  p_segcluster;     //´Ø×éµÄÖ¸Õë
p_segcluster:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   43 static byte_sd  num_segcluster;   //µ±Ç°´Ø×éµÄ³¤¶È
num_segcluster:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   44 static byte_sd  p_cluster;        //Ö¸Ïòµ±Ç°´Ø×éÖÐ´ØµÄÎ»ÖÃµÄÖ¸Õë
p_cluster:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   45 static byte_sd  DBUF[512];        //¶¨Òå512×Ö½Ú»º³åÇø
DBUF:
        DS8 512

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   46 static dword_sd  next_cluster[SD_MAX_segment]; 
next_cluster:
        DS8 560
//   47 //±ê¼ÇÏÂÒ»¸ö´Ø×é:µÍ24Î»±íÊ¾¸Ã´Ø×éµÄÆðÊ¼µØÖ·,¸ß8Î»±íÊ¾´ØµÄ¸öÊý   
//   48 /************By Sword************/ 
//   49 
//   50 
//   51 #ifdef EN_SDbuf   //Ë«»º³åÄ£Ê½
//   52 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   53 static byte_sd  DBUF2[512];   //SD¿¨µÚ¶þ»º³åÇø
DBUF2:
        DS8 512

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   54 static dword_sd Sector_SDbuf; //µÚ¶þ»º´æÖÐÊý¾Ý¶ÔÓ¦µÄÄ¿µÄÉÈÇø
Sector_SDbuf:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   55 static byte_sd  Stat_SDbuf;   //µÚ¶þ»º´æ×´Ì¬±êÖ¾(=0±íÊ¾Îª¿Õ)
Stat_SDbuf:
        DS8 1
//   56 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   57 static byte_sd *pBuf_Now,*pBuf_2; //µ±Ç°»º´æÓëµÚ¶þ»º´æÖ¸Õë
pBuf_Now:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
pBuf_2:
        DS8 4
//   58 /*
//   59 ×¢Òâ£º½«Êý¾Ý´æÈëµÚ¶þ»º³åµÄ¹ý³Ì²¢²»ÊÇ½«Êý¾Ý¸´ÖÆ¹ýÈ¥,
//   60 ¶øÊÇ½»»»Á½¸ö»º³åÇøµÄÖ¸Õë,´Ó¶ø¿ÉÒÔ´ó´ó¼Ó¿ì³ÌÐòÖ´ÐÐËÙ¶È
//   61 */
//   62 
//   63 #ifdef EN_Cnt_SDbuf

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   64 word_sd Cnt_SDbufS1,Cnt_SDbufS2,Cnt_SDbufS3,Cnt_SDbufS4,Cnt_SDbufS5;
Cnt_SDbufS1:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
Cnt_SDbufS2:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
Cnt_SDbufS3:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
Cnt_SDbufS4:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
Cnt_SDbufS5:
        DS8 2
//   65 /*»º´æÊ¹ÓÃ×´¿öÍ³¼Æ±äÁ¿*/
//   66 /*
//   67 Cnt_SDbufS1:Õý³£Çé¿öµÄÊýÁ¿(SD¿¨·ÇÃ¦,»º´æÎª¿Õ)
//   68 Cnt_SDbufS2:SD¿¨·ÇÃ¦,»º´æ·Ç¿Õ,ÇÒÐ´Èë»º´æºó¿É¼ÌÐøÐ´ÈëÐÂÊý¾Ý
//   69 Cnt_SDbufS3:SD¿¨·ÇÃ¦,»º´æ·Ç¿Õ,µ«Ð´Èë»º´æºóµÈ´ý³¬Ê±,²»ÄÜ¼ÌÐøÐ´ÈëÐÂÊý¾Ý
//   70 Cnt_SDbufS4:SD¿¨Ã¦,µ«»º´æÎª¿Õ,¿ÉÒÔ½«ÐÂÊý¾Ý´æÈë»º´æ
//   71 Cnt_SDbufS5:SD¿¨Ã¦,ÇÒ»º´æ·Ç¿Õ,Ö»ÄÜ¸ÉµÈ
//   72 */
//   73 #endif
//   74 
//   75 /***********************************************************
//   76 * function:SD_WriteBlock_UserBuf
//   77 * description:sd¿¨Ë«»º³å¶ÁÐ´º¯Êý
//   78 ************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   79 static byte_sd SD_WriteBlock_UserBuf(void)
//   80 {
SD_WriteBlock_UserBuf:
        PUSH     {R3-R5,LR}
//   81   byte_sd r1=0,retry;
        MOVS     R4,#+0
//   82   byte_sd *pTmp;
//   83   
//   84   Wait_SDRdy(SD_SHORT_Wait);
        MOVW     R0,#+5000
        BL       Wait_SDRdy
//   85   if(Flag_SDRdy == 0)
        LDR.W    R0,??DataTable7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SD_WriteBlock_UserBuf_0
//   86   { //SD¿¨Ã¦
//   87     if(Stat_SDbuf == 0)
        LDR.W    R0,??DataTable7_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SD_WriteBlock_UserBuf_1
//   88     { //»º´æÎª¿Õ
//   89     //½«Êý¾ÝÏÈ´æÈë»º´æ(ËùÎ½´æÈë¾ÍÊÇ½»»»Á½¸ö»º´æµÄÖ¸Õë)
//   90       pTmp=pBuf_Now;
        LDR.W    R0,??DataTable7_2
        LDR      R0,[R0, #+0]
//   91       pBuf_Now=pBuf_2;
        LDR.W    R1,??DataTable7_2
        LDR.W    R2,??DataTable7_3
        LDR      R2,[R2, #+0]
        STR      R2,[R1, #+0]
//   92       pBuf_2=pTmp;
        LDR.W    R1,??DataTable7_3
        STR      R0,[R1, #+0]
//   93       Sector_SDbuf=p_datasector;
        LDR.W    R0,??DataTable7_4
        LDR.W    R1,??DataTable9
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//   94       Stat_SDbuf=1; //ÖÃÎ»»º´æ±êÖ¾
        LDR.W    R0,??DataTable7_1
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//   95 #ifdef EN_Cnt_SDbuf      
//   96       Cnt_SDbufS4++;
        LDR.W    R0,??DataTable7_5
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable7_5
        STRH     R0,[R1, #+0]
        B.N      ??SD_WriteBlock_UserBuf_2
//   97 #endif
//   98     }
//   99     else
//  100     { //»º´æ·Ç¿Õ(×îÎÞÓïµÄÇé¿ö,Ä¿Ç°µÄËã·¨Ã»ÓÐ°ì·¨ÓÅ»¯)
//  101     //»º´æ·Ç¿Õ,Ö»ÄÜ¸ÉµÈ  
//  102       Wait_SDRdy(SD_LONG_Wait);
??SD_WriteBlock_UserBuf_1:
        LDR.W    R0,??DataTable7_6  ;; 0x1e8480
        BL       Wait_SDRdy
//  103       retry=0;
        MOVS     R5,#+0
//  104       do //½«»º´æÖÐ´æµÄÊý¾ÝÐ´ÈëSD¿¨
//  105       {  
//  106         r1=sd_writesingleblock(pBuf_2,Sector_SDbuf);
??SD_WriteBlock_UserBuf_3:
        LDR.W    R0,??DataTable7_4
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_3
        LDR      R0,[R0, #+0]
        BL       sd_writesingleblock
        MOVS     R4,R0
//  107       } while(r1!=0 && (++retry)<3);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??SD_WriteBlock_UserBuf_4
        ADDS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BCC.N    ??SD_WriteBlock_UserBuf_3
//  108     //½«Êý¾ÝÔÙ´æÈë»º´æ
//  109       pTmp=pBuf_Now;
??SD_WriteBlock_UserBuf_4:
        LDR.W    R0,??DataTable7_2
        LDR      R0,[R0, #+0]
//  110       pBuf_Now=pBuf_2;
        LDR.W    R1,??DataTable7_2
        LDR.W    R2,??DataTable7_3
        LDR      R2,[R2, #+0]
        STR      R2,[R1, #+0]
//  111       pBuf_2=pTmp;
        LDR.W    R1,??DataTable7_3
        STR      R0,[R1, #+0]
//  112       Sector_SDbuf=p_datasector;
        LDR.W    R0,??DataTable7_4
        LDR.W    R1,??DataTable9
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  113 #ifdef EN_Cnt_SDbuf   
//  114       Cnt_SDbufS5++;
        LDR.W    R0,??DataTable7_7
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable7_7
        STRH     R0,[R1, #+0]
        B.N      ??SD_WriteBlock_UserBuf_2
//  115 #endif      
//  116     }
//  117   }
//  118   else
//  119   { //SD¿¨·ÇÃ¦
//  120     if(Stat_SDbuf == 0)
??SD_WriteBlock_UserBuf_0:
        LDR.W    R0,??DataTable7_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SD_WriteBlock_UserBuf_5
//  121     { //»º´æÎª¿Õ(×îÀíÏëµÄ×´¿ö)
//  122       retry=0;
        MOVS     R5,#+0
//  123       do //½«Êý¾ÝÐ´ÈëSD¿¨
//  124       {  
//  125         r1=sd_writesingleblock(pBuf_Now,p_datasector);
??SD_WriteBlock_UserBuf_6:
        LDR.W    R0,??DataTable9
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_2
        LDR      R0,[R0, #+0]
        BL       sd_writesingleblock
        MOVS     R4,R0
//  126       } while(r1!=0 && (++retry)<3);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??SD_WriteBlock_UserBuf_7
        ADDS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BCC.N    ??SD_WriteBlock_UserBuf_6
//  127 #ifdef EN_Cnt_SDbuf      
//  128       Cnt_SDbufS1++;
??SD_WriteBlock_UserBuf_7:
        LDR.W    R0,??DataTable7_8
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable7_8
        STRH     R0,[R1, #+0]
        B.N      ??SD_WriteBlock_UserBuf_2
//  129 #endif
//  130     }
//  131     else
//  132     { //»º´æ·Ç¿Õ
//  133       retry=0;
??SD_WriteBlock_UserBuf_5:
        MOVS     R5,#+0
//  134       do //½«»º´æÖÐ´æµÄÊý¾ÝÐ´ÈëSD¿¨
//  135       {  
//  136         r1=sd_writesingleblock(pBuf_2,Sector_SDbuf);
??SD_WriteBlock_UserBuf_8:
        LDR.W    R0,??DataTable7_4
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_3
        LDR      R0,[R0, #+0]
        BL       sd_writesingleblock
        MOVS     R4,R0
//  137       } while(r1!=0 && (++retry)<3);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??SD_WriteBlock_UserBuf_9
        ADDS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BCC.N    ??SD_WriteBlock_UserBuf_8
//  138      //Ð´Íê»º´æÖÐÊý¾Ý½øÐÐ¼«¶ÌÊ±¼äµÄµÈ´ý,¸ù¾ÝµÈ´ýºóµÄ½á¹ûÅÐ¶¨ÊÇ·ñÐ´ÈëÐÂÊý¾Ý
//  139       Wait_SDRdy(SD_VST_Wait);
??SD_WriteBlock_UserBuf_9:
        MOV      R0,#+4000
        BL       Wait_SDRdy
//  140       if(Flag_SDRdy == 0)
        LDR.W    R0,??DataTable7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SD_WriteBlock_UserBuf_10
//  141       { //SD¿¨Ã¦
//  142       //½«Êý¾ÝÔÙ´æÈë»º´æ
//  143         pTmp=pBuf_Now;
        LDR.W    R0,??DataTable7_2
        LDR      R0,[R0, #+0]
//  144         pBuf_Now=pBuf_2;
        LDR.W    R1,??DataTable7_2
        LDR.W    R2,??DataTable7_3
        LDR      R2,[R2, #+0]
        STR      R2,[R1, #+0]
//  145         pBuf_2=pTmp;
        LDR.W    R1,??DataTable7_3
        STR      R0,[R1, #+0]
//  146         Sector_SDbuf=p_datasector;
        LDR.W    R0,??DataTable7_4
        LDR.W    R1,??DataTable9
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  147 #ifdef EN_Cnt_SDbuf        
//  148         Cnt_SDbufS3++;
        LDR.W    R0,??DataTable7_9
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable7_9
        STRH     R0,[R1, #+0]
        B.N      ??SD_WriteBlock_UserBuf_2
//  149 #endif
//  150       }
//  151       else
//  152       { //SD¿¨·ÇÃ¦
//  153       //»º´æÖÕÓÚ½âÍÑÁË,½øÈëÕý³£Çé¿ö
//  154         Stat_SDbuf=0; //Çå³ý»º´æ±êÖ¾
??SD_WriteBlock_UserBuf_10:
        LDR.W    R0,??DataTable7_1
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  155         retry=0;
        MOVS     R5,#+0
//  156         do //½«Êý¾ÝÐ´ÈëSD¿¨
//  157         {  
//  158           r1=sd_writesingleblock(pBuf_Now,p_datasector);
??SD_WriteBlock_UserBuf_11:
        LDR.W    R0,??DataTable9
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_2
        LDR      R0,[R0, #+0]
        BL       sd_writesingleblock
        MOVS     R4,R0
//  159         } while(r1!=0 && (++retry)<3);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??SD_WriteBlock_UserBuf_12
        ADDS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BCC.N    ??SD_WriteBlock_UserBuf_11
//  160 #ifdef EN_Cnt_SDbuf        
//  161         Cnt_SDbufS2++;
??SD_WriteBlock_UserBuf_12:
        LDR.W    R0,??DataTable11
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11
        STRH     R0,[R1, #+0]
//  162 #endif
//  163       }
//  164     }
//  165   }
//  166   
//  167   return r1;
??SD_WriteBlock_UserBuf_2:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//  168 }
//  169 /***********************************************************
//  170 * function:SD_ClrBuf
//  171 * description:Çå¿Õ»º´æÖÐÊý¾Ý(½«»º´æÖÐÊý¾ÝÐ´ÈëSD¿¨)
//  172 ************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  173 static void SD_ClrBuf(void)
//  174 {
SD_ClrBuf:
        PUSH     {R4,LR}
//  175   byte_sd r1=0,retry=0;
        MOVS     R0,#+0
        MOVS     R4,#+0
//  176   
//  177   if(Stat_SDbuf != 0)
        LDR.W    R1,??DataTable7_1
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??SD_ClrBuf_0
//  178   {
//  179     Wait_SDRdy(SD_LONG_Wait);
        LDR.W    R0,??DataTable7_6  ;; 0x1e8480
        BL       Wait_SDRdy
//  180     do //½«»º´æÖÐ´æµÄÊý¾ÝÐ´ÈëSD¿¨
//  181     {  
//  182       r1=sd_writesingleblock(pBuf_2,Sector_SDbuf);
??SD_ClrBuf_1:
        LDR.W    R0,??DataTable7_4
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_3
        LDR      R0,[R0, #+0]
        BL       sd_writesingleblock
//  183     } while(r1!=0 && (++retry)<5);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SD_ClrBuf_2
        ADDS     R4,R4,#+1
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BCC.N    ??SD_ClrBuf_1
//  184     Stat_SDbuf=0; //Çå³ý»º´æ±êÖ¾
??SD_ClrBuf_2:
        LDR.W    R0,??DataTable7_1
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  185   }
//  186 }
??SD_ClrBuf_0:
        POP      {R4,PC}          ;; return
//  187 
//  188 #endif
//  189 
//  190 /*********************************************************/
//  191 //function:write_dir
//  192 //description:Ð´¸ùÄ¿Â¼º¯Êý
//  193 //ÐÞ¸Ä£º Sword
//  194 /***********************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  195 void write_dir(void)
//  196 {
write_dir:
        PUSH     {R4-R8,LR}
//  197   word_sd i=0,j,k,flag,retry=0;
        MOVS     R4,#+0
        MOVS     R5,#+0
//  198   word_sd h_add,l_add,sum;
//  199   word_sd addr=0,addh=0,max=0;
        MOVS     R7,#+0
        MOVS     R6,#+0
        MOVS     R8,#+0
//  200   byte_sd r1; 
//  201 
//  202   do     //¿´¸ùÄ¿Â¼µÄµÚÒ»¸öµ¥Ôª(¾í±ê)ÊÇ·ñÎª¿Õ
//  203    {
//  204      r1=sd_readsingleblock(DBUF,add_dir);
??write_dir_0:
        LDR.W    R0,??DataTable9_1
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable12
        BL       sd_readsingleblock
//  205      C_WDOG();
        CPSID i         
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+42498
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+46208
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??write_dir_1
        CPSIE i         
//  206      retry++;
??write_dir_1:
        ADDS     R5,R5,#+1
//  207    } while(r1!=0x00&&retry<100);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??write_dir_2
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+100
        BCC.N    ??write_dir_0
//  208   retry=0;
??write_dir_2:
        MOVS     R5,#+0
//  209   
//  210   if(DBUF[0]==0x00)   //Èç¹û¸ùÄ¿Â¼µÚÒ»¸öµ¥ÔªÎª¿ÕÔòÐ´Èë¾í±ê
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??write_dir_3
//  211    {
//  212      for(i=0;i<32;i++) DBUF[i]=dir_sd[i];
        MOVS     R4,#+0
        B.N      ??write_dir_4
??write_dir_5:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LDR.W    R0,??DataTable12
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LDR.W    R1,??DataTable9_4
        LDRB     R1,[R4, R1]
        STRB     R1,[R4, R0]
        ADDS     R4,R4,#+1
??write_dir_4:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+32
        BCC.N    ??write_dir_5
//  213      while(sd_writesingleblock(DBUF,add_dir)&&retry<1000) //Ð´¾í±ê
??write_dir_6:
        LDR.W    R0,??DataTable9_1
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable12
        BL       sd_writesingleblock
        CMP      R0,#+0
        BEQ.N    ??write_dir_3
        MOV      R0,#+1000
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R0
        BCS.N    ??write_dir_3
//  214       {                            
//  215         C_WDOG(); //Çå¿ªÃÅ¹· 
        CPSID i         
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_dir_7
        CPSIE i         
//  216         retry++;
??write_dir_7:
        ADDS     R5,R5,#+1
        B.N      ??write_dir_6
//  217       } 
//  218    }
//  219   
//  220   for(i=0;i<sector_cluster;i++)
??write_dir_3:
        MOVS     R4,#+0
        B.N      ??write_dir_8
??write_dir_9:
        ADDS     R4,R4,#+1
??write_dir_8:
        LDR.W    R0,??DataTable9_5
        LDRB     R0,[R0, #+0]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R4,R0
        BCS.W    ??write_dir_10
//  221    { 
//  222      do     //ÏÈ¶Á¸ùÄ¿Â¼ÔÙ¸ÄÐ´,´Ó¶ø±£Ö¤²»»á¸ü¸ÄÔ­À´µÄÎÄ¼þ
//  223       {
//  224         r1=sd_readsingleblock(DBUF,add_dir+i);
??write_dir_11:
        LDR.W    R0,??DataTable9_1
        LDR      R0,[R0, #+0]
        UXTAH    R1,R0,R4
        LDR.W    R0,??DataTable12
        BL       sd_readsingleblock
//  225         C_WDOG();
        CPSID i         
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+42498
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+46208
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??write_dir_12
        CPSIE i         
//  226         retry++;
??write_dir_12:
        ADDS     R5,R5,#+1
//  227       } while(r1!=0x00&&retry<100);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??write_dir_13
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+100
        BCC.N    ??write_dir_11
//  228      retry=0;
??write_dir_13:
        MOVS     R5,#+0
//  229     
//  230      for(k=0;k<512;k+=32)
        MOVS     R0,#+0
        B.N      ??write_dir_14
//  231       {
//  232        
//  233         if(addr==0&&addh==0&&DBUF[k]==0x00||DBUF[k]==0xE5) 
//  234          { addh=i;addr=k; }  //Ñ°ÕÒÒ»¸ö¿Õ°×µÄ32×Ö½ÚÇø¼ä
//  235        
//  236         for(j=0,flag=1;j<5;j++)  //¾ö²ßÎÄ¼þÐòºÅ
//  237           if(DBUF[k+j]!=file_name[j]) flag=0;
//  238         if(flag)
//  239          {
//  240            if(DBUF[k+5]>'9'||DBUF[k+5]<'0') continue;
//  241            if(DBUF[k+6]>'9'||DBUF[k+6]<'0') continue;
//  242            if(DBUF[k+7]>'9'||DBUF[k+7]<'0') continue;
//  243            sum=(DBUF[k+7]-'0')+(DBUF[k+6]-'0')*10+(DBUF[k+5]-'0')*100;
??write_dir_15:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        ADDS     R1,R0,R1
        LDRB     R1,[R1, #+7]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R2,??DataTable12
        ADDS     R2,R0,R2
        LDRB     R2,[R2, #+6]
        MOVS     R3,#+10
        MULS     R2,R3,R2
        UXTAB    R1,R2,R1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R2,??DataTable12
        ADDS     R2,R0,R2
        LDRB     R2,[R2, #+5]
        MOVS     R3,#+100
        MLA      R1,R3,R2,R1
        MOVW     R2,#+5328
        SUBS     R1,R1,R2
//  244            if(sum>max) max=sum;
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R8,R1
        BCS.N    ??write_dir_16
        MOV      R8,R1
??write_dir_16:
        ADDS     R0,R0,#+32
??write_dir_14:
        MOV      R1,#+512
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BCS.N    ??write_dir_9
        ORRS     R1,R6,R7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BNE.N    ??write_dir_17
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        LDRB     R1,[R0, R1]
        CMP      R1,#+0
        BEQ.N    ??write_dir_18
??write_dir_17:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        LDRB     R1,[R0, R1]
        CMP      R1,#+229
        BNE.N    ??write_dir_19
??write_dir_18:
        MOVS     R6,R4
        MOVS     R7,R0
??write_dir_19:
        MOVS     R1,#+0
        MOVS     R2,#+1
        B.N      ??write_dir_20
??write_dir_21:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTAH    R3,R1,R0
        LDR.W    R12,??DataTable12
        LDRB     R3,[R3, R12]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R12,??DataTable11_1
        LDRB     R12,[R1, R12]
        CMP      R3,R12
        BEQ.N    ??write_dir_22
        MOVS     R2,#+0
??write_dir_22:
        ADDS     R1,R1,#+1
??write_dir_20:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+5
        BCC.N    ??write_dir_21
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BEQ.N    ??write_dir_16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        ADDS     R1,R0,R1
        LDRB     R1,[R1, #+5]
        SUBS     R1,R1,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+10
        BCS.N    ??write_dir_16
??write_dir_23:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        ADDS     R1,R0,R1
        LDRB     R1,[R1, #+6]
        SUBS     R1,R1,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+10
        BCS.N    ??write_dir_16
??write_dir_24:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        ADDS     R1,R0,R1
        LDRB     R1,[R1, #+7]
        SUBS     R1,R1,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+10
        BCC.N    ??write_dir_15
        B.N      ??write_dir_16
//  245          }
//  246       }
//  247    }
//  248   
//  249   if(addh==0&&addr==0)
??write_dir_10:
        ORRS     R0,R7,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??write_dir_25
//  250    {     //Ã»ÓÐÔÚ¸ùÄ¿Â¼ÕÒµ½¿ÕÏÐÎ»ÖÃ
//  251      CloseSD();
        BL       CloseSD
//  252      return;
        B.N      ??write_dir_26
//  253    }
//  254   
//  255   do     //ÏÈ¶Á¸ùÄ¿Â¼ÔÙ¸ÄÐ´,´Ó¶ø±£Ö¤²»»á¸ü¸ÄÔ­À´µÄÎÄ¼þ
//  256    {
//  257      r1=sd_readsingleblock(DBUF,add_dir+addh);
??write_dir_25:
        LDR.W    R0,??DataTable9_1
        LDR      R0,[R0, #+0]
        UXTAH    R1,R0,R6
        LDR.W    R0,??DataTable12
        BL       sd_readsingleblock
//  258      C_WDOG();
        CPSID i         
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+42498
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+46208
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??write_dir_27
        CPSIE i         
//  259      retry++;
??write_dir_27:
        ADDS     R5,R5,#+1
//  260    } while(r1!=0x00&&retry<100);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??write_dir_28
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+100
        BCC.N    ??write_dir_25
//  261   retry=0; 
??write_dir_28:
        MOVS     R5,#+0
//  262    
//  263   file_name[7]=(max+1)%10+'0';   //Éú³ÉÎÄ¼þÃû
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        ADDS     R0,R8,#+1
        MOVS     R1,#+10
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R0,R0,#+48
        LDR.W    R1,??DataTable11_1
        STRB     R0,[R1, #+7]
//  264   file_name[6]=(max+1)/10%10+'0'; 
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        ADDS     R0,R8,#+1
        MOVS     R1,#+10
        SDIV     R0,R0,R1
        MOVS     R1,#+10
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R0,R0,#+48
        LDR.W    R1,??DataTable11_1
        STRB     R0,[R1, #+6]
//  265   file_name[5]=(max+1)/100+'0';
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        ADDS     R0,R8,#+1
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+48
        LDR.W    R1,??DataTable11_1
        STRB     R0,[R1, #+5]
//  266 
//  267   h_add=(next_cluster[0]&0x00FF0000)>>16;
        LDR.W    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+16
        UXTB     R2,R0            ;; ZeroExt  R2,R0,#+24,#+24
//  268   l_add=next_cluster[0]&0x0000FFFF;   
        LDR.W    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
//  269   
//  270   for(i=0,j=0;i<11;i++,j++)
        MOVS     R4,#+0
        MOVS     R1,#+0
        B.N      ??write_dir_29
//  271    {
//  272      DBUF[addr+i]=file_name[j];    //ÎÄ¼þÃû
??write_dir_30:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTAH    R2,R4,R7
        LDR.W    R3,??DataTable12
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R12,??DataTable11_1
        LDRB     R12,[R1, R12]
        STRB     R12,[R2, R3]
//  273    }
        ADDS     R4,R4,#+1
        ADDS     R1,R1,#+1
??write_dir_29:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+11
        BCC.N    ??write_dir_30
//  274   for(j=0;i<26;i++,j++)
        MOVS     R1,#+0
        B.N      ??write_dir_31
//  275    {
//  276      DBUF[addr+i]=file_property[j];         //ÎÄ¼þÊôÐÔ
??write_dir_32:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTAH    R2,R4,R7
        LDR.W    R3,??DataTable12
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R12,??DataTable12_2
        LDRB     R12,[R1, R12]
        STRB     R12,[R2, R3]
//  277    }
        ADDS     R4,R4,#+1
        ADDS     R1,R1,#+1
??write_dir_31:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+26
        BCC.N    ??write_dir_32
//  278   DBUF[addr+26]=(byte_sd)(l_add&0x00FF);      //Ð´ÈëÎÄ¼þÆðÊ¼´ØµÄµÍ16Î»
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDR.W    R1,??DataTable12
        ADDS     R1,R7,R1
        STRB     R0,[R1, #+26]
//  279   DBUF[addr+27]=(byte_sd)((l_add>>8)&0x00FF);  
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDR.W    R1,??DataTable12
        ADDS     R1,R7,R1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R1, #+27]
//  280     
//  281   file_size=ram_number+(((dword_sd)(cnt_cluster*sector_cluster+p_sector))<<9L);
        LDR.W    R0,??DataTable12_3
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable12_4
        LDRH     R1,[R1, #+0]
        LDR.W    R2,??DataTable9_5
        LDRB     R2,[R2, #+0]
        MULS     R1,R2,R1
        LDR.W    R2,??DataTable12_5
        LDRH     R2,[R2, #+0]
        UXTAH    R1,R1,R2
        LSLS     R1,R1,#+9
        UXTAH    R0,R1,R0
        LDR.W    R1,??DataTable12_6
        STR      R0,[R1, #+0]
//  282   if(ram_number!=0) file_size-=512; 
        LDR.W    R0,??DataTable12_3
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_dir_33
        LDR.W    R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+512
        LDR.W    R1,??DataTable12_6
        STR      R0,[R1, #+0]
//  283   DBUF[addr+28]=(byte_sd)(file_size&0x000000ff);        //ÎÄ¼þ´óÐ¡
??write_dir_33:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDR.W    R0,??DataTable12
        ADDS     R0,R7,R0
        LDR.W    R1,??DataTable12_6
        LDR      R1,[R1, #+0]
        STRB     R1,[R0, #+28]
//  284   DBUF[addr+29]=(byte_sd)((file_size&0x0000ff00)>>8);
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDR.W    R0,??DataTable12
        ADDS     R0,R7,R0
        LDR.W    R1,??DataTable12_6
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+8
        STRB     R1,[R0, #+29]
//  285   DBUF[addr+30]=(byte_sd)((file_size&0x00ff0000)>>16);
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDR.W    R0,??DataTable12
        ADDS     R0,R7,R0
        LDR.W    R1,??DataTable12_6
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+16
        STRB     R1,[R0, #+30]
//  286   DBUF[addr+31]=(byte_sd)((file_size&0xff000000)>>24);
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDR.W    R0,??DataTable12
        ADDS     R0,R7,R0
        LDR.W    R1,??DataTable12_6
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+24
        STRB     R1,[R0, #+31]
        B.N      ??write_dir_34
//  287 
//  288   while(sd_writesingleblock(DBUF,add_dir+addh)&&retry<1000) //Ð´¸ùÄ¿Â¼
//  289    {
//  290      C_WDOG(); //Çå¿ªÃÅ¹· 
??write_dir_35:
        CPSID i         
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_dir_36
        CPSIE i         
//  291      retry++;
??write_dir_36:
        ADDS     R5,R5,#+1
//  292    }
??write_dir_34:
        LDR.W    R0,??DataTable9_1
        LDR      R0,[R0, #+0]
        UXTAH    R1,R0,R6
        LDR.W    R0,??DataTable12
        BL       sd_writesingleblock
        CMP      R0,#+0
        BEQ.N    ??write_dir_37
        MOV      R0,#+1000
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R0
        BCC.N    ??write_dir_35
//  293 }
??write_dir_37:
??write_dir_26:
        POP      {R4-R8,PC}       ;; return
//  294 /***********************************************************************/
//  295 //function:write_fat
//  296 //description:Ð´SD¿¨µÄfat1£¬fat2±í(Ëã·¨ºÜ¸´ÔÓ£¬Ðë×ÐÏ¸Ë¼¿¼·ÖÎö)
//  297 //ÐÞ¸Ä£º Sword
//  298 /***********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  299 void write_fat(void)
//  300 {
write_fat:
        PUSH     {R4-R10,LR}
//  301   dword_sd sector=0,cluster;        
        MOVS     R7,#+0
//  302   word_sd  i=0,p,retry=0,num,k,j;
        MOVS     R6,#+0
        MOVS     R8,#+0
//  303   byte_sd  r1;
//  304                                        
//  305   num=cnt_cluster;
        LDR.W    R0,??DataTable12_4
        LDRH     R5,[R0, #+0]
//  306   if(p_sector!=0) num++;
        LDR.W    R0,??DataTable12_5
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_fat_0
        ADDS     R5,R5,#+1
//  307   
//  308   k=j=0;
??write_fat_0:
        MOVS     R9,#+0
        MOV      R4,R9
//  309   num_segcluster=(next_cluster[0]&0xFF000000)>>24;
        LDR.W    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+24
        LDR.W    R1,??DataTable12_7
        STRB     R0,[R1, #+0]
//  310   cluster=next_cluster[0]&0x00FFFFFF;
        LDR.W    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        LSLS     R10,R0,#+8       ;; ZeroExtS R10,R0,#+8,#+8
        LSRS     R10,R10,#+8
//  311   
//  312   for(i=0;i<num;i++)
        MOVS     R6,#+0
        B.N      ??write_fat_1
//  313    {
//  314      if((cluster>>7)!=sector||i==0)
//  315       { 
//  316         if(i!=0) 
//  317          {  //Ð´fat±í
//  318            while(sd_writesingleblock(DBUF,add_f1+sector)&&(retry<1000))
//  319             {
//  320                C_WDOG(); //Çå¿ªÃÅ¹· 
//  321                retry++;
//  322             }
//  323            retry=0;
//  324            while(sd_writesingleblock(DBUF,add_f2+sector)&&(retry<1000)) 
//  325             {
//  326               C_WDOG(); //Çå¿ªÃÅ¹· 
//  327               retry++;
//  328             }
//  329            retry=0;
//  330          }
//  331       
//  332         sector=(cluster>>7);
//  333         
//  334         do     //ÏÈ¶ÁÔÙ°ÑÓÃµ½µÄÐÂ´Ø¸ÄÐ´,´Ó¶ø±£Ö¤²»»á¸ü¸ÄÔ­À´µÄÎÄ¼þ
//  335          {
//  336            r1=sd_readsingleblock(DBUF,add_f1+sector);
//  337            C_WDOG();
//  338            retry++;
//  339          } while(r1!=0x00&&retry<100);
//  340         retry=0;
//  341       }
//  342      
//  343      p=((cluster&0x007F)<<2);      //ÕÒµ½µ±Ç°´Ø¶ÔÓ¦µÄFAT±íµÄÎ»ÖÃ
//  344      
//  345      j++;        //ÕÒµ½ÏÂÒ»¸öÓÐÓÃ´Ø
//  346      if(j==num_segcluster)
//  347       {
//  348         j=0;
//  349         num_segcluster=(next_cluster[++k]&0xFF000000)>>24;
//  350         cluster=next_cluster[k]&0x00FFFFFF; 
//  351       }
//  352      else
//  353       {
//  354         cluster++;
//  355       }
//  356      
//  357      DBUF[p]=(byte_sd)(cluster&0x00FF); //Ð´ÈëÎÄ¼þµÄÏÂÒ»¸ö´Ø
//  358      DBUF[p+1]=(byte_sd)((cluster>>8)&0x00FF);
//  359      DBUF[p+2]=(byte_sd)((cluster>>16)&0x00FF);
//  360      
//  361      if(i==(num-1))
//  362       {
//  363         DBUF[p]=0xff;
//  364         DBUF[p+1]=0xff;
//  365         DBUF[p+2]=0xff;
//  366         DBUF[p+3]=0x0f;
//  367         while(sd_writesingleblock(DBUF,add_f1+sector)&&(retry<1000))
//  368          {
//  369             C_WDOG(); //Çå¿ªÃÅ¹· 
//  370             retry++;
//  371          }
//  372         retry=0;
//  373         while(sd_writesingleblock(DBUF,add_f2+sector)&&(retry<1000)) 
//  374          {
//  375            C_WDOG(); //Çå¿ªÃÅ¹· 
??write_fat_2:
        CPSID i         
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_fat_3
        CPSIE i         
//  376            retry++;
??write_fat_3:
        ADDS     R8,R8,#+1
//  377          }
??write_fat_4:
        LDR.W    R0,??DataTable12_8
        LDR      R0,[R0, #+0]
        ADDS     R1,R7,R0
        LDR.W    R0,??DataTable12
        BL       sd_writesingleblock
        CMP      R0,#+0
        BEQ.N    ??write_fat_5
        MOV      R0,#+1000
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,R0
        BCC.N    ??write_fat_2
//  378         retry=0;
??write_fat_5:
        MOVS     R8,#+0
??write_fat_6:
        ADDS     R6,R6,#+1
??write_fat_1:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R6,R5
        BCS.W    ??write_fat_7
        LSRS     R0,R10,#+7
        CMP      R0,R7
        BNE.N    ??write_fat_8
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BNE.N    ??write_fat_9
??write_fat_8:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BNE.N    ??write_fat_10
        B.N      ??write_fat_11
??write_fat_12:
        CPSID i         
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_fat_13
        CPSIE i         
??write_fat_13:
        ADDS     R8,R8,#+1
??write_fat_10:
        LDR.W    R0,??DataTable12_9
        LDR      R0,[R0, #+0]
        ADDS     R1,R7,R0
        LDR.W    R0,??DataTable12
        BL       sd_writesingleblock
        CMP      R0,#+0
        BEQ.N    ??write_fat_14
        MOV      R0,#+1000
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,R0
        BCC.N    ??write_fat_12
??write_fat_14:
        MOVS     R8,#+0
        B.N      ??write_fat_15
??write_fat_16:
        CPSID i         
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_fat_17
        CPSIE i         
??write_fat_17:
        ADDS     R8,R8,#+1
??write_fat_15:
        LDR.W    R0,??DataTable12_8
        LDR      R0,[R0, #+0]
        ADDS     R1,R7,R0
        LDR.W    R0,??DataTable12
        BL       sd_writesingleblock
        CMP      R0,#+0
        BEQ.N    ??write_fat_18
        MOV      R0,#+1000
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,R0
        BCC.N    ??write_fat_16
??write_fat_18:
        MOVS     R8,#+0
??write_fat_11:
        LSRS     R7,R10,#+7
??write_fat_19:
        LDR.W    R0,??DataTable12_9
        LDR      R0,[R0, #+0]
        ADDS     R1,R7,R0
        LDR.W    R0,??DataTable12
        BL       sd_readsingleblock
        CPSID i         
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+42498
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+46208
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??write_fat_20
        CPSIE i         
??write_fat_20:
        ADDS     R8,R8,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??write_fat_21
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+100
        BCC.N    ??write_fat_19
??write_fat_21:
        MOVS     R8,#+0
??write_fat_9:
        ANDS     R0,R10,#0x7F
        LSLS     R0,R0,#+2
        ADDS     R4,R4,#+1
        LDR.W    R1,??DataTable12_7
        LDRB     R1,[R1, #+0]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R4,R1
        BNE.N    ??write_fat_22
        MOVS     R4,#+0
        ADDS     R1,R9,#+1
        MOV      R9,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R2,??DataTable12_1
        LDR      R1,[R2, R1, LSL #+2]
        LSRS     R1,R1,#+24
        LDR.W    R2,??DataTable12_7
        STRB     R1,[R2, #+0]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LDR.W    R1,??DataTable12_1
        LDR      R1,[R1, R9, LSL #+2]
        LSLS     R10,R1,#+8       ;; ZeroExtS R10,R1,#+8,#+8
        LSRS     R10,R10,#+8
        B.N      ??write_fat_23
??write_fat_22:
        ADDS     R10,R10,#+1
??write_fat_23:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        STRB     R10,[R0, R1]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        ADDS     R1,R0,R1
        LSRS     R2,R10,#+8
        STRB     R2,[R1, #+1]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        ADDS     R1,R0,R1
        LSRS     R2,R10,#+16
        STRB     R2,[R1, #+2]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        SUBS     R1,R5,#+1
        CMP      R6,R1
        BNE.W    ??write_fat_6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        MOVS     R2,#+255
        STRB     R2,[R0, R1]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        ADDS     R1,R0,R1
        MOVS     R2,#+255
        STRB     R2,[R1, #+1]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        ADDS     R1,R0,R1
        MOVS     R2,#+255
        STRB     R2,[R1, #+2]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        ADDS     R0,R0,R1
        MOVS     R1,#+15
        STRB     R1,[R0, #+3]
        B.N      ??write_fat_24
??write_fat_25:
        CPSID i         
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_fat_26
        CPSIE i         
??write_fat_26:
        ADDS     R8,R8,#+1
??write_fat_24:
        LDR.W    R0,??DataTable12_9
        LDR      R0,[R0, #+0]
        ADDS     R1,R7,R0
        LDR.W    R0,??DataTable12
        BL       sd_writesingleblock
        CMP      R0,#+0
        BEQ.N    ??write_fat_27
        MOV      R0,#+1000
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,R0
        BCC.N    ??write_fat_25
??write_fat_27:
        MOVS     R8,#+0
        B.N      ??write_fat_4
//  379       }
//  380    }
//  381 }
??write_fat_7:
        POP      {R4-R10,PC}      ;; return
//  382 
//  383 /*********************************************************/
//  384 //function:writeram_sd
//  385 //description:Ð´ram512×Ö½ÚÊý¾Ýµ½sd¿¨ÉÈÇøº¯Êý
//  386 //ÐÞ¸Ä£º Sword
//  387 /***********************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  388 void writeram_sd(void)
//  389 {
writeram_sd:
        PUSH     {R4,LR}
//  390   word_sd retry=0;
        MOVS     R4,#+0
        B.N      ??writeram_sd_0
//  391 #ifdef EN_SDbuf
//  392   while(SD_WriteBlock_UserBuf()&&(retry<300)) 
//  393    {
//  394      C_WDOG(); //Çå¿ªÃÅ¹· 
??writeram_sd_1:
        CPSID i         
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??writeram_sd_2
        CPSIE i         
//  395      retry++;
??writeram_sd_2:
        ADDS     R4,R4,#+1
//  396    }
??writeram_sd_0:
        BL       SD_WriteBlock_UserBuf
        CMP      R0,#+0
        BEQ.N    ??writeram_sd_3
        MOV      R0,#+300
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,R0
        BCC.N    ??writeram_sd_1
//  397 #else                  
//  398   while(sd_writesingleblock(DBUF,p_datasector)&&(retry<300)) 
//  399    {
//  400      C_WDOG(); //Çå¿ªÃÅ¹· 
//  401      retry++;
//  402    }
//  403 #endif   
//  404   if((++p_sector)==sector_cluster)  //Ð´ÍêÒ»´ØµÄ´¦Àí
??writeram_sd_3:
        LDR.W    R0,??DataTable12_5
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable12_5
        STRH     R0,[R1, #+0]
        LDR.W    R1,??DataTable9_5
        LDRB     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R0,R1
        BNE.N    ??writeram_sd_4
//  405    {
//  406      p_sector=0;
        LDR.W    R0,??DataTable12_5
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  407      p_cluster++;
        LDR.W    R0,??DataTable12_10
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable12_10
        STRB     R0,[R1, #+0]
//  408      cnt_cluster++;
        LDR.W    R0,??DataTable12_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable12_4
        STRH     R0,[R1, #+0]
//  409      if(p_cluster==num_segcluster)
        LDR.W    R0,??DataTable12_10
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable12_7
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??writeram_sd_5
//  410       {       //Èç¹ûÒ»¸ö´Ø×éÐ´Íê,½«Ð´ÈëÖ¸ÕëÖ¸ÏòÏÂÒ»´Ø×éµÄÆðÊ¼µØÖ·
//  411         p_datasector=((dword_sd)((next_cluster[++p_segcluster]&0x00FFFFFF)-2))*sector_cluster+add_dir; 
        LDR.W    R0,??DataTable12_11
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable12_11
        STRH     R0,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12_1
        LDR      R0,[R1, R0, LSL #+2]
        LSLS     R0,R0,#+8        ;; ZeroExtS R0,R0,#+8,#+8
        LSRS     R0,R0,#+8
        SUBS     R0,R0,#+2
        LDR.W    R1,??DataTable9_5
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable9_1
        LDR      R2,[R2, #+0]
        MLA      R0,R1,R0,R2
        LDR.W    R1,??DataTable9
        STR      R0,[R1, #+0]
//  412         num_segcluster=(next_cluster[p_segcluster]&0xFF000000)>>24;
        LDR.W    R0,??DataTable12_11
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable12_1
        LDR      R0,[R1, R0, LSL #+2]
        LSRS     R0,R0,#+24
        LDR.W    R1,??DataTable12_7
        STRB     R0,[R1, #+0]
//  413         p_cluster=0;
        LDR.W    R0,??DataTable12_10
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
        B.N      ??writeram_sd_6
//  414       }
//  415      else
//  416       {
//  417         p_datasector++;
??writeram_sd_5:
        LDR.W    R0,??DataTable9
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable9
        STR      R0,[R1, #+0]
        B.N      ??writeram_sd_6
//  418       }
//  419    }
//  420   else
//  421    {
//  422      p_datasector++;
??writeram_sd_4:
        LDR.W    R0,??DataTable9
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable9
        STR      R0,[R1, #+0]
//  423    }
//  424 }
??writeram_sd_6:
        POP      {R4,PC}          ;; return
//  425 /*********************************************************/
//  426 //function:write_ram
//  427 //description:Ð´×Ö½ÚÊý¾Ýµ½ramº¯Êý£¨Ö÷º¯ÊýÓëfat32ÎÄ¼þÏµÍ³º¯ÊýµÄ½Ó¿Ú£©
//  428 //ÐÞ¸Ä£º Sword
//  429 /***********************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  430 void writebyte_ram(byte_sd wdata)
//  431 {
writebyte_ram:
        PUSH     {R7,LR}
//  432   
//  433   if(cnt_cluster<cluster_number)
        LDR.W    R1,??DataTable12_4
        LDRH     R1,[R1, #+0]
        LDR.W    R2,??DataTable12_12
        LDRH     R2,[R2, #+0]
        CMP      R1,R2
        BCS.N    ??writebyte_ram_0
//  434    {
//  435 #ifdef EN_SDbuf
//  436      pBuf_Now[ram_number]=wdata;
        LDR.W    R1,??DataTable12_3
        LDRH     R1,[R1, #+0]
        LDR.N    R2,??DataTable7_2
        LDR      R2,[R2, #+0]
        STRB     R0,[R1, R2]
//  437 #else
//  438      DBUF[ram_number]=wdata;
//  439 #endif     
//  440      ram_number++;
        LDR.W    R0,??DataTable12_3
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable12_3
        STRH     R0,[R1, #+0]
//  441      if(ram_number==512) 
        LDR.W    R0,??DataTable12_3
        LDRH     R0,[R0, #+0]
        MOV      R1,#+512
        CMP      R0,R1
        BNE.N    ??writebyte_ram_0
//  442       {
//  443         ram_number=0;
        LDR.W    R0,??DataTable12_3
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  444         writeram_sd();
        BL       writeram_sd
//  445       }
//  446    }
//  447 }
??writebyte_ram_0:
        POP      {R0,PC}          ;; return
//  448 /*********************************************************/
//  449 //function:write_stop
//  450 //description:Ð´SD¿¨½áÊø£¬Íê³ÉºóÐø¹¤×÷£¬¼´Ð´FAT±íÓë¸ùÄ¿Â¼
//  451 //ÐÞ¸Ä£º Sword
//  452 /*********************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  453 void write_stop(void)
//  454 {
write_stop:
        PUSH     {R7,LR}
//  455   if(cnt_cluster==0&&p_sector==0&&ram_number==0) 
        LDR.W    R0,??DataTable12_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable12_5
        LDRH     R1,[R1, #+0]
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable12_3
        LDRH     R1,[R1, #+0]
        ORRS     R0,R1,R0
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BEQ.N    ??write_stop_0
//  456   {
//  457     return; //Èç¹ûÃ»ÓÐÐ´¹ýÊý¾Ý,Ôò²»Ð´fat±íºÍ¸ùÄ¿Â¼
//  458   }
//  459    
//  460    if(ram_number!=0) writeram_sd(); 
??write_stop_1:
        LDR.W    R0,??DataTable12_3
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_stop_2
        BL       writeram_sd
//  461  //°Ñ×îºó²»¹»Ò»¸öÍêÕûÉÈÇøµÄÊý¾ÝÐ´Èë
//  462  
//  463 #ifdef EN_SDbuf
//  464    SD_ClrBuf();
??write_stop_2:
        BL       SD_ClrBuf
//  465 #endif
//  466    
//  467    write_dir();
        BL       write_dir
//  468    write_fat(); 
        BL       write_fat
//  469 
//  470    Wait_SDRdy(SD_LONG_Wait);   //µÈ´ý×îºóÒ»¸öÉÈÇøÊý¾ÝÐ´ÈëSD¿¨
        LDR.N    R0,??DataTable7_6  ;; 0x1e8480
        BL       Wait_SDRdy
//  471 
//  472    CloseSD();//¹Ø±ÕSD¿¨  
        BL       CloseSD
//  473 }
??write_stop_0:
        POP      {R0,PC}          ;; return
//  474 
//  475 /*
//  476 º¯ÊýÃû³Æ£ºsearch_addr_sd
//  477 º¯Êý¹¦ÄÜ£ºÑ°ÕÒsd¿¨Æô¶¯ÉÈÇø,¸ùÄ¿Â¼,Êý¾ÝÉÈÇø,fat1ºÍfat2µÄÊ×µØÖ·
//  478 ±à Ð´ Õß£ºSword
//  479 */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  480 void search_addr_sd(void)
//  481 {
search_addr_sd:
        PUSH     {R3-R5,LR}
//  482   word_sd  retry;
//  483   byte_sd  r1,flag_yes=1;
        MOVS     R4,#+1
//  484   
//  485   retry=0;
        MOVS     R5,#+0
//  486   do
//  487    {  //¶ÁÈ¡µÚ0ÎïÀíÉÈÇøÄÚÈÝ
//  488      r1=sd_readsingleblock(DBUF,0);
??search_addr_sd_0:
        MOVS     R1,#+0
        LDR.W    R0,??DataTable12
        BL       sd_readsingleblock
//  489      C_WDOG();
        CPSID i         
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+42498
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+46208
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??search_addr_sd_1
        CPSIE i         
//  490      retry++;
??search_addr_sd_1:
        ADDS     R5,R5,#+1
//  491    } while(r1!=0x00&&retry<100);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??search_addr_sd_2
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+100
        BCC.N    ??search_addr_sd_0
//  492  
//  493   if(retry>=100) 
??search_addr_sd_2:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+100
        BCC.N    ??search_addr_sd_3
//  494    {
//  495      flag_err_sd=SDERR_ReadOverTime;
        LDR.W    R0,??DataTable12_13
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  496      flag_yes=0; //³¬Ê±³ö´í
        MOVS     R4,#+0
//  497    }
//  498      
//  499   if(DBUF[0]!=0xeb||DBUF[1]!=0x58||DBUF[2]!=0x90)   
??search_addr_sd_3:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+235
        BNE.N    ??search_addr_sd_4
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+1]
        CMP      R0,#+88
        BNE.N    ??search_addr_sd_4
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+2]
        CMP      R0,#+144
        BEQ.N    ??search_addr_sd_5
//  500  //Í¨¹ýµÚ0ÎïÀíÉÈÇøµÄÇ°3×Ö½ÚÊÇ·ñÊÇÌø×ªÖ¸ÁîÀ´ÅÐ¶¨ÊÇ²»ÊÇÆô¶¯ÉÈÇø    
//  501    {
//  502      add_sta=DBUF[454]+((dword_sd)DBUF[455]<<8)+((dword_sd)DBUF[456]<<16)+((dword_sd)DBUF[457]<<24);
??search_addr_sd_4:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+454]
        LDR.W    R1,??DataTable12
        LDRB     R1,[R1, #+455]
        LSLS     R1,R1,#+8
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable12
        LDRB     R1,[R1, #+456]
        ADDS     R0,R0,R1, LSL #+16
        LDR.W    R1,??DataTable12
        LDRB     R1,[R1, #+457]
        ADDS     R0,R0,R1, LSL #+24
        LDR.W    R1,??DataTable12_14
        STR      R0,[R1, #+0]
//  503   //Èç¹ûÎïÀíµÄµÚ0ÉÈÇø²»ÊÇÆô¶¯ÉÈÇø,ÔòÓÉµÚ454-457byte_sdÀ´¼ÆËãÆô¶¯ÉÈÇøµÄÆ«ÒÆÁ¿   
//  504      retry=0;   
        MOVS     R5,#+0
//  505      do
//  506       {  //¶ÁÈ¡Æô¶¯ÉÈÇøÄÚÈÝ
//  507         r1=sd_readsingleblock(DBUF,add_sta);
??search_addr_sd_6:
        LDR.W    R0,??DataTable12_14
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable12
        BL       sd_readsingleblock
//  508         C_WDOG();
        CPSID i         
        LDR.N    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+42498
        STRH     R2,[R1, #+0]
        LDR.N    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+46208
        STRH     R2,[R1, #+0]
        LDR.N    R1,??DataTable9_3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??search_addr_sd_7
        CPSIE i         
//  509         retry++;
??search_addr_sd_7:
        ADDS     R5,R5,#+1
//  510       } while(r1!=0x00&&retry<100);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??search_addr_sd_8
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+100
        BCC.N    ??search_addr_sd_6
//  511      
//  512      if(retry>=100) 
??search_addr_sd_8:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+100
        BCC.N    ??search_addr_sd_9
//  513       {
//  514         flag_err_sd=SDERR_ReadOverTime;
        LDR.W    R0,??DataTable12_13
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  515         flag_yes=0; //³¬Ê±³ö´í
        MOVS     R4,#+0
        B.N      ??search_addr_sd_10
//  516       }
//  517      else if(DBUF[0]!=0xeb||DBUF[1]!=0x58||DBUF[2]!=0x90)
??search_addr_sd_9:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+235
        BNE.N    ??search_addr_sd_11
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+1]
        CMP      R0,#+88
        BNE.N    ??search_addr_sd_11
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+2]
        CMP      R0,#+144
        BEQ.N    ??search_addr_sd_10
//  518       {
//  519         flag_err_sd=SDERR_StartSector;
??search_addr_sd_11:
        LDR.W    R0,??DataTable12_13
        MOVS     R1,#+4
        STRB     R1,[R0, #+0]
//  520         flag_yes=0; //Æô¶¯ÉÈÇø³ö´í
        MOVS     R4,#+0
        B.N      ??search_addr_sd_10
//  521       }
//  522    }
//  523   else
//  524    {
//  525      add_sta=0;
??search_addr_sd_5:
        LDR.W    R0,??DataTable12_14
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  526    }
//  527   
//  528   sector_cluster=DBUF[13];    //¶ÁÈ¡Ã¿´Ø¶ÔÓ¦µÄÉÈÇøÊý
??search_addr_sd_10:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+13]
        LDR.N    R1,??DataTable9_5
        STRB     R0,[R1, #+0]
//  529   sector_sta=DBUF[14]+((dword_sd)DBUF[15]<<8);   //¼ÆËãÆô¶¯ÉÈÇøÊý
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+14]
        LDR.W    R1,??DataTable12
        LDRB     R1,[R1, #+15]
        LSLS     R1,R1,#+8
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable12_15
        STR      R0,[R1, #+0]
//  530   sector_fat=DBUF[36]+((dword_sd)DBUF[37]<<8)+((dword_sd)DBUF[38]<<16)+((dword_sd)DBUF[39]<<24);
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+36]
        LDR.W    R1,??DataTable12
        LDRB     R1,[R1, #+37]
        LSLS     R1,R1,#+8
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable12
        LDRB     R1,[R1, #+38]
        ADDS     R0,R0,R1, LSL #+16
        LDR.W    R1,??DataTable12
        LDRB     R1,[R1, #+39]
        ADDS     R0,R0,R1, LSL #+24
        LDR.W    R1,??DataTable12_16
        STR      R0,[R1, #+0]
//  531  //¼ÆËãfat±íËùÕ¼µÄÉÈÇøÊý 
//  532     
//  533  //¼ÆËã¸ùÄ¿Â¼,Êý¾ÝÉÈÇø,fat1ºÍfat2µÄÊ×µØÖ· 
//  534   add_f1=add_sta+sector_sta;
        LDR.W    R0,??DataTable12_14
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable12_15
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable12_9
        STR      R0,[R1, #+0]
//  535   add_f2=add_f1+sector_fat;
        LDR.W    R0,??DataTable12_9
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable12_16
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable12_8
        STR      R0,[R1, #+0]
//  536   add_dir=add_f2+sector_fat;
        LDR.W    R0,??DataTable12_8
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable12_16
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable9_1
        STR      R0,[R1, #+0]
//  537   
//  538   if(flag_yes==0) CloseSD();
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??search_addr_sd_12
        BL       CloseSD
//  539 }
??search_addr_sd_12:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     Flag_SDRdy

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     Stat_SDbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     pBuf_Now

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     pBuf_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     Sector_SDbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     Cnt_SDbufS4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     0x1e8480

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     Cnt_SDbufS5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     Cnt_SDbufS1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_9:
        DC32     Cnt_SDbufS3
//  540 /*
//  541 º¯ÊýÃû³Æ£ºsearch_fat
//  542 º¯Êý¹¦ÄÜ£ºËÑÑ°fat±í,ÕÒµ½×ã¹»¶àµÄ¿ÕÏÐÉÈÇø
//  543 ±à Ð´ Õß£ºSword
//  544 */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  545 void search_fat(void)
//  546 {
search_fat:
        PUSH     {R4-R10,LR}
//  547   byte_sd retry,r1,num,flag,flag_over=0;
        MOVS     R4,#+0
//  548   dword_sd i,j,k;   
//  549   
//  550   for(i=k=num=flag=0,j=12;i<10000;i++,j=0)
        MOVS     R6,#+0
        MOVS     R5,R6
        MOV      R8,R6
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        MOV      R7,R8
        MOVS     R9,#+12
        B.N      ??search_fat_0
??search_fat_1:
        ADDS     R8,R8,#+1
        MOVS     R9,#+0
??search_fat_0:
        MOVW     R0,#+10000
        CMP      R8,R0
        BCS.W    ??search_fat_2
//  551    {    //×î¶àÑ°ÕÒ10000¸öÉÈÇø
//  552 //10000¸öÉÈÇø¶ÔÓ¦Ô¼1280000¸ö´Ø,°´Ò»´Ø4KËã,ÔòÎª5GµÄ¿Õ¼ä
//  553      retry=0;
        MOVS     R10,#+0
//  554      do
//  555       {
//  556         r1=sd_readsingleblock(DBUF,add_f1+i);
??search_fat_3:
        LDR.W    R0,??DataTable12_9
        LDR      R0,[R0, #+0]
        ADDS     R1,R8,R0
        LDR.N    R0,??DataTable12
        BL       sd_readsingleblock
//  557         C_WDOG();
        CPSID i         
        LDR.N    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+42498
        STRH     R2,[R1, #+0]
        LDR.N    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+46208
        STRH     R2,[R1, #+0]
        LDR.N    R1,??DataTable9_3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??search_fat_4
        CPSIE i         
//  558         retry++;
??search_fat_4:
        ADDS     R10,R10,#+1
//  559       } while(r1!=0x00&&retry<100);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??search_fat_5
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+100
        BCC.N    ??search_fat_3
//  560      
//  561      if(retry>=100) 
??search_fat_5:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+100
        BCC.N    ??search_fat_6
//  562       {
//  563         flag_err_sd=SDERR_ReadOverTime;
        LDR.N    R0,??DataTable12_13
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  564         break; //³¬Ê±³ö´í
        B.N      ??search_fat_2
//  565       }
//  566      for(;j<512;j+=4)
??search_fat_7:
        ADDS     R9,R9,#+4
??search_fat_6:
        MOV      R0,#+512
        CMP      R9,R0
        BCS.N    ??search_fat_8
//  567       {
//  568         if(DBUF[j]==0x00&&DBUF[j+1]==0x00&&DBUF[j+2]==0x00&&DBUF[j+3]==0x00) 
        LDR.N    R0,??DataTable12
        LDRB     R0,[R9, R0]
        CMP      R0,#+0
        BNE.N    ??search_fat_9
        LDR.N    R0,??DataTable12
        ADDS     R0,R9,R0
        LDRB     R0,[R0, #+1]
        CMP      R0,#+0
        BNE.N    ??search_fat_9
        LDR.N    R0,??DataTable12
        ADDS     R0,R9,R0
        LDRB     R0,[R0, #+2]
        CMP      R0,#+0
        BNE.N    ??search_fat_9
        LDR.N    R0,??DataTable12
        ADDS     R0,R9,R0
        LDRB     R0,[R0, #+3]
        CMP      R0,#+0
        BNE.N    ??search_fat_9
//  569          {       //±ê¼Ç¿ÉÓÃ´Ø
//  570            if(flag==0)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??search_fat_10
//  571             {         //Ò»¶Î¿ÉÓÃ´ØµÄµÚÒ»¸ö
//  572               next_cluster[k]=((i<<7)+(j>>2));
        LSRS     R0,R9,#+2
        ADDS     R0,R0,R8, LSL #+7
        LDR.N    R1,??DataTable12_1
        STR      R0,[R1, R7, LSL #+2]
//  573               num=flag=1;
        MOVS     R6,#+1
        MOVS     R5,R6
        B.N      ??search_fat_11
//  574             }
//  575            else
//  576             {     //¼ÇÂ¼¸Ã¶Î´ØµÄ¸öÊý
//  577               num++;
??search_fat_10:
        ADDS     R6,R6,#+1
//  578               if(num==250)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+250
        BNE.N    ??search_fat_11
//  579                {       //·ÀÖ¹Ò»¶Î´ØÌ«³¤±äÁ¿Òç³ö
//  580                  next_cluster[k]|=(((dword_sd)num)<<24L);
        LDR.N    R0,??DataTable12_1
        LDR      R0,[R0, R7, LSL #+2]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ORRS     R0,R0,R6, LSL #+24
        LDR.N    R1,??DataTable12_1
        STR      R0,[R1, R7, LSL #+2]
//  581                  k++;flag=0;
        ADDS     R7,R7,#+1
        MOVS     R5,#+0
//  582                }
//  583             }
//  584            cluster_number++; 
??search_fat_11:
        LDR.N    R0,??DataTable12_12
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable12_12
        STRH     R0,[R1, #+0]
        B.N      ??search_fat_12
//  585          }
//  586         else
//  587          {
//  588            if(flag==1)
??search_fat_9:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??search_fat_13
//  589             {       //½«Ö¸ÕëÖ¸ÏòÏÂÒ»×é´Ø
//  590               next_cluster[k]|=(((dword_sd)num)<<24L);
        LDR.N    R0,??DataTable12_1
        LDR      R0,[R0, R7, LSL #+2]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ORRS     R0,R0,R6, LSL #+24
        LDR.N    R1,??DataTable12_1
        STR      R0,[R1, R7, LSL #+2]
//  591               k++;
        ADDS     R7,R7,#+1
//  592             }
//  593            flag=0;
??search_fat_13:
        MOVS     R5,#+0
//  594          }
//  595         if(cluster_number==SD_MAX_cluster||k==SD_MAX_segment) 
??search_fat_12:
        LDR.N    R0,??DataTable12_12
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+2950
        CMP      R0,R1
        BEQ.N    ??search_fat_14
        CMP      R7,#+140
        BNE.N    ??search_fat_7
//  596          {  //ÒÑÕÒµ½×ã¹»¶àµÄ¿ÉÓÃ´Ø»òÊý×é´æÂú
//  597            if(cluster_number==SD_MAX_cluster)
??search_fat_14:
        LDR.N    R0,??DataTable12_12
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+2950
        CMP      R0,R1
        BNE.N    ??search_fat_15
//  598             {
//  599               next_cluster[k]|=(((dword_sd)num)<<24L);
        LDR.N    R0,??DataTable12_1
        LDR      R0,[R0, R7, LSL #+2]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ORRS     R0,R0,R6, LSL #+24
        LDR.N    R1,??DataTable12_1
        STR      R0,[R1, R7, LSL #+2]
//  600             }
//  601            flag_over=1;
??search_fat_15:
        MOVS     R4,#+1
//  602            break;
//  603          } 
//  604       }
//  605      
//  606      if(flag_over) break; 
??search_fat_8:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.W    ??search_fat_1
//  607    }
//  608   if(cluster_number<SD_MAX_cluster) 
??search_fat_2:
        LDR.N    R0,??DataTable12_12
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+2950
        CMP      R0,R1
        BCS.N    ??search_fat_16
//  609    {
//  610      if(flag_err_sd!=SDERR_ReadOverTime)
        LDR.N    R0,??DataTable12_13
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BEQ.N    ??search_fat_17
//  611        flag_err_sd=SDERR_NoCluster;
        LDR.N    R0,??DataTable12_13
        MOVS     R1,#+5
        STRB     R1,[R0, #+0]
//  612      if(cluster_number==0||flag_err_sd==SDERR_ReadOverTime)
??search_fat_17:
        LDR.N    R0,??DataTable12_12
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??search_fat_18
        LDR.N    R0,??DataTable12_13
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE.N    ??search_fat_16
//  613       { //Èç¹û´ØÊý²»¹»µ«²¢²»ÊÇÒ»¸ö´Ø¶¼Ã»ÕÒµ½µÄ»°Ôò¼ÌÐøÐ´¿¨
//  614         CloseSD(); //Ã»ÓÐÕÒµ½ÓÐÓÃ´Ø»ò¶ÁÈ¡³¬Ê±Ôò¹Ø±ÕSPI 
??search_fat_18:
        BL       CloseSD
//  615       }
//  616    }
//  617 }
??search_fat_16:
        POP      {R4-R10,PC}      ;; return
//  618 /*
//  619 º¯ÊýÃû³Æ£ºfat32_init
//  620 º¯Êý¹¦ÄÜ£ºfat32ÎÄ¼þÏµÍ³µÄ³õÊ¼»¯
//  621 ±à Ð´ Õß£ºSword
//  622 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  623 void fat32_init(void)
//  624 {
fat32_init:
        PUSH     {R7,LR}
//  625   search_addr_sd();
        BL       search_addr_sd
//  626   if(sd_yes)
        LDR.N    R0,??DataTable12_17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??fat32_init_0
//  627    {
//  628      SetSD_High();
        BL       SetSD_High
//  629      search_fat(); 
        BL       search_fat
//  630   
//  631      if(sd_yes==1)
        LDR.N    R0,??DataTable12_17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??fat32_init_0
//  632       {
//  633         p_datasector=add_dir+((dword_sd)((next_cluster[0]&0x00FFFFFF)-2))*sector_cluster; 
        LDR.N    R0,??DataTable9_1
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable12_1
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+8        ;; ZeroExtS R1,R1,#+8,#+8
        LSRS     R1,R1,#+8
        SUBS     R1,R1,#+2
        LDR.N    R2,??DataTable9_5
        LDRB     R2,[R2, #+0]
        MLA      R0,R2,R1,R0
        LDR.N    R1,??DataTable9
        STR      R0,[R1, #+0]
//  634       //×¢Òâ,Êý¾ÝÇøÊÇ´ÓµÚ¶þ´Ø¿ªÊ¼µÄ,ËùÒÔÒª¼õ2  
//  635         p_sector=0;
        LDR.N    R0,??DataTable12_5
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  636         ram_number=cnt_cluster=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable12_4
        STRH     R0,[R1, #+0]
        LDR.N    R1,??DataTable12_3
        STRH     R0,[R1, #+0]
//  637         p_segcluster=p_cluster=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable12_10
        STRB     R0,[R1, #+0]
        LDR.N    R1,??DataTable12_11
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STRH     R0,[R1, #+0]
//  638         num_segcluster=(next_cluster[0]&0xFF000000)>>24;
        LDR.N    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+24
        LDR.N    R1,??DataTable12_7
        STRB     R0,[R1, #+0]
//  639       }
//  640    }
//  641 }
??fat32_init_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     p_datasector

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     add_dir

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     0x4005200c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     sd_initover

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     dir_sd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     sector_cluster
//  642 /*
//  643 º¯ÊýÃû³Æ£ºSD_System_Init
//  644 º¯Êý¹¦ÄÜ£ºSD¿¨¼´Õû¸öÎÄ¼þÏµÍ³µÄ³õÊ¼»¯
//  645           (Ö÷º¯ÊýÖÐÖ±½Óµ÷ÓÃ¸Ãº¯Êý¾Í¿ÉÍê³É¶ÔSD¿¨È«²¿µÄ³õÊ¼»¯¹¤×÷)
//  646 ±à Ð´ Õß£ºSword
//  647 */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  648 void SD_System_Init(void)
//  649 {
SD_System_Init:
        PUSH     {R4,LR}
//  650   byte_sd retry=10;
        MOVS     R4,#+10
//  651 
//  652   sd_yes=1;      //Ä¬ÈÏSD¿¨ÒÑ¾ÍÐ÷,Èç¹û³öÎÊÌâ,ºóÃæÖ´ÐÐCloseSD()Ê±»áÇåÁã¸Ã±äÁ¿
        LDR.N    R0,??DataTable12_17
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  653   Flag_SDRdy=1;  //½«SD¿¨µÄ×´Ì¬±ê¼ÇÎª¿ÉÓÃ
        LDR.N    R0,??DataTable12_18
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  654   flag_err_sd=SD_Normal;
        LDR.N    R0,??DataTable12_13
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  655   SD_driver_Init();
        BL       SD_driver_Init
//  656   SetSD_Low();
        BL       SetSD_Low
        B.N      ??SD_System_Init_0
//  657   while(sd_init()&&retry!=0) 
//  658    {
//  659      retry--;
??SD_System_Init_1:
        SUBS     R4,R4,#+1
//  660      C_WDOG();
        CPSID i         
        LDR.N    R0,??DataTable12_19  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable12_19  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable12_20
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SD_System_Init_0
        CPSIE i         
//  661    }
??SD_System_Init_0:
        BL       sd_init
        CMP      R0,#+0
        BEQ.N    ??SD_System_Init_2
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??SD_System_Init_1
//  662 
//  663   if(retry==0)         //Èç¹ûsd¿¨³õÊ¼»¯³¬Ê±²»³É¹¦£¬Ôò¹Ø±Õspi 
??SD_System_Init_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??SD_System_Init_3
//  664    {
//  665      CloseSD();
        BL       CloseSD
        B.N      ??SD_System_Init_4
//  666    }
//  667   else          
//  668    {
//  669      flag_err_sd=SD_Normal;
??SD_System_Init_3:
        LDR.N    R0,??DataTable12_13
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  670      fat32_init(); //ÎÄ¼þÏµÍ³µÄ³õÊ¼»¯
        BL       fat32_init
//  671      
//  672    #ifdef EN_SDbuf   //³õÊ¼»¯µÚ¶þ»º´æ
//  673    #ifdef EN_Cnt_SDbuf  
//  674      Cnt_SDbufS1=0;
        LDR.N    R0,??DataTable12_21
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  675      Cnt_SDbufS2=0;
        LDR.N    R0,??DataTable11
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  676      Cnt_SDbufS3=0;
        LDR.N    R0,??DataTable12_22
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  677      Cnt_SDbufS4=0;
        LDR.N    R0,??DataTable12_23
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  678      Cnt_SDbufS5=0;
        LDR.N    R0,??DataTable12_24
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  679    #endif
//  680      Stat_SDbuf=0;
        LDR.N    R0,??DataTable12_25
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  681      pBuf_Now=DBUF; //Éè¶¨»º´æÖ¸ÕëµÄ³õÊ¼Öµ
        LDR.N    R0,??DataTable12_26
        LDR.N    R1,??DataTable12
        STR      R1,[R0, #+0]
//  682      pBuf_2=DBUF2;
        LDR.N    R0,??DataTable12_27
        LDR.N    R1,??DataTable12_28
        STR      R1,[R0, #+0]
//  683    #endif
//  684    }
//  685   
//  686   sd_initover = 1;
??SD_System_Init_4:
        LDR.N    R0,??DataTable12_20
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  687 }
        POP      {R4,PC}          ;; return
//  688 /*
//  689 º¯ÊýÃû³Æ£ºSD_System_Init_Ext
//  690 º¯Êý¹¦ÄÜ£ºÀ©Õ¹°æµÄSD¿¨ÏµÍ³³õÊ¼»¯º¯Êý
//  691           (ÔÊÐíÔÚ³õÊ¼»¯Ê±Ô¤ÏÈÐ´Èë²¿·ÖÊý¾Ý)
//  692 Èë¿Ú²ÎÊý£ºpbuf:³õÊ¼Êý¾ÝÖ¸Õë
//  693          len:Êý¾Ý³¤¶È
//  694 ±à Ð´ Õß£ºSword
//  695 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  696 void SD_System_Init_Ext(byte_sd * pbuf , word_sd len)
//  697 {
SD_System_Init_Ext:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  698 	word_sd i;
//  699 	
//  700 	SD_System_Init();
        BL       SD_System_Init
//  701 	
//  702 	if(sd_yes != 0)
        LDR.N    R0,??DataTable12_17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SD_System_Init_Ext_0
//  703 	{
//  704 		sd_initover = 0;
        LDR.N    R0,??DataTable12_20
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  705 		
//  706 		for(i=0;i<len;i++)
        MOVS     R6,#+0
        B.N      ??SD_System_Init_Ext_1
//  707 		{
//  708 			writebyte_ram(*pbuf++);
??SD_System_Init_Ext_2:
        LDRB     R0,[R4, #+0]
        BL       writebyte_ram
        ADDS     R4,R4,#+1
//  709 		}
        ADDS     R6,R6,#+1
??SD_System_Init_Ext_1:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R6,R5
        BCC.N    ??SD_System_Init_Ext_2
//  710 		
//  711 		sd_initover = 1;
        LDR.N    R0,??DataTable12_20
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  712 	}
//  713 }
??SD_System_Init_Ext_0:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     Cnt_SDbufS2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     file_name
//  714 /*
//  715 º¯ÊýÃû³Æ£ºtest_sd
//  716 º¯Êý¹¦ÄÜ£º²âÊÔSD¿¨
//  717 ±à Ð´ Õß£ºSword
//  718 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  719 void test_sd(void)
//  720 {
test_sd:
        PUSH     {R4,LR}
        SUB      SP,SP,#+56
//  721   byte_sd const str[]="If you see these words, you SD and hardware is OK!";
        ADD      R0,SP,#+0
        LDR.N    R1,??DataTable12_29
        MOVS     R2,#+51
        BL       __aeabi_memcpy4
//  722   word_sd i;
//  723   if(sd_yes)
        LDR.N    R0,??DataTable12_17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??test_sd_0
//  724    { 
//  725      file_name[0]='T';
        LDR.N    R0,??DataTable12_30
        MOVS     R1,#+84
        STRB     R1,[R0, #+0]
//  726      file_name[1]='E';
        LDR.N    R0,??DataTable12_30
        MOVS     R1,#+69
        STRB     R1,[R0, #+1]
//  727      file_name[2]='S';
        LDR.N    R0,??DataTable12_30
        MOVS     R1,#+83
        STRB     R1,[R0, #+2]
//  728      file_name[3]='T';
        LDR.N    R0,??DataTable12_30
        MOVS     R1,#+84
        STRB     R1,[R0, #+3]
//  729      file_name[4]='-';
        LDR.N    R0,??DataTable12_30
        MOVS     R1,#+45
        STRB     R1,[R0, #+4]
//  730      
//  731      for(i=0;str[i]!='\0';i++)
        MOVS     R4,#+0
        B.N      ??test_sd_1
//  732        writebyte_ram(str[i]);
??test_sd_2:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        ADD      R0,SP,#+0
        LDRB     R0,[R4, R0]
        BL       writebyte_ram
        ADDS     R4,R4,#+1
??test_sd_1:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        ADD      R0,SP,#+0
        LDRB     R0,[R4, R0]
        CMP      R0,#+0
        BNE.N    ??test_sd_2
//  733             
//  734      write_stop();
        BL       write_stop
//  735    }
//  736 }
??test_sd_0:
        ADD      SP,SP,#+56
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     DBUF

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     next_cluster

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     file_property

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     ram_number

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     cnt_cluster

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     p_sector

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     file_size

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_7:
        DC32     num_segcluster

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_8:
        DC32     add_f2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_9:
        DC32     add_f1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_10:
        DC32     p_cluster

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_11:
        DC32     p_segcluster

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_12:
        DC32     cluster_number

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_13:
        DC32     flag_err_sd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_14:
        DC32     add_sta

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_15:
        DC32     sector_sta

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_16:
        DC32     sector_fat

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_17:
        DC32     sd_yes

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_18:
        DC32     Flag_SDRdy

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_19:
        DC32     0x4005200c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_20:
        DC32     sd_initover

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_21:
        DC32     Cnt_SDbufS1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_22:
        DC32     Cnt_SDbufS3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_23:
        DC32     Cnt_SDbufS4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_24:
        DC32     Cnt_SDbufS5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_25:
        DC32     Stat_SDbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_26:
        DC32     pBuf_Now

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_27:
        DC32     pBuf_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_28:
        DC32     DBUF2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_29:
        DC32     `?<Constant "If you see these word...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_30:
        DC32     file_name

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  737 
//  738 #endif
// 
// 1 652 bytes in section .bss
//    12 bytes in section .data
//   100 bytes in section .rodata
// 3 940 bytes in section .text
// 
// 3 940 bytes of CODE  memory
//   100 bytes of CONST memory
// 1 664 bytes of DATA  memory
//
//Errors: none
//Warnings: 1
