#include "FTFL.h"
#include "stdlib.h"
#include "inttypes.h"

/*******************************************************************************
* 函数名称：FTFL_Init
* 入口参数：
* 返回参数：
* 描    述：初始化FTFL模块
*******************************************************************************/
void FTFL_Init (void)
{
  SIM_SCGC6 |= SIM_SCGC6_FTFL_MASK;
}
/*******************************************************************************
* 函数名称：FTFL_IsCmdLaunched
* 入口参数：
* 返回参数：
* 描    述：执行并判断FTFL指令是否成功
*******************************************************************************/
uint8_t FTFL_IsCmdLaunched (void)
{
  uint32_t nWaitCnt = 0; // 等待计数器
  
  if (FTFL_IsAccessErr () || FTFL_IsProtectionViolated ())
  {
    // 如果已发生访问越权或保护区误访问，清除其产生的错误标志，否则FTFL命令无法执行
    FTFL_ClearErrBits ();
  }
  
  // 清除CCIF位，启动命令的执行
  FTFL_FSTAT = FTFL_FSTAT_CCIF_MASK;
  // 等待FTFL操作完成
  while (((nWaitCnt++) <= 100000) && (!FTFL_IsCmdFinish ()));
  
  // 错误处理
  if (nWaitCnt > 100000)
  {
    // 若超时，则返回错误
    return FTFL_CODE_ERR;
  }
  
  if (FTFL_IsAccessErr () || FTFL_IsProtectionViolated ())
  {
    // 如果发生访问越权或保护区误访问，返回错误
    return FTFL_CODE_ERR;
  }
  // 操作正确完成，返回提示码
  return FTFL_CODE_SUCCESS;
}
/*******************************************************************************
* 函数名称：FTFL_EraseSector
* 入口参数：uint16_t iSectorNo ：扇区号
* 返回参数：FTFL_CODE_ERR：操作失败；FTFL_CODE_SUCCESS：操作成功
* 描    述：擦除程序flash扇区
*******************************************************************************/
uint8_t FTFL_EraseSector (uint16_t iSectorNo)
{
  union{
    uint32_t addrs_word;
    uint8_t addrs_byte[4];
  }union_addrs; // 联合体，用于地址计算
  
  // 入参合法性检验
  if (iSectorNo < 2)
  {
    /* flash的0号sector为中断向量以及引导的存储位置，不可覆盖
    ，为确保安全，从第三区开始写；K10DN512有512K flash，每区2K
    ，共有256个区                                             */
    return FTFL_CODE_ERR;
  }
  
  // 计算区偏移地址
  union_addrs.addrs_word = (((uint32_t)iSectorNo) << 11);
  
  // 装载指令
  FTFL_FCCOB0 = FTFL_CMD_EFS;  // 擦除扇区指令
  FTFL_FCCOB1 = union_addrs.addrs_byte[2]; // 扇区地址
  FTFL_FCCOB2 = union_addrs.addrs_byte[1];
  FTFL_FCCOB3 = union_addrs.addrs_byte[0];
  
  if (FTFL_CODE_ERR == FTFL_IsCmdLaunched ())
  {
    // 若指令执行失败，返回错误码
    return FTFL_CODE_ERR;
  }
  // 操作成功，返回提示码
  return FTFL_CODE_SUCCESS;
}
/*******************************************************************************
* 函数名称：FTFL_WriteLongWord
* 入口参数：uint16_t iSectorNo ：扇区号；
            uint16_t iOffset：偏移地址；
            uint8_t iByte[4]：写入的四字节
* 返回参数：FTFL_CODE_ERR：操作失败；FTFL_CODE_SUCCESS：操作成功
* 描    述：写入程序flash四个字节
*******************************************************************************/
uint8_t FTFL_WriteLongWord (uint16_t iSectorNo, uint16_t iOffset, uint8_t iByte[4])
{
  union{
    uint32_t addrs_word;
    uint8_t addrs_byte[4];
  }union_addrs; // 联合体，用于地址计算
  
  // 入参合法性检验
  if (iSectorNo < 2)
  {
    /* flash的0号sector为中断向量以及引导的存储位置，不可覆盖
    ，为确保安全，从第三区开始写；K10DN512有512K flash，每区2K
    ，共有256个区                                             */
    return FTFL_CODE_ERR;
  }
  
  // 计算区偏移地址
  union_addrs.addrs_word = (((uint32_t)iSectorNo) << 11) + iOffset;
  
  // 装载指令
  FTFL_FCCOB0 = FTFL_CMD_PGM4;  // 擦除扇区指令
  FTFL_FCCOB1 = union_addrs.addrs_byte[2];   // 扇区地址
  FTFL_FCCOB2 = union_addrs.addrs_byte[1];
  FTFL_FCCOB3 = union_addrs.addrs_byte[0];
  // 装载数据            
  FTFL_FCCOB4 = iByte[3];
  FTFL_FCCOB5 = iByte[2];
  FTFL_FCCOB6 = iByte[1];
  FTFL_FCCOB7 = iByte[0];
  
  if (FTFL_CODE_ERR == FTFL_IsCmdLaunched ())
  {
    // 若指令执行失败，返回错误码
    return FTFL_CODE_ERR;
  }
  // 操作成功，返回提示码
  return FTFL_CODE_SUCCESS;
}
/*******************************************************************************
* 函数名称：FTFL_ReadFlash
* 入口参数：uint16_t iSectorNo ：扇区号；uint16_t iOffset：偏移地址；uint16_t nByteCnt：读出数据的个数
* 返回参数：NULL：操作失败；uint8_t* addrsBkp：缓存区首地址
* 描    述：写入程序flash四个字节
*******************************************************************************/
uint8_t * FTFL_ReadFlash (uint16_t iSectorNo, uint16_t iOffset, uint16_t nByteCnt)
{
  uint32_t addrs = 0; // flash地址
  
  uint8_t* recBuffer = (uint8_t*) malloc (nByteCnt * sizeof (uint8_t)); // 分配接受缓存
  uint8_t* addrsBkp = NULL; // 缓存首地址备份
  if (NULL == recBuffer)
  {
    // 若分配失败，则说明内存堆已耗尽，返回错误
    return (uint8_t*)NULL;
  }
  addrsBkp = recBuffer; // 保存缓存地址
  // 计算目标地址
  addrs = (((uint32_t)iSectorNo) << 11) + iOffset;
  // 读取nByteCnt字节地址
  while (nByteCnt--)
  {
    *recBuffer++ = *((uint8_t*)addrs++); // -1是因为以addrs开始至addrs + n - 1
  }
  // 返回缓存区地址
  return addrsBkp;
}

