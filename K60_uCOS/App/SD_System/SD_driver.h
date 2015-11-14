/******************************************************************************

* SD_driver.h

* 定义与SD卡操作相关的硬件平台配置
  并对SD卡底层驱动函数进行声明
  
* 第一作者：  纪成   (第四届摄像头)
  完善与整理：孙文健 (第六届摄像头)
* 版本：V1.15 (与V1.13、v1.14版相兼容,不使能双缓存时与V1.10之后的版本相兼容)
* 版本更新时间：2012年1月30日
  
* 主控芯片：MK10N512VMD100
  开发平台：CodeWarrior 10.1

* (!!!更改硬件平台后必须修改!!!)

******************************************************************************/
#ifndef _SD_PLATFINTERFACE_H_
#define _SD_PLATFINTERFACE_H_

/**************************硬件配置定义**************************/           
/* !!!硬件平台相关头文件!!! */
#include "../KinetisDrivers/KinetisConfig.h"          

/*开门狗操作定义*/
#define EN_WDOG_SD    1   /* 配置写卡时是否刷狗,=1表示写卡时进行刷狗操作 */

#ifndef C_WDOG   
  #if EN_WDOG_SD != 0
    #define C_WDOG() DisableInterrupts;WDOG_REFRESH=0xA602;WDOG_REFRESH=0xB480;if(sd_initover) EnableInterrupts;
  #else
    #define C_WDOG() ;
  #endif
#endif

/*底层参数定义*/
#define DELAY_WaitRead_SD  5   /* 读取1Byte数据时进行的延时(单位10个nop) */
/* 该延时时间的长短视处理器特性与硬件电路稳定性而定,对于K10,若想使SPI时钟超过10M,则需要约2us的延时 */

/*IO操作定义*/
#define  ON_SD_CS       GPIOE_PCOR |= (1<<5);      /*开启CS(注意0为选通)*/
#define  OFF_SD_CS      GPIOE_PSOR |= (1<<5);      /*关闭CS(注意0为选通)*/

/**************************数据类型定义**************************/
typedef unsigned char  byte_sd;      /*定义字节型变量*/
typedef unsigned short word_sd;      /*定义字型变量*/
typedef unsigned long  dword_sd;     /*定义双字型变量*/

/**************************API函数声明**************************/
extern void CloseSD(void);
extern void SetSD_Low(void);
extern void SetSD_High(void);
extern void SD_driver_Init(void);
extern void Wait_SDRdy(dword_sd Limit);

/*sd操作*/
extern byte_sd  sd_rdata(byte_sd * data,word_sd len);
extern byte_sd  jc_sd_cmd(byte_sd cmd,dword_sd arg,byte_sd crc);
extern byte_sd  sd_readsingleblock(byte_sd * data,dword_sd sector);
extern byte_sd  sd_writesingleblock(byte_sd * data, dword_sd sector) ;
extern byte_sd  sd_init(void) ;

#endif
