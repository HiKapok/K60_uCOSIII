/******************************************************************************
* ZLG7290.h
******************************************************************************/
#ifndef __ZLG7290_H_
#define __ZLG7290_H_

#include "../Common_Def.h"
#include "../KinetisDrivers/KinetisConfig.h"
#include "../../uCOS_III/CortexM4/os_cpu_def.h"

typedef void (* ptrKeyCallBackFunc)(INT16U *);
extern ptrKeyCallBackFunc ptrKeyPadFunc;

#if EN_KeyPad != 0

/******************************************************************************
*                               硬件平台相关配置
******************************************************************************/

/* 单片机引脚与寄存器定义 */
#define  PT_SCL_7290        PTB_BASE_PTR
#define  PT_SDA_7290        PTB_BASE_PTR
#define  PORT_SCL_7290      PORTB_BASE_PTR
#define  PORT_SDA_7290      PORTB_BASE_PTR
#define  INDEX_SCL_7290     23
#define  INDEX_SDA_7290     17

/* 初始化操作定义 */
#define  INIT_SCL_7290()                                                      \
         ((PORT_SCL_7290)->PCR[INDEX_SCL_7290]) = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK
#define  INIT_SDA_7290()                                                      \
         ((PORT_SDA_7290)->PCR[INDEX_SDA_7290]) = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK

/* 数据操作定义 */
#define  SET_SCL_HIGH_7290() (PT_SCL_7290->PSOR |= (1<<INDEX_SCL_7290)) 
#define  SET_SCL_LOW_7290()  (PT_SCL_7290->PCOR |= (1<<INDEX_SCL_7290)) 

#define  SET_SDA_HIGH_7290() (PT_SDA_7290->PSOR |= (1<<INDEX_SDA_7290))
#define  SET_SDA_LOW_7290()  (PT_SDA_7290->PCOR |= (1<<INDEX_SDA_7290)) 
#define  READ_SDA_7290()     (PT_SDA_7290->PDIR & (1<<INDEX_SDA_7290))

/* 方向操作定义 */
#define  SET_SCL_OUT_7290()  (PT_SCL_7290->PDDR |= (1<<INDEX_SCL_7290))
#define  SET_SCL_IN_7290()   (PT_SCL_7290->PDDR &= ~(1<<INDEX_SCL_7290))

#define  SET_SDA_OUT_7290()  (PT_SDA_7290->PDDR |= (1<<INDEX_SDA_7290))
#define  SET_SDA_IN_7290()   (PT_SDA_7290->PDDR &= ~(1<<INDEX_SDA_7290))

/* 延时时间定义(CPU越快, 其数值越大) */
#define  SHORT_DELAY_TIME_7290     90   /* 短延时时间常数 */
#define  LONG_DELAY_TIME_7290      900  /* 长延时时间常数 */

/******************************************************************************
*                                   通用配置
******************************************************************************/
/* 地址与命令定义 */
#define  SLVADDR_7290          0x70      /* Zlg7290从机地址      */
#define  SUB_KEY_7290          0x01      /* 键码值寄存器子地址   */
#define  REPEAT_CNT_7290       0x02	 /* 连击次数寄存器       */
#define  SUB_FLASH_ONOFF_7290  0x0C      /* 闪烁寄存器子地址     */
#define  SUB_CMDBUF_7290       0x07      /* 命令寄存器地址       */

/******************************************************************************
*                                   函数声明
******************************************************************************/                  
/* 7290初始化 */
extern INT8U Key_Valid;
extern INT8U KeyPad_Mask;
extern INT16U Key_Value;
extern INT16U ExtKeyValue;
extern void KeyPad_Init(ptrKeyCallBackFunc func);
extern INT16U ZLG7290_ReadKeyValue();
#endif

#endif
