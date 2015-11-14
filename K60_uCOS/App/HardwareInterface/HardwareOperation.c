#include "./HardwareOperation.h"
#include "../Platform/Platform.h"

ptrKeyCallBackFunc ptrExtKeyProc;
INT16U Boma = 0;

/************************************************************************************************ 
* ReadBomaValue
* ��ȡ���뿪�ص��趨(��ȡ��Ӧ�Ķ�������)
* ���ز���  ���뿪�صĵ�ǰֵ
************************************************************************************************/
INT16U ReadBomaValue(void)
{
  INT16U boma,boma_again;
  volatile INT16U i;
  
  do
  {    
    boma=READ_Boma();
    
    for(i=0;i<300;i++) ; /*��ʱ�ٴμ���Է�ֹ����*/
    
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
	                                   /* ʹ���������� */
  PORTE_PCR16 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK;

                                           /* ���жϽ�������Ϊ�½��� */
  (void)EnableInt_Kinetis(91);             /* ������Ӧ���ж� */
  ptrExtKeyProc = ExtKeyProc;
  EN_ExtKeyInt();
}

void Enternet_Init(void)
{
  PORTC_PCR12 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK;
	                                   /* ʹ���������� */
                                           /* ���жϽ�������Ϊ�½��� */
  (void)EnableInt_Kinetis(89);             /* ������Ӧ���ж� */
  EN_EnternetInt();
}



