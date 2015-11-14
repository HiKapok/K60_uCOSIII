/******************************************************************************

* OLED.h

* OLED.c中的函数与变量进行申明,并定义必要的常量与数据类型

******************************************************************************/

#ifndef __OLED_H_
#define __OLED_H_

#include "../KinetisDrivers/KinetisConfig.h"
#include "../Common_Def.h"
#include "../../uCOS_III/CortexM4/os_cpu_def.h"

typedef INT8U (* t_OLED_GRAM)[132];

/**************************常数定义**************************/
#define PARAM_SHOW_LENGTH 5
#define OLED_CMD  0
#define OLED_DATA 1

//Modify this by your design
#define OLED_PT_SCL   PTB_BASE_PTR
#define OLED_PT_SDA   PTB_BASE_PTR
#define OLED_PT_DC    PTB_BASE_PTR
#define OLED_PT_RST   PTB_BASE_PTR

#define OLED_PORT_SCL PORTB_BASE_PTR
#define OLED_PORT_SDA PORTB_BASE_PTR
#define OLED_PORT_DC  PORTB_BASE_PTR
#define OLED_PORT_RST PORTB_BASE_PTR

#define OLED_INDEX_SCL 21
#define OLED_INDEX_SDA 1
#define OLED_INDEX_DC  3
#define OLED_INDEX_RST 10

/* Never modify this block ---*/
#define OLED_SCLH  (OLED_PT_SCL->PSOR |= (1<<OLED_INDEX_SCL)) 
#define OLED_SCLL  (OLED_PT_SCL->PCOR |= (1<<OLED_INDEX_SCL))

#define OLED_SDAH  (OLED_PT_SDA->PSOR |= (1<<OLED_INDEX_SDA))
#define OLED_SDAL  (OLED_PT_SDA->PCOR |= (1<<OLED_INDEX_SDA))

#define OLED_RSTH  (OLED_PT_RST->PSOR |= (1<<OLED_INDEX_RST))
#define OLED_RSTL  (OLED_PT_RST->PCOR |= (1<<OLED_INDEX_RST))

#define OLED_DCH   (OLED_PT_DC->PSOR  |= (1<<OLED_INDEX_DC))
#define OLED_DCL   (OLED_PT_DC->PCOR  |= (1<<OLED_INDEX_DC))
/* ---Never modify this block */

extern INT8U OLED_Mask;
/**************************接口函数声明**************************/
extern INT8U OLED_Init(void);
extern void OLED_Clear(void);
extern void OLED_Refresh_SeleteGram(INT8U id);
extern void WriteTips(INT8U id,INT8U *pre,const char *str);
extern void OLED_Refresh_Gram(void);
extern void OLED_Proc(void);
extern void OLED_Close(void);
extern INT8U OLED_SetNormalPower(void);
extern INT8U OLED_SetLowPower(void);
#endif
