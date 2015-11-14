#include "./KinetisConfig.h"

/* 声明中断向量表 */
extern K_int32u_t __RAM_Vector__[]; 

/************************************************************************************************ 
* EnableInt_Kinetis
* 开启某中断
* 入口参数: irq 中断标号(注意不是向量表中的向量号,是向量号-16)
* 返回参数: 设定结果,设定成功返回NOERR_Kinetis
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
* 设定中断优先级
* 入口参数: irq  中断标号(注意不是向量表中的向量号,是向量号-16)
*           prio 中断优先级(取值0-15,值越小优先级越高)
* 返回参数: 设定结果,设定成功返回NOERR_Kinetis
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
* 禁用某中断
* 入口参数: irq 中断标号(注意不是向量表中的向量号,是向量号-16)
* 返回参数: 设定结果,设定成功返回NOERR_Kinetis
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
* 将Kinetis设置在Stop模式
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
* 将Kinetis设置在Wait模式
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
* Kinetis的空操作函数
************************************************************************************************/
void NullFun_Kinetis(void)
{ /* 进入空函数, 直接使车复位 */
  UNLOCK_WatchDog;       /* 解锁开门狗 */
	
  WDOG_PRESC = 0;        /* 设置时钟分频数为1 */
	
  WDOG_TOVALH = 0x000E;  /* 设置溢出周期 */
  WDOG_TOVALL = 0xA600;
	
  WDOG_STCTRLH = 0x4003; /* 关闭TestMode和WindowMode,选择时钟为总线时钟,并使能开门狗 */
  
  WDOG_UNLOCK = 0xC520;
  
  for(;;) ;
}
