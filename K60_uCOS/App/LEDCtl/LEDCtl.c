/************************************************************************************************

* LEDCtl.c

* 指示灯控制器
  
* 主控芯片：MK10DN512VLL10
  开发平台：IAR Embedded Workbench 6.3
  
* 作者： 王昌安  (第十届摄像头)  

************************************************************************************************/
#include "./LEDCtl.h"

#if EN_LED != 0

static LEDData_t LEDQueue[LEDColorEnd];         /*LED控制缓冲队列*/

static void setGreenLED(LedState state)
{
  if(LED_ON == state)
  {
    (LED_PT_GREEN)->PCOR |= (1<<LED_INDEX_GREEN);
  }
  else
  {
    (LED_PT_GREEN)->PSOR |= (1<<LED_INDEX_GREEN);
  }
}
static void setRedLED(LedState state)
{
  if(LED_ON == state)
  {
    (LED_PT_RED)->PCOR |= (1<<LED_INDEX_RED);
  }
  else
  {
    (LED_PT_RED)->PSOR |= (1<<LED_INDEX_RED);
  }
}
static void setWhiteLED(LedState state)
{
  if(LED_ON == state)
  {
    (LED_PT_WHITE)->PCOR |= (1<<LED_INDEX_WHITE);
  }
  else
  {
    (LED_PT_WHITE)->PSOR |= (1<<LED_INDEX_WHITE);
  }
}
static void LED_IOInit(void)
{
  ((LED_PORT_GREEN)->PCR[LED_INDEX_GREEN]) = PORT_PCR_MUX(1);
  (LED_PT_GREEN)->PDDR |= (1<<LED_INDEX_GREEN); 
  
  (LED_PORT_RED)->PCR[LED_INDEX_RED] = PORT_PCR_MUX(1);
  (LED_PT_RED)->PDDR |= (1<<LED_INDEX_RED);
  
  (LED_PORT_WHITE)->PCR[LED_INDEX_WHITE] = PORT_PCR_MUX(1);
  (LED_PT_WHITE)->PDDR |= (1<<LED_INDEX_WHITE);
}

static void LED_QueueInit()
{ 
  for(INT8U index = LEDColorStart;index < LEDColorEnd;++index)
  {
    LEDQueue[index].Tim = 0;
    LEDQueue[index].Queue_Head = 0;
    LEDQueue[index].Queue_Rear = 0;
    LEDQueue[index].Queue_Stat = Empty; 
  }
  LEDQueue[Green].setLED = setGreenLED;
  LEDQueue[Red].setLED = setRedLED;
  LEDQueue[White].setLED = setWhiteLED;
}

static void LedQStaUpdate(INT8U id,LedQState state)
{
  if(LEDQueue[id].Queue_Head == LEDQueue[id].Queue_Rear)
  {
    LEDQueue[id].Queue_Stat = state;
  }
  else
  {
    LEDQueue[id].Queue_Stat = Normal;
  }
}

static void LED_UpdateSta(INT8U id)
{
  INT16U TimTemp = LEDQueue[id].Tim % LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_OnOff;
   
  if(TimTemp < LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_On1 + LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_Off1)
  {
    if(0 == TimTemp)
    {
      if(0 != LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_On1)
      {
        LEDQueue[id].setLED(LED_ON);
      }
      else
      {
        LEDQueue[id].setLED(LED_OFF);
      }
    }
    else
    {
      if(TimTemp == LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_On1)
      {
        LEDQueue[id].setLED(LED_OFF);
      }
    }
  }
  else
  {
    if(LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_On1 + LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_Off1 == TimTemp)
    {
      if(0 != LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_On2)
      {
        LEDQueue[id].setLED(LED_ON);
      }
    }
    else
    {
      if(LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_On1 + LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_Off1 + LEDQueue[id].CtlData[LEDQueue[id].Queue_Head].Tim_On2 == TimTemp)
      {
        LEDQueue[id].setLED(LED_OFF);
      }
    }
  }
}

#endif

void LED_Init(void)
{
#if EN_LED != 0
  LED_IOInit();
  setGreenLED(LED_OFF);
  setRedLED(LED_OFF);
  setWhiteLED(LED_OFF);
  LED_QueueInit();
#else
  return;
#endif
}

INT8U LedCtlSet(LEDColor id,
                INT16U tim_all,
                INT8U tim_on1,
                INT8U tim_off1,
                INT8U tim_on2,
                INT8U tim_off2
               )
{
#if EN_LED != 0
  if(Full != LEDQueue[id].Queue_Stat)//队列未满
  {
    LEDQueue[id].Tim = 0;
    LEDQueue[id].CtlData[LEDQueue[id].Queue_Rear].Tim_All = tim_all;
    LEDQueue[id].CtlData[LEDQueue[id].Queue_Rear].Tim_On1 = tim_on1;
    LEDQueue[id].CtlData[LEDQueue[id].Queue_Rear].Tim_Off1 = tim_off1;
    LEDQueue[id].CtlData[LEDQueue[id].Queue_Rear].Tim_On2 = tim_on2;
    LEDQueue[id].CtlData[LEDQueue[id].Queue_Rear].Tim_Off2 = tim_off2;
    LEDQueue[id].CtlData[LEDQueue[id].Queue_Rear].Tim_OnOff = tim_on1 + tim_off1 + tim_on2 + tim_off2;
    LED_EnQueue(id);//入队
    LedQStaUpdate(id,Full);//更新队列状态
    return KOS_OK;
  }
  else
  {
    return KOS_ERR;
  }
#else
  return KOS_OK;
#endif
}

void LED_CtlProc(void)
{
#if EN_LED != 0
  for(INT8U index = LEDColorStart;index < LEDColorEnd;++index)
  {
    if(Empty != LEDQueue[index].Queue_Stat)
    {
      if(LEDQueue[index].CtlData[LEDQueue[index].Queue_Head].Tim_All == LEDQueue[index].Tim)
      {
        LEDQueue[index].Tim = 0;
        LED_DeQueue(index);//出队
        LedQStaUpdate(index,Empty);//更新队列状态
        LED_UpdateSta(index);
      }
      else
      {   
        LED_UpdateSta(index);
        LEDQueue[index].Tim++;
      }
    }
  }
#else

#endif
}
