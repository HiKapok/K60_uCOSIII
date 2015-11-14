#ifndef _EXTRAFUNCTION_H_
#define _EXTRAFUNCTION_H_

#include "../../uCOS_III/CortexM4/os_cpu_def.h"
#include "../Platform/Platform.h"
#include "../Common_Def.h"

/**************************常数定义**************************/
#define NUM_BuzzerQ   6    /*蜂鸣器控制缓冲队列的大小*/

/**************************数据类型定义**************************/
typedef struct tagBuzzerData_t            /*蜂鸣器控制的数据类型*/
{
  INT16U Tim_All;                         /*响声持续的总时间*/
  INT16U Tim_Total;                       /*一个循环的总时间*/
  INT8U  Tim_On1;                         /*第一周期内开启的时间*/
  INT8U  Tim_Off1;                        /*第一周期内关闭的时间*/
  INT8U  Tim_On2;                         /*第二周期内开启的时间*/
  INT8U  Tim_Off2;                        /*第二周期内关闭的时间*/
} BuzzerData_t;

/**************************接口函数声明**************************/
extern void SDCard_MainTask(void);
extern void OLED_MainTask(void);
extern void LED_MainTask(void);
extern void Buzzer_MainTask(void);
extern void BuzzerSet(INT16U tim_all,INT8U tim_on1,INT8U tim_off1,INT8U tim_on2,INT8U tim_off2);
extern void ExtInit_Normal(void);
extern void Process_BuzzerCtrl(void);

#endif
