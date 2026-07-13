/* Copyright 2026 AUTHORS.
   See the LICENSE file for license information. */

#ifndef SELF_LIB_H
#define SELF_LIB_H

#include "selfHelpers.h"

#ifdef __cplusplus
extern "C" {
#endif

int self_lib_init(int vm_abi_major, const SelfHelpers* h);

#ifdef __cplusplus
}
#endif

#endif
