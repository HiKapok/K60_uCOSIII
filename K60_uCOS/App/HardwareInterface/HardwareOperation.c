#include "./HardwareOperation.h"
#include "../Platform/Platform.h"

ptrKeyCallBackFunc ptrExtKeyProc;
INT16U Boma = 0;

/************************************************************************************************ 
* ReadBomaValue
* 读取拨码开关的设定(读取对应的二进制数)
* 返回参数  拨码开关的当前值
************************************************************************************************/
INT16U ReadBomaValue(void)
{
  INT16U boma,boma_again;
  volatile INT16U i;
  
  do
  {    
    boma=READ_Boma();
    
    for(i=0;i<300;i++) ; /*延时再次检测以防止干扰*/
    
    boma_again=READ_Boma();
    
  } while(boma != boma_again);
  
  return boma;
}

void ExtKeyProc(INT16U * Key)
{
  
}

void ExtKey_Init(void)
{
  PORTE_PCR24 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK;
	                                   /* 使能下拉电阻 */
  PORTE_PCR16 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK;

                                           /* 该中断将被设置为下降沿 */
  (void)EnableInt_Kinetis(91);             /* 开启对应的中断 */
  ptrExtKeyProc = ExtKeyProc;
  EN_ExtKeyInt();
}

void Enternet_Init(void)
{
  PORTC_PCR12 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK;
	                                   /* 使能下拉电阻 */
                                           /* 该中断将被设置为下降沿 */
  (void)EnableInt_Kinetis(89);             /* 开启对应的中断 */
  EN_EnternetInt();
}



