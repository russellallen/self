Self
====

This is the main repository for the Self programming language and environment.

The Self homepage is at http://selflanguage.org

Please go there for documentation, blogs and forums.

For information on:

  * Using Self, read the [Self Handbook][1]
  * Building a Self VM, read the Handbook's [VM building instructions][2]
  * Building a Self World, read the [world building instructions][3]

The Handbook's source is in `docs/handbook`. The published Handbook describes
Self 2017.1, so where it differs from the notes below, the notes are right.


Current state
=============

This is the development version, working towards Self 2026.1. `ChangeLog.md`
lists what has changed since the last release, Self 24.01.

The Self VM comes in two flavours:

  * `vm64` is the 64-bit VM, for x86_64 and aarch64 (ARM64). It builds on
    macOS (Apple Silicon), Linux (glibc and musl), FreeBSD and NetBSD. On macOS
    it uses Quartz for its windows; elsewhere it uses X11.
  * `vm` is the original 32-bit VM, for i386, PowerPC and SPARC. It builds on
    Linux, FreeBSD and NetBSD, and on Mac OS X versions old enough to run 32-bit
    programs.

The 64-bit VM can load snapshots saved by the 32-bit VM, but the 32-bit VM cannot load 64-bit ones.

The 32-bit VM has three tiers: at base is an interpreter, which is mostly unused. The VM spends most of its time in a fast compiler (the NIC) and compiles hotspots using the slower SIC. The 64-bit VM only has the interpreter and the SIC at this point. The two share most of their source: many files in `vm64` are links to the files in `vm`.


Building
========

You need git, cmake (3.12 or later) and a C++ compiler (gcc or clang). On
systems other than macOS you also need the X11 development libraries, and for
the 32-bit VM on a 64-bit system, their 32-bit versions.

To build the 64-bit VM:

```
cmake -S vm64 -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j8
```

To build the 32-bit VM, use `-S vm` instead of `-S vm64`.

The VM is `build/Self.app/Contents/MacOS/Self` on macOS and `build/Self`
elsewhere. To see what you have built:

```
Self --vm-version
```

To build a world with the Morphic desktop and save it as a snapshot (on macOS,
use the longer path to the VM):

```
cd objects
echo "saveAs: 'my.snap64'. _Quit" | ../build/Self -f worldBuilder.self -o morphic
```

and to start it:

```
../build/Self -s my.snap64
```

At the Self prompt, `desktop open` opens the desktop. By convention 64-bit
snapshots end in `.snap64` and 32-bit ones in `.snap`.

There are no prebuilt binaries of this development version yet.


Versions
========

The version number of both VMs comes from the `VERSION` file. It reads
`2026.1-dev` while working towards 2026.1, and plain `2026.1` only in the
commit that is released.


AI Disclosure Statement
=======================

The 64-bit port is LLM assisted, using primarily Anthropic's Claude (Fable). Multiple LLMs have been used for diagnosing VM issues and debugging generally.


[1]: http://handbook.selflanguage.org/2017.1/
[2]: http://handbook.selflanguage.org/2017.1/buildvm.html
[3]: http://handbook.selflanguage.org/2017.1/buildworld.html
