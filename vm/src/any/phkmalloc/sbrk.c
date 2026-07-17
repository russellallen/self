/*
 * Copyright (c) 2026 Valery Ushakov
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <sys/syscall.h>

#include <errno.h>
#include <stdint.h>
#include <unistd.h>


#define FAILED do {				\
                errno = ENOMEM;			\
                return ((void *)-1);		\
        } while (0)

void *
sbrk(intptr_t incr)
{
    uintptr_t old = (uintptr_t)syscall(__NR_brk, 0);
    if (incr == 0) {
	return (void *)old;
    }

    if (incr < 0) {
	if ((uintptr_t)-incr > old)
	    FAILED;
    }
    else {
	if (UINTPTR_MAX - incr < old)
	    FAILED;
    }

    uintptr_t req = old + incr;
    uintptr_t new = (uintptr_t)syscall(__NR_brk, (void *)req);
    if (new != req)
	FAILED;

    return (void *)old;
}
