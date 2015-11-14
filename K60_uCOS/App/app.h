#ifndef  __APP_H_
#define  __APP_H_

/*
*********************************************************************************************************
*                                       ADDITIONAL uC/MODULE ENABLES
*********************************************************************************************************
*/

/*
*********************************************************************************************************
*                                            TASK PRIORITIES
*********************************************************************************************************
*/

#define  APP_CFG_TASK_START_PRIO                    2u
#define  APP_CFG_TASK_BUZZER_PRIO                   25u
#define  APP_CFG_TASK_OLED_PRIO                     10u
#define  APP_CFG_TASK_LED_PRIO                      15u
#define  APP_CFG_TASK_KEYPAD_PRIO                   18u
#define  APP_CFG_TASK_SDCARD_PRIO                   20u

/*
*********************************************************************************************************
*                                            TASK STACK SIZES
*********************************************************************************************************
*/

#define  APP_CFG_TASK_START_STK_SIZE                100u
#define  APP_CFG_TASK_BUZZER_STK_SIZE               100u
#define  APP_CFG_TASK_OLED_STK_SIZE                 100u
#define  APP_CFG_TASK_LED_STK_SIZE                  100u
#define  APP_CFG_TASK_KEYPAD_STK_SIZE               100u
#define  APP_CFG_TASK_SDCARD_STK_SIZE               100u

extern void  App_TaskStart (void *p_arg);

#endif
