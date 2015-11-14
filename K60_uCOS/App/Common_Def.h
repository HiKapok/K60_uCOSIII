#ifndef _COMMON_DEF_H_
#define _COMMON_DEF_H_

/**************************��������**************************/
#define EN_KeyPad             1         /* ���̵���ʹ�ܣ�1��Ч*/
#define EN_SDCard             1         /* SD������ʹ�ܣ�1��Ч*/
#define EN_OLED               1         /* OLED����ʹ�ܣ�1��Ч*/
#define EN_Buzzer             1         /* ����������ʹ��,1��Ч */
#define EN_LED                1         /* LED��˸����ʹ��,1��Ч */
                                                       
#define KOS_OK                0
#define KOS_ERR               1

#define SD_Packet             100       /* д��֡�� */

/*****��������*****/
#define BZR_TimeOut    36,4,2,0,0           /*����ʱ*/
#define BZR_ReStart    120,55,5,0,0         /*�쳣��λ*/
#define BZR_DebugErr   80,25,5,5,5          /*���Թ��߳���*/
#define BZR_Test       280,35,5,10,20       /*���ܲ���*/
#define BZR_SysStart   240,50,10,40,20      /*ϵͳ��������*/

/*****��˸����*****/
#define LED_Pass      Green,40,20,10,0,0    /*ͨ��*/
#define LED_Warning   White,100,30,5,10,5   /*����*/
#define LED_SysErr    Red,250,20,10,20,5    /*ϵͳ����*/

#endif
