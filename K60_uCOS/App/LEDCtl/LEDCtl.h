/******************************************************************************

* LEDCtl.h

* LEDCtl.c�еĺ����������������,�������Ҫ�ĳ�������������

******************************************************************************/

#ifndef __LED_CTL_H_
#define __LED_CTL_H_

#include "../Common_Def.h"
#include "./LEDCtl_Ext.h"

#if EN_LED != 0

#include "../KinetisDrivers/KinetisConfig.h"

#define NUM_LEDQueue  6    /*LED�ƿ��ƻ�����еĴ�С,����Ϊ0*/
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

typedef struct tagLEDCtl_t                /*LED�ƿ��Ƶ���������*/
{
  INT16U Tim_All;                         /*��˸��������ʱ��*/
  INT8U  Tim_OnOff; 
  INT8U  Tim_On1;                         /*��һ�����ڿ�����ʱ��*/
  INT8U  Tim_Off1;                        /*��һ�����ڹرյ�ʱ��*/
  INT8U  Tim_On2;                         /*�ڶ������ڿ�����ʱ��*/
  INT8U  Tim_Off2;                        /*�ڶ������ڹرյ�ʱ��*/
} LEDCtl_t;

typedef struct tagLEDData_t               /*LED�ƶ��п��Ƶ���������*/
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