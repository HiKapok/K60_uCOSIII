/******************************************************************************

* HardwareOperation.h

* �������PWM����PWMȫ�ֱ���
  ��������ģ��Ĳ������ʼ������
  
* ���ߣ� ���Ľ�  (����������ͷ)

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