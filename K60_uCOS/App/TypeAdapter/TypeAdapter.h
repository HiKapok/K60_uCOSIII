/******************************************************************************

* TypeAdapter.h

* TypeAdapter.c中的函数与变量进行申明,并定义必要的常量与数据类型

******************************************************************************/

#ifndef __TYPEADAPTER_H_
#define __TYPEADAPTER_H_

#include "../../uCOS_III/CortexM4/os_cpu_def.h"

typedef enum tagDataType
{
  DataTypeStart = 0,
  Type_INT8U = 0,
  Type_INT8S,
  Type_INT16U,
  Type_INT16S,
  Type_INT32U,
  Type_INT32S,
  Type_FP32,
  Type_FP64,
  Type_UsrDef,
  DataTypeEnd
}DataType;

typedef struct tagStParam{
  union{
    INT8S  s8Data;
    INT8U  u8Data;
    INT16S s16Data;
    INT16U u16Data;
    INT32S s32Data;
    INT32U u32Data;
    FP32 fData;
    FP64 lfData;
    INT8U data[8];
  }Data;
  char * lpstr;
  void * pData;
  INT8U orgLength;
  DataType typeID; 
}ParamSt;

extern void gTypeAdapter(ParamSt *);

#endif
