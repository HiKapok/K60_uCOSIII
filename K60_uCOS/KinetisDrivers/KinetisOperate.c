#include "./KinetisConfig.h"

/* �����ж������� */
extern K_int32u_t __RAM_Vector__[]; 

/************************************************************************************************ 
* EnableInt_Kinetis
* ����ĳ�ж�
* ��ڲ���: irq �жϱ��(ע�ⲻ���������е�������,��������-16)
* ���ز���: �趨���,�趨�ɹ�����NOERR_Kinetis
************************************************************************************************/
Kinetis_Error_t EnableInt_Kinetis(K_int32u_t irq)
{
  K_int32u_t div;

#if EN_CheckOpt_Kinetis != 0
  Kinetis_Error_t err = NOERR_Kinetis;
  
  if (irq > 91)
  {
    err |= ERR_IntNum_Kinetis;  
  }
  if(__RAM_Vector__[irq + 16] == (K_int32u_t)NullFun_Kinetis)
  {
    err |= ERR_IntISR_Kinetis;
  }
  
  if(err != NOERR_Kinetis)
  {
    return err;
  }
#endif

  /* Determine which of the NVICISERs corresponds to the irq */
  div = irq >> 5;

  if(div == 0)
  {
    NVICICPR0 = 1 << (irq & 0x1F);
    NVICISER0 = 1 << (irq & 0x1F);
  } 
  else if(div == 1)
  {
    NVICICPR1 = 1 << (irq & 0x1F);
    NVICISER1 = 1 << (irq & 0x1F);
  }
  else
  {
    NVICICPR2 = 1 << (irq & 0x1F);
    NVICISER2 = 1 << (irq & 0x1F);
  }   
  
  return NOERR_Kinetis;
}
/************************************************************************************************ 
* SetIntPri_Kinetis
* �趨�ж����ȼ�
* ��ڲ���: irq  �жϱ��(ע�ⲻ���������е�������,��������-16)
*           prio �ж����ȼ�(ȡֵ0-15,ֵԽС���ȼ�Խ��)
* ���ز���: �趨���,�趨�ɹ�����NOERR_Kinetis
************************************************************************************************/
Kinetis_Error_t SetIntPri_Kinetis(K_int32u_t irq, K_int32u_t prio)
{
  /*irq priority pointer*/
  K_int8u_t *prio_reg;

#if EN_CheckOpt_Kinetis != 0
  Kinetis_Error_t err = NOERR_Kinetis;
  
  if (irq > 91) 
  {
    err |= ERR_IntNum_Kinetis;  
  }
  if (prio > 15)
  {
    err |= ERR_IntPri_Kinetis;
  }
  if(__RAM_Vector__[irq + 16] == (K_int32u_t)NullFun_Kinetis)
  {
    err |= ERR_IntISR_Kinetis;
  }
  
  if(err != NOERR_Kinetis)
  {
    return err;
  }
#endif

  /* Determine which of the NVICIPx corresponds to the irq */
  prio_reg = (K_int8u_t *)(((K_int32u_t)&NVICIP0) + irq);
  /* Assign priority to IRQ */
  *prio_reg = ( (prio & 0x000F) << (8 - ARM_INTERRUPT_LEVEL_BITS) );   

  return NOERR_Kinetis;
}
#if EN_DisableInt_Kinetis != 0
/************************************************************************************************ 
* DisableInt_Kinetis
* ����ĳ�ж�
* ��ڲ���: irq �жϱ��(ע�ⲻ���������е�������,��������-16)
* ���ز���: �趨���,�趨�ɹ�����NOERR_Kinetis
************************************************************************************************/
Kinetis_Error_t DisableInt_Kinetis(K_int32u_t irq)
{
  K_int32u_t div;
    
#if EN_CheckOpt_Kinetis != 0
  Kinetis_Error_t err = NOERR_Kinetis;
    
  if (irq > 91)
  {
    err |= ERR_IntNum_Kinetis;  
  }
    
  if(err != NOERR_Kinetis)
  {
    return err;
  }
#endif

  /* Determine which of the NVICICERs corresponds to the irq */
  div = irq >> 5;

  if(div == 0)
  {
    NVICICER0 = 1 << (irq & 0x1F);
  }
  else if(div == 1)
  {
    NVICICER1 = 1 << (irq & 0x1F);
  }
  else
  {
    NVICICER2 = 1 << (irq & 0x1F);
  } 

  return NOERR_Kinetis;
}
#endif
#if EN_StopFun_Kinetis != 0
/************************************************************************************************ 
* Stop_Kinetis
* ��Kinetis������Stopģʽ
************************************************************************************************/
void Stop_Kinetis(void)
{
  /* Set the SLEEPDEEP bit to enable deep sleep mode (STOP) */
  SCB_SCR |= SCB_SCR_SLEEPDEEP_MASK;  

  /* WFI instruction will start entry into STOP mode */
  asm("WFI");
}
#endif
#if EN_WaitFun_Kinetis != 0
/************************************************************************************************ 
* Wait_Kinetis
* ��Kinetis������Waitģʽ
************************************************************************************************/
void Wait_Kinetis(void)
{
  /* 
   * Clear the SLEEPDEEP bit to make sure we go into WAIT (sleep) mode instead
   * of deep sleep.
   */
  SCB_SCR &= ~SCB_SCR_SLEEPDEEP_MASK;  

  /* WFI instruction will start entry into WAIT mode */
  asm("WFI");
}
#endif
/************************************************************************************************ 
* NullFun_Kinetis
* Kinetis�Ŀղ�������
************************************************************************************************/
void NullFun_Kinetis(void)
{ /* ����պ���, ֱ��ʹ����λ */
  UNLOCK_WatchDog;       /* �������Ź� */
	
  WDOG_PRESC = 0;        /* ����ʱ�ӷ�Ƶ��Ϊ1 */
	
  WDOG_TOVALH = 0x000E;  /* ����������� */
  WDOG_TOVALL = 0xA600;
	
  WDOG_STCTRLH = 0x4003; /* �ر�TestMode��WindowMode,ѡ��ʱ��Ϊ����ʱ��,��ʹ�ܿ��Ź� */
  
  WDOG_UNLOCK = 0xC520;
  
  for(;;) ;
}
