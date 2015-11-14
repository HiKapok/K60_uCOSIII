/*
*********************************************************************************************************
* File      : OS_CPU_DEF.H
* Version   : V1.00.00
* By        : WCA
*
* For       : ARMv7M Cortex-M4
* Mode      : Thumb-2 ISA
* Toolchain : IAR EWARM
*********************************************************************************************************
*/

#ifndef  OS_CPU_DEF
#define  OS_CPU_DEF

#include "derivative.h"

/*
*********************************************************************************************************
*                                          STANDARD DEFINES
*********************************************************************************************************
*/

#define  DEF_NULL                 0


                                                                /* ----------------- BOOLEAN DEFINES ------------------ */
#define  DEF_FALSE                0u
#define  DEF_TRUE                 1u

#define  DEF_NO                   0u
#define  DEF_YES                  1u

#define  DEF_DISABLED             0u
#define  DEF_ENABLED              1u

#define  DEF_INACTIVE             0u
#define  DEF_ACTIVE               1u

#define  DEF_INVALID              0u
#define  DEF_VALID                1u

#define  DEF_OFF                  0u
#define  DEF_ON                   1u

#define  DEF_CLR                  0u
#define  DEF_SET                  1u

#define  DEF_FAIL                 0u
#define  DEF_OK                   1u



                                                                /* ------------------- BIT DEFINES -------------------- */
#define  DEF_BIT_NONE                                   0x00u

#define  DEF_BIT_00                                     0x01u
#define  DEF_BIT_01                                     0x02u
#define  DEF_BIT_02                                     0x04u
#define  DEF_BIT_03                                     0x08u
#define  DEF_BIT_04                                     0x10u
#define  DEF_BIT_05                                     0x20u
#define  DEF_BIT_06                                     0x40u
#define  DEF_BIT_07                                     0x80u

#define  DEF_BIT_08                                   0x0100u
#define  DEF_BIT_09                                   0x0200u
#define  DEF_BIT_10                                   0x0400u
#define  DEF_BIT_11                                   0x0800u
#define  DEF_BIT_12                                   0x1000u
#define  DEF_BIT_13                                   0x2000u
#define  DEF_BIT_14                                   0x4000u
#define  DEF_BIT_15                                   0x8000u

#define  DEF_BIT_16                               0x00010000u
#define  DEF_BIT_17                               0x00020000u
#define  DEF_BIT_18                               0x00040000u
#define  DEF_BIT_19                               0x00080000u
#define  DEF_BIT_20                               0x00100000u
#define  DEF_BIT_21                               0x00200000u
#define  DEF_BIT_22                               0x00400000u
#define  DEF_BIT_23                               0x00800000u

#define  DEF_BIT_24                               0x01000000u
#define  DEF_BIT_25                               0x02000000u
#define  DEF_BIT_26                               0x04000000u
#define  DEF_BIT_27                               0x08000000u
#define  DEF_BIT_28                               0x10000000u
#define  DEF_BIT_29                               0x20000000u
#define  DEF_BIT_30                               0x40000000u
#define  DEF_BIT_31                               0x80000000u
#define  DEF_BIT_32                       0x0000000100000000u
#define  DEF_BIT_33                       0x0000000200000000u
#define  DEF_BIT_34                       0x0000000400000000u
#define  DEF_BIT_35                       0x0000000800000000u
#define  DEF_BIT_36                       0x0000001000000000u
#define  DEF_BIT_37                       0x0000002000000000u
#define  DEF_BIT_38                       0x0000004000000000u
#define  DEF_BIT_39                       0x0000008000000000u

#define  DEF_BIT_40                       0x0000010000000000u
#define  DEF_BIT_41                       0x0000020000000000u
#define  DEF_BIT_42                       0x0000040000000000u
#define  DEF_BIT_43                       0x0000080000000000u
#define  DEF_BIT_44                       0x0000100000000000u
#define  DEF_BIT_45                       0x0000200000000000u
#define  DEF_BIT_46                       0x0000400000000000u
#define  DEF_BIT_47                       0x0000800000000000u

#define  DEF_BIT_48                       0x0001000000000000u
#define  DEF_BIT_49                       0x0002000000000000u
#define  DEF_BIT_50                       0x0004000000000000u
#define  DEF_BIT_51                       0x0008000000000000u
#define  DEF_BIT_52                       0x0010000000000000u
#define  DEF_BIT_53                       0x0020000000000000u
#define  DEF_BIT_54                       0x0040000000000000u
#define  DEF_BIT_55                       0x0080000000000000u

#define  DEF_BIT_56                       0x0100000000000000u
#define  DEF_BIT_57                       0x0200000000000000u
#define  DEF_BIT_58                       0x0400000000000000u
#define  DEF_BIT_59                       0x0800000000000000u
#define  DEF_BIT_60                       0x1000000000000000u
#define  DEF_BIT_61                       0x2000000000000000u
#define  DEF_BIT_62                       0x4000000000000000u
#define  DEF_BIT_63                       0x8000000000000000u

                                                                /* ------------------ ALIGN DEFINES ------------------- */
#define  DEF_ALIGN_MAX_NBR_OCTETS                       4096u


                                                                /* ------------------ OCTET DEFINES ------------------- */
#define  DEF_OCTET_NBR_BITS                                8u
#define  DEF_OCTET_MASK                                 0xFFu

#define  DEF_OCTET_TO_BIT_NBR_BITS                         3u
#define  DEF_OCTET_TO_BIT_SHIFT                          DEF_OCTET_TO_BIT_NBR_BITS
#define  DEF_OCTET_TO_BIT_MASK                          0x07u


#define  DEF_NIBBLE_NBR_BITS                               4u
#define  DEF_NIBBLE_MASK                                0x0Fu


                                                                /* --------------- NUMBER BASE DEFINES ---------------- */
#define  DEF_NBR_BASE_BIN                                  2u
#define  DEF_NBR_BASE_OCT                                  8u
#define  DEF_NBR_BASE_DEC                                 10u
#define  DEF_NBR_BASE_HEX                                 16u


                                                                /* ----------------- INTEGER DEFINES ------------------ */
#define  DEF_INT_08_NBR_BITS                               8u
#define  DEF_INT_08_MASK                                0xFFu

#define  DEF_INT_08U_MIN_VAL                               0u
#define  DEF_INT_08U_MAX_VAL                             255u

#define  DEF_INT_08S_MIN_VAL_ONES_CPL                  (-127)
#define  DEF_INT_08S_MAX_VAL_ONES_CPL                    127

#define  DEF_INT_08S_MIN_VAL                            (DEF_INT_08S_MIN_VAL_ONES_CPL - 1)
#define  DEF_INT_08S_MAX_VAL                             DEF_INT_08S_MAX_VAL_ONES_CPL

#define  DEF_INT_08U_NBR_DIG_MIN                           1u
#define  DEF_INT_08U_NBR_DIG_MAX                           3u

#define  DEF_INT_08S_NBR_DIG_MIN                           3u
#define  DEF_INT_08S_NBR_DIG_MAX                           3u



#define  DEF_INT_16_NBR_BITS                              16u
#define  DEF_INT_16_MASK                              0xFFFFu

#define  DEF_INT_16U_MIN_VAL                               0u
#define  DEF_INT_16U_MAX_VAL                           65535u

#define  DEF_INT_16S_MIN_VAL_ONES_CPL                (-32767)
#define  DEF_INT_16S_MAX_VAL_ONES_CPL                  32767

#define  DEF_INT_16S_MIN_VAL                            (DEF_INT_16S_MIN_VAL_ONES_CPL - 1)
#define  DEF_INT_16S_MAX_VAL                             DEF_INT_16S_MAX_VAL_ONES_CPL

#define  DEF_INT_16U_NBR_DIG_MIN                           1u
#define  DEF_INT_16U_NBR_DIG_MAX                           5u

#define  DEF_INT_16S_NBR_DIG_MIN                           5u
#define  DEF_INT_16S_NBR_DIG_MAX                           5u



#define  DEF_INT_32_NBR_BITS                              32u
#define  DEF_INT_32_MASK                          0xFFFFFFFFu

#define  DEF_INT_32U_MIN_VAL                               0u
#define  DEF_INT_32U_MAX_VAL                      4294967295u

#define  DEF_INT_32S_MIN_VAL_ONES_CPL           (-2147483647)
#define  DEF_INT_32S_MAX_VAL_ONES_CPL             2147483647

#define  DEF_INT_32S_MIN_VAL                            (DEF_INT_32S_MIN_VAL_ONES_CPL - 1)
#define  DEF_INT_32S_MAX_VAL                             DEF_INT_32S_MAX_VAL_ONES_CPL

#define  DEF_INT_32U_NBR_DIG_MIN                           1u
#define  DEF_INT_32U_NBR_DIG_MAX                          10u

#define  DEF_INT_32S_NBR_DIG_MIN                          10u
#define  DEF_INT_32S_NBR_DIG_MAX                          10u


#define  DEF_INT_64_NBR_BITS                              64u
#define  DEF_INT_64_MASK                  0xFFFFFFFFFFFFFFFFu

#define  DEF_INT_64U_MIN_VAL                               0u
#define  DEF_INT_64U_MAX_VAL            18446744073709551615u

#define  DEF_INT_64S_MIN_VAL_ONES_CPL  (-9223372036854775807)
#define  DEF_INT_64S_MAX_VAL_ONES_CPL    9223372036854775807

#define  DEF_INT_64S_MIN_VAL                            (DEF_INT_64S_MIN_VAL_ONES_CPL - 1)
#define  DEF_INT_64S_MAX_VAL                             DEF_INT_64S_MAX_VAL_ONES_CPL

#define  DEF_INT_64U_NBR_DIG_MIN                           1u
#define  DEF_INT_64U_NBR_DIG_MAX                          20u

#define  DEF_INT_64S_NBR_DIG_MIN                          19u
#define  DEF_INT_64S_NBR_DIG_MAX                          19u

#define  DEF_INT_CPU_MASK                                DEF_INT_32_MASK

#define  DEF_INT_CPU_U_MIN_VAL                           DEF_INT_32U_MIN_VAL
#define  DEF_INT_CPU_U_MAX_VAL                           DEF_INT_32U_MAX_VAL

#define  DEF_INT_CPU_S_MIN_VAL                           DEF_INT_32S_MIN_VAL
#define  DEF_INT_CPU_S_MAX_VAL                           DEF_INT_32S_MAX_VAL

#define  DEF_INT_CPU_S_MIN_VAL_ONES_CPL                  DEF_INT_32S_MIN_VAL_ONES_CPL
#define  DEF_INT_CPU_S_MAX_VAL_ONES_CPL                  DEF_INT_32S_MAX_VAL_ONES_CPL

/*
*********************************************************************************************************
*                                    CONFIGURE STANDARD DATA TYPES
*********************************************************************************************************
*/
typedef            void           CPU_VOID;
typedef            char           CPU_CHAR;                     /*  8-bit character                                     */
typedef  unsigned  char           CPU_BOOLEAN;                  /*  8-bit boolean or logical                            */
typedef  unsigned  char           CPU_INT08U;                   /*  8-bit unsigned integer                              */
typedef    signed  char           CPU_INT08S;                   /*  8-bit   signed integer                              */
typedef  unsigned  short          CPU_INT16U;                   /* 16-bit unsigned integer                              */
typedef    signed  short          CPU_INT16S;                   /* 16-bit   signed integer                              */
typedef  unsigned  int            CPU_INT32U;                   /* 32-bit unsigned integer                              */
typedef    signed  int            CPU_INT32S;                   /* 32-bit   signed integer                              */
typedef  unsigned  long  long     CPU_INT64U;                   /* 64-bit unsigned integer                              */
typedef    signed  long  long     CPU_INT64S;                   /* 64-bit   signed integer                              */

typedef            float          CPU_FP32;                     /* 32-bit floating point                                */
typedef            double         CPU_FP64;                     /* 64-bit floating point                                */

typedef  CPU_INT32U               CPU_STK;                      /* Defines CPU stack data type.                         */
typedef  CPU_INT32U               CPU_STK_SIZE;                 /* Defines CPU stack size data type.                    */

typedef  CPU_INT32U               CPU_TS;                       /* Req'd for backwards-compatibility.                   */

typedef  CPU_INT32U               CPU_SR;                       /* Defines   CPU status register size (see Note #3b).   */

                                                                /* CPU address type based on address bus size.          */
typedef  CPU_INT32U               CPU_ADDR;
                                                                /* CPU data    type based on data    bus size.          */
typedef  CPU_INT32U               CPU_DATA;

typedef  CPU_DATA                 CPU_ALIGN;                    /* Defines CPU data-word-alignment size.                */
typedef  CPU_ADDR                 CPU_SIZE_T;                   /* Defines CPU standard 'size_t'   size.                */

                                                                /* CPU ts tmr dflt size = 32-bits.                      */
typedef  CPU_INT32U               CPU_TS_TMR;


typedef  volatile  CPU_INT08U  CPU_REG08;                       /*  8-bit register                                      */
typedef  volatile  CPU_INT16U  CPU_REG16;                       /* 16-bit register                                      */
typedef  volatile  CPU_INT32U  CPU_REG32;                       /* 32-bit register                                      */
typedef  volatile  CPU_INT64U  CPU_REG64;                       /* 64-bit register                                      */

/***************************定义与平台无关的数据类型***************************/
typedef unsigned char  INT8U;     /*定义与平台无关的无符号8位数据类型*/
typedef signed char    INT8S;     /*定义与平台无关的有符号8位数据类型*/
typedef unsigned short INT16U;    /*定义与平台无关的无符号16位数据类型*/
typedef signed short   INT16S;    /*定义与平台无关的有符号16位数据类型*/
typedef unsigned long  INT32U;    /*定义与平台无关的无符号32位数据类型*/
typedef signed long    INT32S;    /*定义与平台无关的有符号32位数据类型*/

typedef float          FP32;      /*定义与平台无关的32位浮点数数据类型*/
typedef double         FP64;      /*定义与平台无关的64位浮点数数据类型*/

typedef unsigned char  byte;      /*定义字节型变量*/
typedef unsigned short word;      /*定义字型变量*/
typedef unsigned long  dword;     /*定义双字型变量*/


/*
*********************************************************************************************************
*                                            CPU REGISTERS
*********************************************************************************************************
*/

#define  CPU_REG_NVIC_NVIC           (*((CPU_REG32 *)(0xE000E004)))             /* Int Ctrl'er Type Reg.                */
#define  CPU_REG_NVIC_ST_CTRL        (*((CPU_REG32 *)(0xE000E010)))             /* SysTick Ctrl & Status Reg.           */
#define  CPU_REG_NVIC_ST_RELOAD      (*((CPU_REG32 *)(0xE000E014)))             /* SysTick Reload      Value Reg.       */
#define  CPU_REG_NVIC_ST_CURRENT     (*((CPU_REG32 *)(0xE000E018)))             /* SysTick Current     Value Reg.       */
#define  CPU_REG_NVIC_ST_CAL         (*((CPU_REG32 *)(0xE000E01C)))             /* SysTick Calibration Value Reg.       */

#define  CPU_REG_NVIC_SETEN(n)       (*((CPU_REG32 *)(0xE000E100 + (n) * 4u)))  /* IRQ Set En Reg.                      */
#define  CPU_REG_NVIC_CLREN(n)       (*((CPU_REG32 *)(0xE000E180 + (n) * 4u)))  /* IRQ Clr En Reg.                      */
#define  CPU_REG_NVIC_SETPEND(n)     (*((CPU_REG32 *)(0xE000E200 + (n) * 4u)))  /* IRQ Set Pending Reg.                 */
#define  CPU_REG_NVIC_CLRPEND(n)     (*((CPU_REG32 *)(0xE000E280 + (n) * 4u)))  /* IRQ Clr Pending Reg.                 */
#define  CPU_REG_NVIC_ACTIVE(n)      (*((CPU_REG32 *)(0xE000E300 + (n) * 4u)))  /* IRQ Active Reg.                      */
#define  CPU_REG_NVIC_PRIO(n)        (*((CPU_REG32 *)(0xE000E400 + (n) * 4u)))  /* IRQ Prio Reg.                        */

#define  CPU_REG_NVIC_CPUID          (*((CPU_REG32 *)(0xE000ED00)))             /* CPUID Base Reg.                      */
#define  CPU_REG_NVIC_ICSR           (*((CPU_REG32 *)(0xE000ED04)))             /* Int Ctrl State  Reg.                 */
#define  CPU_REG_NVIC_VTOR           (*((CPU_REG32 *)(0xE000ED08)))             /* Vect Tbl Offset Reg.                 */
#define  CPU_REG_NVIC_AIRCR          (*((CPU_REG32 *)(0xE000ED0C)))             /* App Int/Reset Ctrl Reg.              */
#define  CPU_REG_NVIC_SCR            (*((CPU_REG32 *)(0xE000ED10)))             /* System Ctrl Reg.                     */
#define  CPU_REG_NVIC_CCR            (*((CPU_REG32 *)(0xE000ED14)))             /* Cfg    Ctrl Reg.                     */
#define  CPU_REG_NVIC_SHPRI1         (*((CPU_REG32 *)(0xE000ED18)))             /* System Handlers  4 to  7 Prio.       */
#define  CPU_REG_NVIC_SHPRI2         (*((CPU_REG32 *)(0xE000ED1C)))             /* System Handlers  8 to 11 Prio.       */
#define  CPU_REG_NVIC_SHPRI3         (*((CPU_REG32 *)(0xE000ED20)))             /* System Handlers 12 to 15 Prio.       */
#define  CPU_REG_NVIC_SHCSR          (*((CPU_REG32 *)(0xE000ED24)))             /* System Handler Ctrl & State Reg.     */
#define  CPU_REG_NVIC_CFSR           (*((CPU_REG32 *)(0xE000ED28)))             /* Configurable Fault Status Reg.       */
#define  CPU_REG_NVIC_HFSR           (*((CPU_REG32 *)(0xE000ED2C)))             /* Hard  Fault Status Reg.              */
#define  CPU_REG_NVIC_DFSR           (*((CPU_REG32 *)(0xE000ED30)))             /* Debug Fault Status Reg.              */
#define  CPU_REG_NVIC_MMFAR          (*((CPU_REG32 *)(0xE000ED34)))             /* Mem Manage Addr Reg.                 */
#define  CPU_REG_NVIC_BFAR           (*((CPU_REG32 *)(0xE000ED38)))             /* Bus Fault  Addr Reg.                 */
#define  CPU_REG_NVIC_AFSR           (*((CPU_REG32 *)(0xE000ED3C)))             /* Aux Fault Status Reg.                */
#define  CPU_REG_NVIC_CPACR          (*((CPU_REG32 *)(0xE000ED88)))             /* Coprocessor Access Control Reg.      */

#define  CPU_REG_NVIC_PFR0           (*((CPU_REG32 *)(0xE000ED40)))             /* Processor Feature Reg 0.             */
#define  CPU_REG_NVIC_PFR1           (*((CPU_REG32 *)(0xE000ED44)))             /* Processor Feature Reg 1.             */
#define  CPU_REG_NVIC_DFR0           (*((CPU_REG32 *)(0xE000ED48)))             /* Debug     Feature Reg 0.             */
#define  CPU_REG_NVIC_AFR0           (*((CPU_REG32 *)(0xE000ED4C)))             /* Aux       Feature Reg 0.             */
#define  CPU_REG_NVIC_MMFR0          (*((CPU_REG32 *)(0xE000ED50)))             /* Memory Model Feature Reg 0.          */
#define  CPU_REG_NVIC_MMFR1          (*((CPU_REG32 *)(0xE000ED54)))             /* Memory Model Feature Reg 1.          */
#define  CPU_REG_NVIC_MMFR2          (*((CPU_REG32 *)(0xE000ED58)))             /* Memory Model Feature Reg 2.          */
#define  CPU_REG_NVIC_MMFR3          (*((CPU_REG32 *)(0xE000ED5C)))             /* Memory Model Feature Reg 3.          */
#define  CPU_REG_NVIC_ISAFR0         (*((CPU_REG32 *)(0xE000ED60)))             /* ISA Feature Reg 0.                   */
#define  CPU_REG_NVIC_ISAFR1         (*((CPU_REG32 *)(0xE000ED64)))             /* ISA Feature Reg 1.                   */
#define  CPU_REG_NVIC_ISAFR2         (*((CPU_REG32 *)(0xE000ED68)))             /* ISA Feature Reg 2.                   */
#define  CPU_REG_NVIC_ISAFR3         (*((CPU_REG32 *)(0xE000ED6C)))             /* ISA Feature Reg 3.                   */
#define  CPU_REG_NVIC_ISAFR4         (*((CPU_REG32 *)(0xE000ED70)))             /* ISA Feature Reg 4.                   */
#define  CPU_REG_NVIC_SW_TRIG        (*((CPU_REG32 *)(0xE000EF00)))             /* Software Trigger Int Reg.            */

#define  CPU_REG_MPU_TYPE            (*((CPU_REG32 *)(0xE000ED90)))             /* MPU Type Reg.                        */
#define  CPU_REG_MPU_CTRL            (*((CPU_REG32 *)(0xE000ED94)))             /* MPU Ctrl Reg.                        */
#define  CPU_REG_MPU_REG_NBR         (*((CPU_REG32 *)(0xE000ED98)))             /* MPU Region Nbr Reg.                  */
#define  CPU_REG_MPU_REG_BASE        (*((CPU_REG32 *)(0xE000ED9C)))             /* MPU Region Base Addr Reg.            */
#define  CPU_REG_MPU_REG_ATTR        (*((CPU_REG32 *)(0xE000EDA0)))             /* MPU Region Attrib & Size Reg.        */

#define  CPU_REG_DBG_CTRL            (*((CPU_REG32 *)(0xE000EDF0)))             /* Debug Halting Ctrl & Status Reg.     */
#define  CPU_REG_DBG_SELECT          (*((CPU_REG32 *)(0xE000EDF4)))             /* Debug Core Reg Selector Reg.         */
#define  CPU_REG_DBG_DATA            (*((CPU_REG32 *)(0xE000EDF8)))             /* Debug Core Reg Data     Reg.         */
#define  CPU_REG_DBG_INT             (*((CPU_REG32 *)(0xE000EDFC)))             /* Debug Except & Monitor Ctrl Reg.     */

#define  CPU_REG_SCB_FPCCR           (*((CPU_REG32 *)(0xE000EF34)))             /* Floating-Point Context Control Reg.  */
#define  CPU_REG_SCB_FPCAR           (*((CPU_REG32 *)(0xE000EF38)))             /* Floating-Point Context Address Reg.  */
#define  CPU_REG_SCB_FPDSCR          (*((CPU_REG32 *)(0xE000EF3C)))             /* FP Default Status Control Reg.       */

/*
*********************************************************************************************************
*                                          CPU REGISTER BITS
*********************************************************************************************************
*/

                                                                /* ---------- SYSTICK CTRL & STATUS REG BITS ---------- */
#define  CPU_REG_NVIC_ST_CTRL_COUNTFLAG           0x00010000
#define  CPU_REG_NVIC_ST_CTRL_CLKSOURCE           0x00000004
#define  CPU_REG_NVIC_ST_CTRL_TICKINT             0x00000002
#define  CPU_REG_NVIC_ST_CTRL_ENABLE              0x00000001


/*
*********************************************************************************************************
*                                               DEFINES
*********************************************************************************************************
*/

#define  CPU_CFG_STK_GROWTH       CPU_STK_GROWTH_HI_TO_LO       /* Defines CPU stack growth order (see Note #1).        */

#define  CPU_CFG_STK_ALIGN_BYTES  (8u)                          /* Defines CPU stack alignment in bytes. (see Note #2). */
                                                                /* --------------- CPU INTEGER DEFINES ---------------- */
#define  DEF_INT_CPU_NBR_BITS     (32u)

#define  CPU_CFG_TS_EN            DEF_ENABLED

#define  CPU_CFG_TS_TMR_EN        DEF_ENABLED

/*
*********************************************************************************************************
*                                               MACROS
*********************************************************************************************************
*/

                                                                        /* Save    CPU status word & disable interrupts.*/
#define  CPU_INT_DIS()         do { cpu_sr = CPU_SR_Save(); asm(" CPSID i"); } while (0)
#define  CPU_INT_EN()          do { CPU_SR_Restore(cpu_sr); } while (0) /* Restore CPU status word.                     */
                                                                        /* Allocates CPU status register word (see Note #3a).   */
#define  CPU_SR_ALLOC()        CPU_SR  cpu_sr = (CPU_SR)0
                                                                        /* Save    CPU status word & disable interrupts.*/
//#define  CPU_INT_DIS()         do { asm(" CPSID i"); } while (0)
//#define  CPU_INT_EN()          do { asm(" CPSIE i"); } while (0)        /* Restore CPU status word.                     */

#define  CPU_CRITICAL_ENTER()  do { CPU_INT_DIS(); } while (0)          /* Disable   interrupts.                        */
#define  CPU_CRITICAL_EXIT()   do { CPU_INT_EN();  } while (0)          /* Re-enable interrupts.                        */


#define  CPU_TYPE_CREATE(char_1, char_2, char_3, char_4)         (((CPU_INT32U)((CPU_INT08U)(char_1)) << (0u * 8u)) | \
                                                                 ((CPU_INT32U)((CPU_INT08U)(char_2)) << (1u * 8u)) | \
                                                                 ((CPU_INT32U)((CPU_INT08U)(char_3)) << (2u * 8u)) | \
                                                                 ((CPU_INT32U)((CPU_INT08U)(char_4)) << (3u * 8u)))


#define  DEF_BIT_FIELD(bit_field, bit_shift)                                 ((((bit_field) >= 32u) ? (DEF_INT_CPU_U_MAX_VAL)     \
                                                                                                                     : (DEF_BIT(bit_field) - 1uL)) \
                                                                                                                            << (bit_shift))

#define  DEF_BIT(bit)                                                         (1u << (bit))

#define  DEF_BIT_IS_SET_ANY(val, mask)               ((((val) & (mask)) ==  0u)     ? (DEF_NO ) : (DEF_YES))

#define  DEF_BIT_IS_SET(val, mask)                    (((((val) & (mask)) == (mask)) && \
                                                         ((mask)          !=  0u))    ? (DEF_YES) : (DEF_NO))


#define  DEF_BIT_MASK(bit_mask, bit_shift)                                     ((bit_mask) << (bit_shift))


/*
*********************************************************************************************************
*                                         FUNCTION PROTOTYPES
*********************************************************************************************************
*/

extern CPU_SR     CPU_SR_Save   (void);
extern void       CPU_SR_Restore(CPU_SR  cpu_sr);
extern CPU_DATA   CPU_CntLeadZeros(CPU_DATA  val);

#endif
