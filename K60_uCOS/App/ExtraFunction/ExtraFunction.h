#ifndef _EXTRAFUNCTION_H_
#define _EXTRAFUNCTION_H_

#include "../../uCOS_III/CortexM4/os_cpu_def.h"
#include "../Platform/Platform.h"
#include "../Common_Def.h"

/**************************��������**************************/
#define NUM_BuzzerQ   6    /*���������ƻ�����еĴ�С*/

/**************************�������Ͷ���**************************/
typedef struct tagBuzzerData_t            /*���������Ƶ���������*/
{
  INT16U Tim_All;                         /*������������ʱ��*/
  INT16U Tim_Total;                       /*һ��ѭ������ʱ��*/
  INT8U  Tim_On1;                         /*��һ�����ڿ�����ʱ��*/
  INT8U  Tim_Off1;                        /*��һ�����ڹرյ�ʱ��*/
  INT8U  Tim_On2;                         /*�ڶ������ڿ�����ʱ��*/
  INT8U  Tim_Off2;                        /*�ڶ������ڹرյ�ʱ��*/
} BuzzerData_t;

/**************************�ӿں�������**************************/
extern void SDCard_MainTask(void);
extern void OLED_MainTask(void);
extern void LED_MainTask(void);
extern void Buzzer_MainTask(void);
extern void BuzzerSet(INT16U tim_all,INT8U tim_on1,INT8U tim_off1,INT8U tim_on2,INT8U tim_off2);
extern void ExtInit_Normal(void);
extern void Process_BuzzerCtrl(void);

#endif
