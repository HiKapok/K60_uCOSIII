/************************************************************************************
 
* KinetisConfig.h

* ��Kinetis�ײ������б�Ҫ�����ã�����һЩ�ӿں�����ȫ�ֱ�������������

* ��֧�ֵ�оƬ:   K10ϵ����K60ϵ��
* ��֧�ֵı�����: CodeWarrior 10.x or IAR 6.30

* !!! ע��: ���ļ��еĲ���������Ҫ�û���������,��������÷�ʽ��ע��������ϸ˵��  !!! 

* �õײ������ɱ������Զ����ɵ���������ͷ�˼�����ٷ����������޸Ķ��ɡ�

* ��Ȩ����: ɽ����ѧ���ܳ�������
* ����:     ���Ľ�       (����������ͷ)
* �ر���л: �ͳ�         (���Ľ�����ͷ)
* PS: �õײ��������ڼ��������ĳ�Ԫ�ϡ���ΰ��ļ�ʦ�ֵ�ָ�����������ɵģ����ڴ��ر���л��
*     ������ѧϰKinetis�����Ե�¼��ʦ�ֵĲ���http://blog.chinaaet.com/jihceng0622

* ����汾: V1.02 
* ����ʱ��: 2012-05-01

*************************************************************************************/
 
#ifndef _KINETIS_CONFIG_H_
#define _KINETIS_CONFIG_H_

/* ͷ�ļ����� */
#include "derivative.h"

/* �ж��������� */
/*
--------------------------------------------------------------------------------------------
ʾ��: 
         ��Ҫ����FTM0���жϷ�������Ӧ��������ʽ����
   #undef  VECTOR_078            // 78Ϊ���ж����������еı��
   #define VECTOR_078  Isr_FTM0  // Isr_FTM0Ϊ�жϷ�������
   extern  void Isr_FTM0(void);  // ��ײ����������������жϷ�����
  
        ͬʱ��Ӧ�ó����е���EnableInt_Kinetis(62); 
        ����62Ϊ���жϺ�,��ֵ = �������еı�� - 16
   ( !!! ע��:����EnableInt_Kinetis()��û�������ģ��ļĴ��� !!! )
--------------------------------------------------------------------------------------------
*/

#undef  VECTOR_084             /* PTI0�ж�(ϵͳʱ���ж�) */
#define VECTOR_084 PTI0_ISR
extern void PTI0_ISR(void);

#undef  VECTOR_104             /* PortB�ж�(�����½����ж�) */
#define VECTOR_104 PTB19_ISR
extern void PTB19_ISR(void);

#undef  VECTOR_105             /* PortC�ж�(��̫���ж�) */
#define VECTOR_105 PTC12_ISR
extern void PTC12_ISR(void);

#undef  VECTOR_107             /* PortE�ж�(�����ж�) */
#define VECTOR_107 Key_ISR
extern void Key_ISR(void);

#undef  VECTOR_014             /* PendSV�ж� */
#define VECTOR_014  OS_CPU_PendSVHandler
/* ����PendSV�ж�ISRָ�� */
extern void  OS_CPU_PendSVHandler(void);

#undef  VECTOR_015             /* SysTick�ж� */
#define VECTOR_015  OS_CPU_SysTickHandler
/* �����δ�ʱ���ж�ISRָ�� */
extern void  OS_CPU_SysTickHandler(void);

/* ��������(���ڼ�Ӧ��,���Խ����еĹ�������ȫ����Ϊ0) */
#define EN_CoreClkOut_Kinetis  0    /* CoreClock���ʹ��,=1��Ч(ʹ�ܺ�PTA6�����CoreClock/2) */
#define EN_FlexClkOut_Kinetis  0    /* FlexClock���ʹ��,=1��Ч(ʹ�ܺ�PTC3�����FlexClock)*/
#define EN_DisableInt_Kinetis  0    /* �����жϺ���ʹ��,=1��Ч(ʹ�ܺ���ܵ���DisableInt_Kinetis()����) */
#define EN_ResetType_Kinetis   0    /* ��ȡ��λ����ʹ��,=1��Ч(ʹ�ܺ��ͨ��ResetType_Kinetis�ж���λ����) */
#define EN_StopFun_Kinetis     0    /* Kinetis��STOPģʽʹ��,=1��Ч(���ܺ������Stop_Kinetis()����) */
#define EN_WaitFun_Kinetis     0    /* Kinetis��WAITģʽʹ��,=1��Ч(���ܺ������Wait_Kinetis()����) */
#define EN_CheckOpt_Kinetis    0    /* ����������ʹ��,=1��Ч(���κ�ɼӿ�ִ���ٶ�,����С������) */
#define EN_InitHook_Kinetis    0    /* �û���ʼ���ӿ�ʹ��,=1��Ч(ʹ�ܺ�����������������ӳ�ʼ���ӿ�) */



/* �ӿں������� */
#if EN_InitHook_Kinetis != 0
  #define HOOK_BeforeClk_Kinetis NullFun_Kinetis
/* �û��Զ���ĳ�ʼ������,��ϵͳʱ�ӳ�ʼ��֮ǰ��ִ��(����Ҫ����ΪNullFun_Kinetis) */
  #define HOOK_AfterClk_Kinetis  NullFun_Kinetis
/* �û��Զ���ĳ�ʼ������,��ϵͳʱ�ӳ�ʼ��֮��ִ��(����Ҫ����ΪNullFun_Kinetis) */
#endif



/* ϵͳʱ�Ӷ��� */
#define REF_CLK_Kinetis       24      /* �ⲿ��׼����(����)Ƶ��(��λMHz),ȡֵ2-50 */
#define CORE_CLK_Kinetis      120     /* �ں�ʱ��Ƶ��(��λMHz),ȡֵ48-128,����>100���ڳ�Ƶ���� */
#define DIV_BusClk_Kinetis    2       /* BusClock�ķ�Ƶ��(������ں�ʱ��),����ܳ���64M */
#define DIV_FlexClk_Kinetis   2       /* FlexBusclock�ķ�Ƶ��(������ں�ʱ��),����ܳ���64M */
#define DIV_FlashClk_Kinetis  4       /* Flashclock�ķ�Ƶ��(������ں�ʱ��),����ܳ���32M */
/*
--------------------------------------------------------------------------------------------
          ϵͳʱ������˵��: 
 (1)����Ƶ�����ں�ʱ�Ӷ�������2��������
 (2)���ں�ʱ�Ӵ���110Mʱ,��ȡֵ��Χ�Ӿ���Ƶ�ʶ���: 
      REF_CLK_Kinetis % 3 == 0 ʱ��  CORE_CLK_Kinetis ����Ϊ3��������
      REF_CLK_Kinetis % 4 == 0 ʱ��  CORE_CLK_Kinetis ����Ϊ4��������
      REF_CLK_Kinetis % 5 == 0 ʱ��  CORE_CLK_Kinetis ����Ϊ5��������
--------------------------------------------------------------------------------------------
*/


/* !!! ���²���ʹ���߲�Ҫ�޸� !!! */
#ifndef NULL
  #define NULL ((void *)0)
#endif
/* ARM Cortex M4 implementation for interrupt priority shift */
#define ARM_INTERRUPT_LEVEL_BITS          4
/* ������� */
#define NOERR_Kinetis         0x00    /* �޴��� */
#define ERR_IntNum_Kinetis    0x01    /* �ж������Ŵ��� */
#define ERR_IntPri_Kinetis    0x02    /* �ж����ȼ����� */
#define ERR_IntISR_Kinetis    0x04    /* �жϷ�������Ч */
/* ��λ���� */
#define RESET_SW_Kinetis      0x400   /* Software */
#define RESET_LOCKUP_Kinetis  0x200   /* Core Lock-up */
#define RESET_JTAG_Kinetis    0x100   /* JTAG generated reset */
#define RESET_POR_Kinetis     0x080   /* Power-on reset */
#define RESET_PIN_Kinetis     0x040   /* External reset pin */
#define RESET_COP_Kinetis     0x020   /* Watchdog */
#define RESET_LOC_Kinetis     0x004   /* Loss-of-clock */
#define RESET_LVD_Kinetis     0x002   /* Low-voltage detect reset */
#define RESET_WAKEUP_Kinetis  0x001   /* Low-leakage wakeup reset */



/* ����������Ͷ��� */
typedef unsigned char  K_int8u_t;     /* 8λ�޷����������� */
typedef signed   char  K_int8s_t;     /* 8λ�з����������� */
typedef unsigned short K_int16u_t;    /* 16λ�޷����������� */
typedef signed   short K_int16s_t;    /* 16λ�з����������� */
typedef unsigned long  K_int32u_t;    /* 32λ�޷����������� */
typedef signed   long  K_int32s_t;    /* 32λ�з����������� */

typedef void (* Ptr_VTOR_t)(void);    /* �ж��������ָ������ */

typedef K_int8u_t Kinetis_Error_t;    /* ���������������� */


 
/* ����ǳ�ʼ��������������ʽ */
#if   defined(COMPILER_CW)
  #pragma define_section dat_no_init ".sbss" far_abs RW
  #define KEEP_Data_Kinetis __declspec(dat_no_init)     /* ��KEEP_Data_Kinetis�����ı�����λ�󲻻ᱻ���� */
#elif defined(COMPILER_IAR)
  #define KEEP_Data_Kinetis __no_init                   /* ��KEEP_Data_Kinetis�����ı�����λ�󲻻ᱻ���� */
#endif


/* �������� */
#define EnableInterrupts  asm(" CPSIE i");                          /* �����ж� */
#define DisableInterrupts asm(" CPSID i");                          /* �����ж� */
#define UNLOCK_WatchDog   WDOG_UNLOCK = 0xC520;WDOG_UNLOCK = 0xD928 /* �������Ź� */



/* �������� */
#if EN_ResetType_Kinetis != 0
  extern KEEP_Data_Kinetis K_int16u_t  ResetType_Kinetis;   /* ��λ���� */
#endif

  

/* �������� */
extern Kinetis_Error_t EnableInt_Kinetis(K_int32u_t irq);
extern Kinetis_Error_t SetIntPri_Kinetis(K_int32u_t irq, K_int32u_t prio);
#if EN_DisableInt_Kinetis != 0
  extern Kinetis_Error_t DisableInt_Kinetis(K_int32u_t irq);
#endif
#if EN_StopFun_Kinetis != 0
  extern void Stop_Kinetis(void);
#endif
#if EN_WaitFun_Kinetis != 0
  extern void Wait_Kinetis(void);
#endif
extern void NullFun_Kinetis(void);

#endif

