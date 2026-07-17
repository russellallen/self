# phkmalloc

This is a copy of [phkmalloc](https://phk.freebsd.dk/sagas/phkmalloc/)
taken out of NetBSD libc `src/lib/libc/stdlib/malloc.c`.

Self is 32-bit only and it wants its objects to live in the lower 2GB
of the address space, so modern thread-aware, mmap(2)-based allocators
make it unhappy.

[jemalloc](https://jemalloc.net/) can be told to use sbrk(2), but on
sparc Self compiler uses one of the
[global registers](https://github.com/russellallen/self/issues/149)
that modern ABI uses for TLS, and since jemalloc uses TLS, it cannot
be used for Self on sparc (until the compiler is fixed, but that's way
above my hobby project time budget).

Since it's already here anyway, it can also be used on
[Alpine](https://alpinelinux.org/) that still provides 32-bit x86
support, but uses [musl](https://musl.libc.org/) C library, that
doesn't provide sbrk(2) emulation.

-uwe
