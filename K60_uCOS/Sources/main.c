/************************************************************************************************

* main.c

* �����������(main����)��ϵͳ����Ҫ��������

************************************************************************************************/
/***************************Ӳ��ƽ̨���ͷ�ļ�***************************/
#include "../App/app.h"
#include "../uCOS_III/Source/os.h"
#include "../uCOS_III/Source/os_type.h"
/*
*********************************************************************************************************
*                                       LOCAL GLOBAL VARIABLES
*********************************************************************************************************
*/
static  OS_TCB        App_TaskStartTCB;
static  CPU_STK_SIZE  App_TaskStartStk[APP_CFG_TASK_START_STK_SIZE];
        
void main(void) 
{   
  OS_ERR   err;

  /*������ѭ��*/
  for(;;)        
  {  
    //TODO:Add your code here 
    OSInit(&err);                                               /* Initialize "uC/OS-III, The Real-Time Kernel"         */

    OSTaskCreate((OS_TCB     *)&App_TaskStartTCB,               /* Create the start task                                */
                 (CPU_CHAR   *)"App Task Start",
                 (OS_TASK_PTR ) App_TaskStart,
                 (void       *) 0u,
                 (OS_PRIO     ) APP_CFG_TASK_START_PRIO,
                 (CPU_STK    *)&App_TaskStartStk[0u],
                 (CPU_STK     )(APP_CFG_TASK_START_STK_SIZE / 10u),
                 (CPU_STK_SIZE) APP_CFG_TASK_START_STK_SIZE,
                 (OS_MSG_QTY  ) 0u,
                 (OS_TICK     ) 0u,
                 (void       *) 0u,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);


    OSStart(&err);                                              /* Start multitasking (i.e. give control to uC/OS-III). */
    //loop forever
    for(;;){}
  }                 
}                        



