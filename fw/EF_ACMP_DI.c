#ifndef EF_ACMP_DI_C
#define EF_ACMP_DI_C

#include <EF_ACMP_DI.h>

void EF_ACMP_DI_setSelectReg (uint32_t acmp_base, int value){

    EF_ACMP_DI_TYPE* acmp = (EF_ACMP_DI_TYPE*)acmp_base;
    acmp->SEL = value;

}

int EF_ACMP_DI_getSelectReg (uint32_t acmp_base){

    EF_ACMP_DI_TYPE* acmp = (EF_ACMP_DI_TYPE*)acmp_base;
    return (acmp->SEL);

}

int EF_ACMP_DI_getRawStatusReg (uint32_t acmp_base) {

    EF_ACMP_DI_TYPE* acmp = (EF_ACMP_DI_TYPE*)acmp_base;
    return (acmp->ris);
}

int EF_ACMP_DI_getMaskStatusReg (uint32_t acmp_base) {

    EF_ACMP_DI_TYPE* acmp = (EF_ACMP_DI_TYPE*)acmp_base;
    return (acmp->mis);
}

void EF_ACMP_DI_setInterruptMaskReg (uint32_t acmp_base, int value) {

    EF_ACMP_DI_TYPE* acmp = (EF_ACMP_DI_TYPE*)acmp_base;
    acmp->im = value;
}

int EF_ACMP_DI_getInterruptMaskReg (uint32_t acmp_base) {

    EF_ACMP_DI_TYPE* acmp = (EF_ACMP_DI_TYPE*)acmp_base;
    return (acmp->im);
}

void EF_ACMP_DI_setInterruptClearReg (uint32_t acmp_base, int value) {

    EF_ACMP_DI_TYPE* acmp = (EF_ACMP_DI_TYPE*)acmp_base;
    acmp->icr = value;
}

#endif