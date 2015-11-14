#include "./Interrupt.h"
#include "../Platform/Platform.h"
#include "../ZLG7290/ZLG7290.h"
#include "../KinetisDrivers/KinetisConfig.h"
#include "../HardwareInterface/HardwareOperation.h"

volatile INT32U SysTick = 0;   /*系统时间基准(其单位在Platform.h中配置)*/
/****************************************中断服务程序********************************************/
/************************************************************************************************ 
* ISR_System_Tick
* 系统时钟中断的中断服务程序
  提供系统时间基准
  并运行用户指定的函数
************************************************************************************************/
ISR_System_Tick()     
{    
  CLR_TickInt();                      /*清中断标志*/  
  DIS_Int(); 

  SysTick++;                          /*系统时间基准加1*/  
  
  EN_Int();
}
/************************************************************************************************ 
* ISR_KeyPad
* 键盘中断的中断服务程序
  设置相关标志位
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
