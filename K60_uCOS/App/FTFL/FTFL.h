#ifndef _FTFL_H
#define _FTFL_H

#include "../KinetisDrivers/KinetisConfig.h"

#define FTFL_IsCmdFinish() ((FTFL_FSTAT & FTFL_FSTAT_CCIF_MASK) >> FTFL_FSTAT_CCIF_SHIFT)
#define FTFL_IsAccessErr() ((FTFL_FSTAT & FTFL_FSTAT_ACCERR_MASK) >> FTFL_FSTAT_ACCERR_SHIFT)
#define FTFL_IsProtectionViolated() ((FTFL_FSTAT & FTFL_FSTAT_FPVIOL_MASK) >> FTFL_FSTAT_FPVIOL_SHIFT)
#define FTFL_ClearErrBits() (FTFL_FSTAT |= 0x30)

#define FTFL_CMD_PGM4 0x06               // 写入一个长字，即4字节
#define FTFL_CMD_EFS  0x09               // 擦出一个扇区
#define FTFL_CODE_ERR 0xf0               // FTFL操作错误
#define FTFL_CODE_SUCCESS 0xf1           // FTFL操作成功

extern void FTFL_Init (void);
extern uint8_t FTFL_IsCmdLaunched (void);
extern uint8_t FTFL_EraseSector (uint16_t iSectorNo);
extern uint8_t FTFL_WriteLongWord (uint16_t iSectorNo, uint16_t iOffset, uint8_t iByte[4]);
extern uint8_t* FTFL_ReadFlash (uint16_t iSectorNo, uint16_t iOffset, uint16_t nByteCnt);
#endif
