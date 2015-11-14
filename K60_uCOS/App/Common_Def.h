#ifndef _COMMON_DEF_H_
#define _COMMON_DEF_H_

/**************************功能配置**************************/
#define EN_KeyPad             1         /* 键盘调试使能，1有效*/
#define EN_SDCard             1         /* SD卡调试使能，1有效*/
#define EN_OLED               1         /* OLED调试使能，1有效*/
#define EN_Buzzer             1         /* 蜂鸣器控制使能,1有效 */
#define EN_LED                1         /* LED闪烁控制使能,1有效 */
                                                       
#define KOS_OK                0
#define KOS_ERR               1

#define SD_Packet             100       /* 写卡帧数 */

/*****声音设置*****/
#define BZR_TimeOut    36,4,2,0,0           /*处理超时*/
#define BZR_ReStart    120,55,5,0,0         /*异常复位*/
#define BZR_DebugErr   80,25,5,5,5          /*调试工具出错*/
#define BZR_Test       280,35,5,10,20       /*功能测试*/
#define BZR_SysStart   240,50,10,40,20      /*系统启动响声*/

/*****闪烁设置*****/
#define LED_Pass      Green,40,20,10,0,0    /*通过*/
#define LED_Warning   White,100,30,5,10,5   /*警告*/
#define LED_SysErr    Red,250,20,10,20,5    /*系统出错*/

#endif
