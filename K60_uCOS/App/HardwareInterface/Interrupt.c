#include "./Interrupt.h"
#include "../Platform/Platform.h"
#include "../ZLG7290/ZLG7290.h"
#include "../KinetisDrivers/KinetisConfig.h"
#include "../HardwareInterface/HardwareOperation.h"

volatile INT32U SysTick = 0;   /*ϵͳʱ���׼(�䵥λ��Platform.h������)*/
/****************************************�жϷ������********************************************/
/************************************************************************************************ 
* ISR_System_Tick
* ϵͳʱ���жϵ��жϷ������
  �ṩϵͳʱ���׼
  �������û�ָ���ĺ���
************************************************************************************************/
ISR_System_Tick()     
{    
  CLR_TickInt();                      /*���жϱ�־*/  
  DIS_Int(); 

  SysTick++;                          /*ϵͳʱ���׼��1*/  
  
  EN_Int();
}
/************************************************************************************************ 
* ISR_KeyPad
* �����жϵ��жϷ������
  ������ر�־λ
************************************************************************************************/
ISR_KeyPad(){
#if EN_KeyPad != 0
  if(IF_KeyInt()){
    DIS_KeyInt(); 
    Key_Valid=1;   
  }
#endif
  CLR_KeyInt();
}

ISR_Key(){
#if EN_KeyPad != 0
  ExtKeyValue = GetExtKey();
  DIS_ExtKeyInt();
  ptrExtKeyProc(&ExtKeyValue);
#endif
  CLR_ExtKeyInt();
  EN_ExtKeyInt();
}

ISR_Enternet(){
  DIS_EnternetInt();
  CLR_EnternetInt();
  EN_EnternetInt();
}
