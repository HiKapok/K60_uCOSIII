#ifndef _KINETIS_VECTORS_H_
#define _KINETIS_VECTORS_H_

/* 定义向量表的默认值,若要将其改为自己的中断服务函数,可在KinetisConfig.h中进行设置 */
/*        Address         Vector         Source module                     Source description                    */
#define VECTOR_002    NullFun_Kinetis  // 0x0000_0008 2 -          ARM core        Non-maskable Interrupt (NMI)
#define VECTOR_003    NullFun_Kinetis  // 0x0000_000C 3 -          ARM core        Hard Fault
#define VECTOR_004    NullFun_Kinetis  // 0x0000_0010 4 -
#define VECTOR_005    NullFun_Kinetis  // 0x0000_0014 5 -          ARM core         Bus Fault
#define VECTOR_006    NullFun_Kinetis  // 0x0000_0018 6 -          ARM core         Usage Fault
#define VECTOR_007    NullFun_Kinetis  // 0x0000_001C 7 -                           
#define VECTOR_008    NullFun_Kinetis  // 0x0000_0020 8 -                           
#define VECTOR_009    NullFun_Kinetis  // 0x0000_0024 9 -
#define VECTOR_010    NullFun_Kinetis  // 0x0000_0028 10 -
#define VECTOR_011    NullFun_Kinetis  // 0x0000_002C 11 -         ARM core         Supervisor call (SVCall)
#define VECTOR_012    NullFun_Kinetis  // 0x0000_0030 12 -         ARM core         Debug Monitor
#define VECTOR_013    NullFun_Kinetis  // 0x0000_0034 13 -                          
#define VECTOR_014    NullFun_Kinetis  // 0x0000_0038 14 -         ARM core         Pendable request for system service (PendableSrvReq)
#define VECTOR_015    NullFun_Kinetis  // 0x0000_003C 15 -         ARM core         System tick timer (SysTick)
#define VECTOR_016    NullFun_Kinetis  // 0x0000_0040 16     0     DMA              DMA Channel 0 transfer complete
#define VECTOR_017    NullFun_Kinetis  // 0x0000_0044 17     1     DMA              DMA Channel 1 transfer complete
#define VECTOR_018    NullFun_Kinetis  // 0x0000_0048 18     2     DMA              DMA Channel 2 transfer complete
#define VECTOR_019    NullFun_Kinetis  // 0x0000_004C 19     3     DMA              DMA Channel 3 transfer complete
#define VECTOR_020    NullFun_Kinetis  // 0x0000_0050 20     4     DMA              DMA Channel 4 transfer complete
#define VECTOR_021    NullFun_Kinetis  // 0x0000_0054 21     5     DMA              DMA Channel 5 transfer complete
#define VECTOR_022    NullFun_Kinetis  // 0x0000_0058 22     6     DMA              DMA Channel 6 transfer complete
#define VECTOR_023    NullFun_Kinetis  // 0x0000_005C 23     7     DMA              DMA Channel 7 transfer complete
#define VECTOR_024    NullFun_Kinetis  // 0x0000_0060 24     8     DMA              DMA Channel 8 transfer complete
#define VECTOR_025    NullFun_Kinetis  // 0x0000_0064 25     9     DMA              DMA Channel 9 transfer complete
#define VECTOR_026    NullFun_Kinetis  // 0x0000_0068 26    10     DMA              DMA Channel 10 transfer complete
#define VECTOR_027    NullFun_Kinetis  // 0x0000_006C 27    11     DMA              DMA Channel 11 transfer complete
#define VECTOR_028    NullFun_Kinetis  // 0x0000_0070 28    12     DMA              DMA Channel 12 transfer complete
#define VECTOR_029    NullFun_Kinetis  // 0x0000_0074 29    13     DMA              DMA Channel 13 transfer complete
#define VECTOR_030    NullFun_Kinetis  // 0x0000_0078 30    14     DMA              DMA Channel 14 transfer complete
#define VECTOR_031    NullFun_Kinetis  // 0x0000_007C 31    15     DMA              DMA Channel 15 transfer complete
#define VECTOR_032    NullFun_Kinetis  // 0x0000_0080 32    16     DMA              DMA Error Interrupt Channels 0-15
#define VECTOR_033    NullFun_Kinetis  // 0x0000_0084 33    17     MCM              Normal interrupt
#define VECTOR_034    NullFun_Kinetis  // 0x0000_0088 34    18     Flash memory     Command Complete
#define VECTOR_035    NullFun_Kinetis  // 0x0000_008C 35    19     Flash memory     Read Collision
#define VECTOR_036    NullFun_Kinetis  // 0x0000_0090 36    20     Mode Controller  Low Voltage Detect,Low Voltage Warning, Low Leakage Wakeup
#define VECTOR_037    NullFun_Kinetis  // 0x0000_0094 37    21     LLWU
#define VECTOR_038    NullFun_Kinetis  // 0x0000_0098 38    22     WDOG
#define VECTOR_039    NullFun_Kinetis  // 0x0000_009C 39    23		 RNGB
#define VECTOR_040    NullFun_Kinetis  // 0x0000_00A0 40    24     I2C0
#define VECTOR_041    NullFun_Kinetis  // 0x0000_00A4 41    25     I2C1
#define VECTOR_042    NullFun_Kinetis  // 0x0000_00A8 42    26     SPI0             Single interrupt vector for all sources
#define VECTOR_043    NullFun_Kinetis  // 0x0000_00AC 43    27     SPI1             Single interrupt vector for all sources
#define VECTOR_044    NullFun_Kinetis  // 0x0000_00B0 44    28     SPI2             Single interrupt vector for all sources
#define VECTOR_045    NullFun_Kinetis  // 0x0000_00B4 45    29     CAN0             OR'ed Message buffer (0-15)
#define VECTOR_046    NullFun_Kinetis  // 0x0000_00B8 46    30     CAN0             Bus Off
#define VECTOR_047    NullFun_Kinetis  // 0x0000_00BC 47    31     CAN0             Error
#define VECTOR_048    NullFun_Kinetis  // 0x0000_00C0 48    32     CAN0             Transmit Warning
#define VECTOR_049    NullFun_Kinetis  // 0x0000_00C4 49    33     CAN0             Receive Warning
#define VECTOR_050    NullFun_Kinetis  // 0x0000_00C8 50    34     CAN0             Wake Up
#define VECTOR_051    NullFun_Kinetis  // 0x0000_00CC 51    35     CAN0             Individual Matching Elements Update (IMEU)
#define VECTOR_052    NullFun_Kinetis  // 0x0000_00D0 52    36     CAN0             Lost receive
#define VECTOR_053    NullFun_Kinetis  // 0x0000_00D4 53    37     CAN1             OR'ed Message buffer (0-15)
#define VECTOR_054    NullFun_Kinetis  // 0x0000_00D8 54    38     CAN1             Bus off
#define VECTOR_055    NullFun_Kinetis  // 0x0000_00DC 55    39     CAN1             Error
#define VECTOR_056    NullFun_Kinetis  // 0x0000_00E0 56    40     CAN1             Transmit Warning
#define VECTOR_057    NullFun_Kinetis  // 0x0000_00E4 57    41     CAN1             Receive Warning
#define VECTOR_058    NullFun_Kinetis  // 0x0000_00E8 58    42     CAN1             Wake Up
#define VECTOR_059    NullFun_Kinetis  // 0x0000_00EC 59    43     CAN1             Individual Matching Elements Update (IMEU)
#define VECTOR_060    NullFun_Kinetis  // 0x0000_00F0 60    44     CAN1             Lost receive 
#define VECTOR_061    NullFun_Kinetis  // 0x0000_00F4 61    45     UART0            Single interrupt vector for UART status sources
#define VECTOR_062    NullFun_Kinetis  // 0x0000_00F8 62    46     UART0            Single interrupt vector for UART error sources
#define VECTOR_063    NullFun_Kinetis  // 0x0000_00FC 63    47     UART1            Single interrupt vector for UART status sources
#define VECTOR_064    NullFun_Kinetis  // 0x0000_0100 64    48     UART1            Single interrupt vector for UART error sources
#define VECTOR_065    NullFun_Kinetis  // 0x0000_0104 65    49     UART2            Single interrupt vector for UART status sources
#define VECTOR_066    NullFun_Kinetis  // 0x0000_0108 66    50     UART2            Single interrupt vector for UART error sources
#define VECTOR_067    NullFun_Kinetis  // 0x0000_010C 67    51     UART3            Single interrupt vector for UART status sources
#define VECTOR_068    NullFun_Kinetis  // 0x0000_0110 68    52     UART3            Single interrupt vector for UART error sources
#define VECTOR_069    NullFun_Kinetis  // 0x0000_0114 69    53     UART4            Single interrupt vector for UART status sources
#define VECTOR_070    NullFun_Kinetis  // 0x0000_0118 70    54     UART4            Single interrupt vector for UART error sources
#define VECTOR_071    NullFun_Kinetis  // 0x0000_011C 71    55     UART5            Single interrupt vector for UART status sources
#define VECTOR_072    NullFun_Kinetis  // 0x0000_0120 72    56     UART5            Single interrupt vector for UART error sources
#define VECTOR_073    NullFun_Kinetis  // 0x0000_0124 73    57     ADC0
#define VECTOR_074    NullFun_Kinetis  // 0x0000_0128 74    58     ADC1
#define VECTOR_075    NullFun_Kinetis  // 0x0000_012C 75    59     CMP0             High-speed comparator 
#define VECTOR_076    NullFun_Kinetis  // 0x0000_0130 76    60     CMP1
#define VECTOR_077    NullFun_Kinetis  // 0x0000_0134 77    61     CMP2
#define VECTOR_078    NullFun_Kinetis  // 0x0000_0138 78    62     FTM0 			 Single interrupt vector for all sources
#define VECTOR_079    NullFun_Kinetis  // 0x0000_013C 79    63     FTM1 			 Single interrupt vector for all sources
#define VECTOR_080    NullFun_Kinetis  // 0x0000_0140 80    64     FTM2 			 Single interrupt vector for all sources
#define VECTOR_081    NullFun_Kinetis  // 0x0000_0144 81    65     CMT
#define VECTOR_082    NullFun_Kinetis  // 0x0000_0148 82    66     RTC Timer interrupt
#define VECTOR_083    NullFun_Kinetis  // 0x0000_014C 83    67
#define VECTOR_084    NullFun_Kinetis  // 0x0000_0150 84    68     PIT Channel 0
#define VECTOR_085    NullFun_Kinetis  // 0x0000_0154 85    69     PIT Channel 1
#define VECTOR_086    NullFun_Kinetis  // 0x0000_0158 86    70     PIT Channel 2
#define VECTOR_087    NullFun_Kinetis  // 0x0000_015C 87    71     PIT Channel 3
#define VECTOR_088    NullFun_Kinetis  // 0x0000_0160 88    72     PDB
#define VECTOR_089    NullFun_Kinetis  // 0x0000_0164 89    73     USB OTG
#define VECTOR_090    NullFun_Kinetis  // 0x0000_0168 90    74     USB Charger Detect
#define VECTOR_091    NullFun_Kinetis  // 0x0000_016C 91    75		 ENET			 IEEE 1588 Timer interrupt			 
#define VECTOR_092    NullFun_Kinetis  // 0x0000_0170 92    76		 ENET			 Transmit interrupt
#define VECTOR_093    NullFun_Kinetis  // 0x0000_0174 93    77		 ENET			 Receive interrupt
#define VECTOR_094    NullFun_Kinetis  // 0x0000_0178 94    78		 ENET			 Error and miscellaneous interrupt
#define VECTOR_095    NullFun_Kinetis  // 0x0000_017C 95    79     I2S
#define VECTOR_096    NullFun_Kinetis  // 0x0000_0180 96    80     SDHC
#define VECTOR_097    NullFun_Kinetis  // 0x0000_0184 97    81     DAC0
#define VECTOR_098    NullFun_Kinetis  // 0x0000_0188 98    82     DAC1
#define VECTOR_099    NullFun_Kinetis  // 0x0000_018C 99    83     TSI 			 Single interrupt vector for all sources
#define VECTOR_100    NullFun_Kinetis  // 0x0000_0190 100   84     MCG
#define VECTOR_101    NullFun_Kinetis  // 0x0000_0194 101   85     Low Power Timer
#define VECTOR_102    NullFun_Kinetis  // 0x0000_0198 102   86     Segment LCD 	 Single interrupt vector for all sources
#define VECTOR_103    NullFun_Kinetis  // 0x0000_019C 103   87     Port control module Pin Detect (Port A)
#define VECTOR_104    NullFun_Kinetis  // 0x0000_01A0 104   88     Port control module Pin Detect (Port B)
#define VECTOR_105    NullFun_Kinetis  // 0x0000_01A4 105   89     Port control module Pin Detect (Port C)
#define VECTOR_106    NullFun_Kinetis  // 0x0000_01A8 106   90     Port control module Pin Detect (Port D)
#define VECTOR_107    NullFun_Kinetis  // 0x0000_01AC 107   91     Port control module Pin Detect (Port E)
#define VECTOR_108    NullFun_Kinetis  // 0x0000_01B0 108   92    
#define VECTOR_109    NullFun_Kinetis  // 0x0000_01B4 109   93    
#define VECTOR_110    NullFun_Kinetis  // 0x0000_01B8 110   94    
#define VECTOR_111    NullFun_Kinetis  // 0x0000_01BC 111   95    
#define VECTOR_112    NullFun_Kinetis  // 0x0000_01C0 112   96    
#define VECTOR_113    NullFun_Kinetis  // 0x0000_01C4 113   97    
#define VECTOR_114    NullFun_Kinetis  // 0x0000_01C8 114   98    
#define VECTOR_115    NullFun_Kinetis  // 0x0000_01CC 115   99    
#define VECTOR_116    NullFun_Kinetis  // 0x0000_01D0 116   100
#define VECTOR_117    NullFun_Kinetis  // 0x0000_01D4 117   101
#define VECTOR_118    NullFun_Kinetis  // 0x0000_01D8 118   102
#define VECTOR_119    NullFun_Kinetis  // 0x0000_01DC 119   103

#endif
