/******************************************************************************

* HardwareOperation.h

* 声明舵机PWM与电机PWM全局变量
  声明基本模块的操作与初始化函数
  
* 作者： 孙文健  (第六届摄像头)

******************************************************************************/

#ifndef _HARDWAREINTERFACE_H_
#define _HARDWAREINTERFACE_H_

#include "../../uCOS_III/CortexM4/os_cpu_def.h"
#include "../ZLG7290/ZLG7290.h"

extern ptrKeyCallBackFunc ptrExtKeyProc;
extern INT16U Boma;
extern INT16U ReadBomaValue(void);
extern void Enternet_Init(void);
extern void ExtKey_Init(void);

#endif