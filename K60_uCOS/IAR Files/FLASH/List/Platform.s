///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      03/Nov/2015  20:45:52 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\WangChangan\Desktop\K10С�嶨��\Platform\Platf /
//                    orm.c                                                   /
//    Command line =  C:\Users\WangChangan\Desktop\K10С�嶨��\Platform\Platf /
//                    orm.c -D COMPILER_IAR -lCN                              /
//                    "C:\Users\WangChangan\Desktop\K10С�嶨��\IAR           /
//                    Files\FLASH\List\" -lB "C:\Users\WangChangan\Desktop\K1 /
//                    0С�嶨��\IAR Files\FLASH\List\" -o                     /
//                    "C:\Users\WangChangan\Desktop\K10С�嶨��\IAR           /
//                    Files\FLASH\Obj\" --no_cse --no_unroll --no_inline      /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files\IAR Systems\Embedded Workbench 6.0    /
//                    Evaluation\arm\INC\c\DLib_Config_Normal.h" -I           /
//                    "C:\Users\WangChangan\Desktop\K10С�嶨��\IAR           /
//                    Files\..\Project_Headers\" -I                           /
//                    "C:\Users\WangChangan\Desktop\K10С�嶨��\IAR           /
//                    Files\..\KinetisDrivers\" -I                            /
//                    "C:\Users\WangChangan\Desktop\K10С�嶨��\IAR           /
//                    Files\..\ExtraFunction\" -I                             /
//                    "C:\Users\WangChangan\Desktop\K10С�嶨��\IAR           /
//                    Files\..\Hardware_Interface\" -I                        /
//                    "C:\Users\WangChangan\Desktop\K10С�嶨��\IAR           /
//                    Files\..\Make_Decision\" -I                             /
//                    "C:\Users\WangChangan\Desktop\K10С�嶨��\IAR           /
//                    Files\..\Math\" -I "C:\Users\WangChangan\Desktop\K10С� /
//                    嶨��\IAR Files\..\Original_Process\" -I                /
//                    "C:\Users\WangChangan\Desktop\K10С�嶨��\IAR           /
//                    Files\..\Platform\" -I "C:\Users\WangChangan\Desktop\K1 /
//                    0С�嶨��\IAR Files\..\SD_System\" -I                   /
//                    "C:\Users\WangChangan\Desktop\K10С�嶨��\IAR           /
//                    Files\..\Source\" -I "C:\Users\WangChangan\Desktop\K10� /
//                    ��嶨��\IAR Files\..\System_Init\" -Ol                  /
//    List file    =  C:\Users\WangChangan\Desktop\K10С�嶨��\IAR            /
//                    Files\FLASH\List\Platform.s                             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Platform

        #define SHT_PROGBITS 0x1

        EXTERN EnableInt_Kinetis
        EXTERN SetIntPri_Kinetis

        PUBLIC CPU_Init
        PUBLIC GPIO_Init
        PUBLIC IntTick_Init
        PUBLIC WatchDog_Init

// C:\Users\WangChangan\Desktop\K10С�嶨��\Platform\Platform.c
//    1 #include "./Platform.h"
//    2 
//    3 /************************************************************************************************ 
//    4 * Cpu_Init
//    5 * ��ʼ��CPU���������,������ʱ��,���״̬�Ĵ�����
//    6 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    7 void CPU_Init(void)
//    8 {   
//    9 	/* ���������еĳ�ʼ�������������������������,����Cpu_Init()������Ϊ�պ��� */
//   10 }
CPU_Init:
        BX       LR               ;; return
//   11 /************************************************************************************************ 
//   12 * WatchDog_Init
//   13 * ���Ź���ʼ��(���ｫ���Ź���ʱ���������������Ϊ16ms)
//   14   (�����������ʱ�����)
//   15 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   16 void WatchDog_Init(void)          
//   17 {    
//   18 #if EN_WatchDog != 0                
//   19   UNLOCK_WatchDog;       /* �������Ź� */
WatchDog_Init:
        LDR.N    R0,??DataTable2  ;; 0x4005200e
        MOVW     R1,#+50464
        STRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable2  ;; 0x4005200e
        MOVW     R1,#+55592
        STRH     R1,[R0, #+0]
//   20 	
//   21   WDOG_PRESC = 0;        /* ����ʱ�ӷ�Ƶ��Ϊ1 */
        LDR.N    R0,??DataTable2_1  ;; 0x40052016
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//   22 	
//   23   WDOG_TOVALH = 0x000E;  /* ����������� */
        LDR.N    R0,??DataTable2_2  ;; 0x40052004
        MOVS     R1,#+14
        STRH     R1,[R0, #+0]
//   24   WDOG_TOVALL = 0xA600;
        LDR.N    R0,??DataTable2_3  ;; 0x40052006
        MOV      R1,#+42496
        STRH     R1,[R0, #+0]
//   25 	
//   26   WDOG_STCTRLH = 0x4003; /* �ر�TestMode��WindowMode,ѡ��ʱ��Ϊ����ʱ��,��ʹ�ܿ��Ź� */
        LDR.N    R0,??DataTable2_4  ;; 0x40052000
        MOVW     R1,#+16387
        STRH     R1,[R0, #+0]
//   27 /*
//   28 ------------------------------------------------------------------------------------ 
//   29      !!! ��Ҫѡ��LPO��ʱ��,����Ƶ����ι�����ܳ�������  !!!
//   30               ��DataSheet��509ҳ��ʼ����ôһ�λ�"You must take care not only to refresh the 
//   31   watchdog within the watchdog timer's actual time-out period, but also provide 
//   32   enough allowance for the time it takes for the refresh sequence to be detected 
//   33   by the watchdog timer, on the watchdog clock."
//   34                ��Ȼû��ȫ������,���о��������ι��С��һ��watchdog clock�Ļ�Ӧ�û�����⣬��ʵ��
//   35      ��Ҳȷʵ���������Ƶ����⡣����һ��Ҫ�ѿ��Ź�ʱ������Ϊ����ʱ��.
//   36 ------------------------------------------------------------------------------------ 
//   37 */
//   38 	
//   39   C_WDOG_IntOff();
        LDR.N    R0,??DataTable2_5  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable2_5  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
//   40 #endif
//   41 }
        BX       LR               ;; return
//   42 /************************************************************************************************ 
//   43 * GPIO_Init
//   44 * GPIO�ڳ�ʼ������
//   45 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   46 void GPIO_Init(void)          
//   47 {
//   48   /* PTE25���Ʒ����� */  
//   49   PORTE_PCR25 = PORT_PCR_MUX(1);
GPIO_Init:
        LDR.N    R0,??DataTable2_6  ;; 0x4004d064
        MOV      R1,#+256
        STR      R1,[R0, #+0]
//   50   GPIOE_PDDR |= 0x02000000; 
        LDR.N    R0,??DataTable2_7  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable2_7  ;; 0x400ff114
        STR      R0,[R1, #+0]
//   51   OFF_Buzzer();
        LDR.N    R0,??DataTable2_8  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable2_8  ;; 0x400ff104
        STR      R0,[R1, #+0]
//   52   
//   53   /* PTB9��PTB16��PTB18��PTB20��boma���� */
//   54   PORTB_PCR9 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
        LDR.N    R0,??DataTable2_9  ;; 0x4004a024
        MOVW     R1,#+259
        STR      R1,[R0, #+0]
//   55   PORTB_PCR16 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
        LDR.N    R0,??DataTable2_10  ;; 0x4004a040
        MOVW     R1,#+259
        STR      R1,[R0, #+0]
//   56   PORTB_PCR18 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
        LDR.N    R0,??DataTable2_11  ;; 0x4004a048
        MOVW     R1,#+259
        STR      R1,[R0, #+0]
//   57   PORTB_PCR20 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
        LDR.N    R0,??DataTable2_12  ;; 0x4004a050
        MOVW     R1,#+259
        STR      R1,[R0, #+0]
//   58   GPIOB_PDDR &= ~0x00150200;                   
        LDR.N    R0,??DataTable2_13  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_14  ;; 0xffeafdff
        ANDS     R0,R1,R0
        LDR.N    R1,??DataTable2_13  ;; 0x400ff054
        STR      R0,[R1, #+0]
//   59 }
        BX       LR               ;; return
//   60 
//   61 /************************************************************************************************ 
//   62 * IntTick_Init
//   63 * ��ʼ��ϵͳʱ���ж�
//   64 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   65 void IntTick_Init(void)
//   66 {
IntTick_Init:
        PUSH     {R4,LR}
//   67   SIM_SCGC6 |= SIM_SCGC6_PIT_MASK;             /* ʹ��PIT��ʱ�� */
        LDR.N    R0,??DataTable2_15  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable2_15  ;; 0x4004803c
        STR      R0,[R1, #+0]
//   68 
//   69   (void)EnableInt_Kinetis(68);                 /* ������Ӧ���ж� */
        MOVS     R0,#+68
        BL       EnableInt_Kinetis
        MOVS     R4,R0
//   70   (void)SetIntPri_Kinetis(68,9);               /* �趨�жϵ����ȼ�Ϊ9,Ҫ������ͷ�жϵ� */
        MOVS     R1,#+9
        MOVS     R0,#+68
        BL       SetIntPri_Kinetis
//   71                                              /* !!! ע��ֵԽС���ȼ�Խ�� !!! */
//   72 
//   73   PIT_MCR = 0;                                 /* ����ʱ��,��DEBUGʱʹ��PIT */
        LDR.N    R1,??DataTable2_16  ;; 0x40037000
        MOVS     R2,#+0
        STR      R2,[R1, #+0]
//   74   PIT_LDVAL0 = System_Tick_ms * 1000L * System_Fbus; /* ������ֵ */      
        LDR.N    R1,??DataTable2_17  ;; 0x40037100
        LDR.N    R2,??DataTable2_18  ;; 0x927c0
        STR      R2,[R1, #+0]
//   75 
//   76   PIT_TCTRL0 = PIT_TCTRL_TIE_MASK;             /* ʹ��PIT�ж� */
        LDR.N    R1,??DataTable2_19  ;; 0x40037108
        MOVS     R2,#+2
        STR      R2,[R1, #+0]
//   77 
//   78   PIT_TCTRL0 |= PIT_TCTRL_TEN_MASK;            /* ���������� */
        LDR.N    R1,??DataTable2_19  ;; 0x40037108
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1
        LDR.N    R2,??DataTable2_19  ;; 0x40037108
        STR      R1,[R2, #+0]
//   79 }
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x4005200e

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x40052016

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x40052004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x40052006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x40052000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x4005200c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x4004d064

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x400ff114

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0x400ff104

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     0x4004a024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0x4004a040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     0x4004a048

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     0x4004a050

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     0x400ff054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     0xffeafdff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     0x40037000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC32     0x40037100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     0x927c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_19:
        DC32     0x40037108

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   80 
// 
// 284 bytes in section .text
// 
// 284 bytes of CODE memory
//
//Errors: none
//Warnings: none
