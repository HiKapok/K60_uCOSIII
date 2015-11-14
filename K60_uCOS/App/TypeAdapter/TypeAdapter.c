/************************************************************************************************

* TypeAdapter.c

* 数据类型适配器
  
* 主控芯片：MK10DN512VLL10
  开发平台：IAR Embedded Workbench 6.3
  
* 作者： 王昌安  (第十届摄像头)  

************************************************************************************************/
#include "./TypeAdapter.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void gTypeAdapter(ParamSt *stValue)
{
  char temp[20]={'\0'};
  char * pStrBase = stValue->lpstr + stValue->orgLength;
  char * pSrcStr = temp;
  switch (stValue->typeID)
  {
  case Type_INT8U:
    stValue->Data.u8Data=*((INT8U *)stValue->pData);
    sprintf(temp,"%d",stValue->Data.u8Data);
    break;
  case Type_INT8S:
    stValue->Data.s8Data=*((INT8S *)stValue->pData);
    sprintf(temp,"%d",stValue->Data.s8Data);
    break;
  case Type_INT16U:
    stValue->Data.u16Data=*((INT16U *)stValue->pData);
    sprintf(temp,"%d",stValue->Data.u16Data);
    break;
  case Type_INT16S:
    stValue->Data.s16Data=*((INT16S *)stValue->pData);
    sprintf(temp,"%d",stValue->Data.s16Data);
    break;
  case Type_INT32U:
    stValue->Data.u32Data=*((INT32U *)stValue->pData);
    sprintf(temp,"%d",stValue->Data.u32Data);
    break;
  case Type_INT32S:
    stValue->Data.s32Data=*((INT32S *)stValue->pData);
    sprintf(temp,"%d",stValue->Data.s32Data);
    break;
  case Type_FP32:
    stValue->Data.fData=*((FP32 *)stValue->pData);
    sprintf(temp,"%-.2f",stValue->Data.fData);
    break;
  case Type_FP64:
    stValue->Data.lfData=*((FP64 *)stValue->pData);
    sprintf(temp,"%-.2lf",stValue->Data.lfData);
    break;
  default:
    break;  
  }
  while('\0' != *pSrcStr)
  {
    *pStrBase = *pSrcStr; 
    pSrcStr++;
    pStrBase++;
  }
  *pStrBase = *pSrcStr; 
}