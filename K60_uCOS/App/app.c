/************************************************************************************************

* app.c

* 定义应用程序任务

************************************************************************************************/
/***********************基本数据类型定义相关头文件***********************/
#include "../uCOS_III/CortexM4/os_cpu_def.h"
/***************************硬件平台相关头文件***************************/
#include "../KinetisDrivers/KinetisConfig.h"
#include "../App/ExtraFunction/ExtraFunction.h"
#include "../App/HardwareInterface/Interrupt.h"
#include "../App/ZLG7290/ZLG7290.h"
#include "../uCOS_III/Source/os.h"
#include "../uCOS_III/Source/os_type.h"
#include "./app.h"

extern void  OS_CPU_SysTickInit (CPU_INT32U  cnts);  

static  OS_TCB        App_TaskBuzzerTCB;
static  CPU_STK_SIZE  App_TaskBuzzerStk[APP_CFG_TASK_START_STK_SIZE];

static  OS_TCB        App_TaskOLEDTCB;
static  CPU_STK_SIZE  App_TaskOLEDStk[APP_CFG_TASK_START_STK_SIZE];

static  OS_TCB        App_TaskLEDTCB;
static  CPU_STK_SIZE  App_TaskLEDStk[APP_CFG_TASK_START_STK_SIZE];

static  OS_TCB        App_TaskKeyPadTCB;
static  CPU_STK_SIZE  App_TaskKeyPadStk[APP_CFG_TASK_START_STK_SIZE];

static  OS_TCB        App_TaskSDCardTCB;
static  CPU_STK_SIZE  App_TaskSDCardStk[APP_CFG_TASK_START_STK_SIZE];

static void  App_InitAll (void)
{
  DIS_Int();              /*初始化之前先关中断*/
  /* setup watchdog */
  WatchDog_Init();
  
  GPIO_Init();            /*基本输入输出口初始化*/  
  
  C_WDOG_IntOff();        /*清看门狗*/
  
  SysTick = 0;            /*时基计数清零*/ 
  IntTick_Init();         /*初始化系统时钟中断*/ 
  
  OS_CPU_SysTickInit(CORE_CLK_Kinetis * 1000000 / (CPU_INT32U)OSCfg_TickRate_Hz);
    
  C_WDOG_IntOff();        /*清看门狗*/
 
  ExtInit_Normal();
  
  C_WDOG_IntOff();        /*清看门狗*/
  
  EN_Int();               /*开中断,系统开始正常运行*/	
}
void  Buzzer_Task (void *p_arg)
{
  OS_ERR  os_err;

  (void)p_arg;                                                /* See Note #1  */                            

  while (DEF_TRUE) {                                          /* Task body, always written as an infinite loop.       */
      Buzzer_MainTask();
      OSTimeDlyHMSM(0u, 0u, 0u, 10u,OS_OPT_TIME_HMSM_STRICT, &os_err);
      C_WDOG_IntOn();
  }
}

void  SDCard_Task (void *p_arg)
{
  OS_ERR  os_err;

  (void)p_arg;                                                /* See Note #1  */                            

  while (DEF_TRUE) {                                          /* Task body, always written as an infinite loop.       */
      SDCard_MainTask();
      OSTimeDlyHMSM(0u, 0u, 0u, 60u,OS_OPT_TIME_HMSM_STRICT, &os_err);
      C_WDOG_IntOn();
  }
}

void  OLED_Task (void *p_arg)
{
  OS_ERR  os_err;

  (void)p_arg;                                                /* See Note #1  */                            

  while (DEF_TRUE) {                                          /* Task body, always written as an infinite loop.       */
      OLED_MainTask();
      OSTimeDlyHMSM(0u, 0u, 0u, 40u,OS_OPT_TIME_HMSM_STRICT, &os_err);
      C_WDOG_IntOn();
  }
}

void  LED_Task (void *p_arg)
{
  OS_ERR  os_err;

  (void)p_arg;                                                /* See Note #1  */                            

  while (DEF_TRUE) {                                          /* Task body, always written as an infinite loop.       */
      LED_MainTask();
      OSTimeDlyHMSM(0u, 0u, 0u, 20u, OS_OPT_TIME_HMSM_STRICT, &os_err);
      C_WDOG_IntOn();
  }
}

void  KeyPad_Task (void *p_arg)
{
  OS_ERR  os_err;

  (void)p_arg;                                                /* See Note #1  */                            

  while (DEF_TRUE) {                                          /* Task body, always written as an infinite loop.       */
      if(!KeyPad_Mask && Key_Valid)
      {
        Key_Value = ZLG7290_ReadKeyValue();
        ptrKeyPadFunc(&Key_Value);
        Key_Valid = 0;
        EN_KeyInt(); 
      }
      OSTimeDlyHMSM(0u, 0u, 0u, 10u,OS_OPT_TIME_HMSM_STRICT, &os_err);
      C_WDOG_IntOn();
  }
}

static void App_TaskCreate(void)
{
  OS_ERR  err;
  
  OSTaskCreate((OS_TCB     *)&App_TaskBuzzerTCB,                                             
             (CPU_CHAR   *)"App Task Buzzer",
             (OS_TASK_PTR ) Buzzer_Task,
             (void       *) 0u,
             (OS_PRIO     ) APP_CFG_TASK_BUZZER_PRIO,
             (CPU_STK    *)&App_TaskBuzzerStk[0u],
             (CPU_STK     )(APP_CFG_TASK_BUZZER_STK_SIZE / 10u),
             (CPU_STK_SIZE) APP_CFG_TASK_BUZZER_STK_SIZE,
             (OS_MSG_QTY  ) 0u,
             (OS_TICK     ) 0u,
             (void       *) 0u,
             (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
             (OS_ERR     *)&err);
  
  OSTaskCreate((OS_TCB     *)&App_TaskOLEDTCB,                                             
             (CPU_CHAR   *)"App Task OLED",
             (OS_TASK_PTR ) OLED_Task,
             (void       *) 0u,
             (OS_PRIO     ) APP_CFG_TASK_OLED_PRIO,
             (CPU_STK    *)&App_TaskOLEDStk[0u],
             (CPU_STK     )(APP_CFG_TASK_OLED_STK_SIZE / 10u),
             (CPU_STK_SIZE) APP_CFG_TASK_OLED_STK_SIZE,
             (OS_MSG_QTY  ) 0u,
             (OS_TICK     ) 0u,
             (void       *) 0u,
             (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
             (OS_ERR     *)&err);
  
  OSTaskCreate((OS_TCB     *)&App_TaskLEDTCB,                                             
             (CPU_CHAR   *)"App Task LED",
             (OS_TASK_PTR ) LED_Task,
             (void       *) 0u,
             (OS_PRIO     ) APP_CFG_TASK_LED_PRIO,
             (CPU_STK    *)&App_TaskLEDStk[0u],
             (CPU_STK     )(APP_CFG_TASK_LED_STK_SIZE / 10u),
             (CPU_STK_SIZE) APP_CFG_TASK_LED_STK_SIZE,
             (OS_MSG_QTY  ) 0u,
             (OS_TICK     ) 0u,
             (void       *) 0u,
             (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
             (OS_ERR     *)&err);
  
  OSTaskCreate((OS_TCB     *)&App_TaskKeyPadTCB,                                             
             (CPU_CHAR   *)"App Task KeyPad",
             (OS_TASK_PTR ) KeyPad_Task,
             (void       *) 0u,
             (OS_PRIO     ) APP_CFG_TASK_KEYPAD_PRIO,
             (CPU_STK    *)&App_TaskKeyPadStk[0u],
             (CPU_STK     )(APP_CFG_TASK_KEYPAD_STK_SIZE / 10u),
             (CPU_STK_SIZE) APP_CFG_TASK_KEYPAD_STK_SIZE,
             (OS_MSG_QTY  ) 0u,
             (OS_TICK     ) 0u,
             (void       *) 0u,
             (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
             (OS_ERR     *)&err);
  
  OSTaskCreate((OS_TCB     *)&App_TaskSDCardTCB,                                             
             (CPU_CHAR   *)"App Task SDCard",
             (OS_TASK_PTR ) SDCard_Task,
             (void       *) 0u,
             (OS_PRIO     ) APP_CFG_TASK_SDCARD_PRIO,
             (CPU_STK    *)&App_TaskSDCardStk[0u],
             (CPU_STK     )(APP_CFG_TASK_SDCARD_STK_SIZE / 10u),
             (CPU_STK_SIZE) APP_CFG_TASK_SDCARD_STK_SIZE,
             (OS_MSG_QTY  ) 0u,
             (OS_TICK     ) 0u,
             (void       *) 0u,
             (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
             (OS_ERR     *)&err);
  
}
/*
*********************************************************************************************************
*                                          App_TaskStart()
*
* Description : This is an example of a startup task.  As mentioned in the book's text, you MUST
*               initialize the ticker only once multitasking has started.
*
* Argument(s) : p_arg   is the argument passed to 'App_TaskStart()' by 'OSTaskCreate()'.
*
* Return(s)   : none.
*
* Caller(s)   : This is a task.
*
* Notes       : (1) The first line of code is used to prevent a compiler warning because 'p_arg' is not
*                   used.  The compiler should not generate any code for this statement.
*********************************************************************************************************
*/

void  App_TaskStart (void *p_arg)
{
    (void)p_arg;                                                /* See Note #1  */
    
    App_InitAll();
    
    App_TaskCreate();                                           /* Create Application Tasks                             */  
}

