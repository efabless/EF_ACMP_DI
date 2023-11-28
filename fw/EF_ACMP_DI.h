#ifndef EF_ACMP_DI_H
#define EF_ACMP_DI_H

#include <stdint.h>
#include <EF_ACMP_DI_regs.h>

void EF_ACMP_DI_setSelectReg (uint32_t acmp_base, int value);

int EF_ACMP_DI_getSelectReg (uint32_t acmp_base);

int EF_ACMP_DI_getRawStatusReg (uint32_t acmp_base);

int EF_ACMP_DI_getMaskStatusReg (uint32_t acmp_base);

void EF_ACMP_DI_setInterruptMaskReg (uint32_t acmp_base, int value);

int EF_ACMP_DI_getInterruptMaskReg (uint32_t acmp_base);

void EF_ACMP_DI_setInterruptClearReg (uint32_t acmp_base, int value);

#endif