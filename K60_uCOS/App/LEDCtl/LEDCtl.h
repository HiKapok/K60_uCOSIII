/******************************************************************************

* LEDCtl.h

* LEDCtl.c中的函数与变量进行申明,并定义必要的常量与数据类型

******************************************************************************/

#ifndef __LED_CTL_H_
#define __LED_CTL_H_

#include "../Common_Def.h"
#include "./LEDCtl_Ext.h"

#if EN_LED != 0

#include "../KinetisDrivers/KinetisConfig.h"

#define NUM_LEDQueue  6    /*LED灯控制缓冲队列的大小,不能为0*/
#define LED_EnQueue(X)   do {++LEDQueue[X].Queue_Rear; LEDQueue[X].Queue_Rear = (LEDQueue[X].Queue_Rear)%NUM_LEDQueue;}while(0)
#define LED_DeQueue(X)   do {++LEDQueue[X].Queue_Head; LEDQueue[X].Queue_Head = (LEDQueue[X].Queue_Head)%NUM_LEDQueue;}while(0)

#define LED_PT_GREEN    PTC_BASE_PTR
#define LED_PT_RED      PTC_BASE_PTR
#define LED_PT_WHITE    PTC_BASE_PTR

#define LED_PORT_GREEN  PORTC_BASE_PTR
#define LED_PORT_RED    PORTC_BASE_PTR
#define LED_PORT_WHITE  PORTC_BASE_PTR

#define LED_INDEX_GREEN 7
#define LED_INDEX_RED   9
#define LED_INDEX_WHITE 11

typedef enum tagLedState
{
  LED_ON,
  LED_OFF
}LedState;

typedef void (* pLED_SetFunc)(LedState state);

typedef struct tagLEDCtl_t                /*LED灯控制的数据类型*/
{
  INT16U Tim_All;                         /*闪烁持续的总时间*/
  INT8U  Tim_OnOff; 
  INT8U  Tim_On1;                         /*第一周期内开启的时间*/
  INT8U  Tim_Off1;                        /*第一周期内关闭的时间*/
  INT8U  Tim_On2;                         /*第二周期内开启的时间*/
  INT8U  Tim_Off2;                        /*第二周期内关闭的时间*/
} LEDCtl_t;

typedef struct tagLEDData_t               /*LED灯队列控制的数据类型*/
{
  INT16U Tim;
  LEDCtl_t CtlData[NUM_LEDQueue];
  INT8U Queue_Head;
  INT8U Queue_Rear;
  INT8U Queue_Stat;
  pLED_SetFunc setLED;
} LEDData_t;

typedef enum tagLedQState
{
  Full,
  Normal,
  Empty
}LedQState;

#endif

#endif