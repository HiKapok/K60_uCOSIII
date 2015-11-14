/******************************************************************************

* LEDCtl_Ext.h

* LEDCtl_Ext.c中的函数与变量进行申明,并定义必要的常量与数据类型

******************************************************************************/

#ifndef __LED_CTL_EXT_H_
#define __LED_CTL_EXT_H_

#include "../../uCOS_III/CortexM4/os_cpu_def.h"

typedef enum tagLEDColor
{
  LEDColorStart = 0,
  Green = 0,
  Red,
  White,
  LEDColorEnd
}LEDColor;

extern void LED_Init(void);

extern INT8U LedCtlSet(LEDColor id,
                INT16U tim_all,
                INT8U tim_on1,
                INT8U tim_off1,
                INT8U tim_on2,
                INT8U tim_off2
               );
extern void LED_CtlProc(void);

#endif
