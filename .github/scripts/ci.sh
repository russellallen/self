#!/bin/sh
# Build and test one Self VM flavour.  Used by .github/workflows/build.yml on
# every platform (runner, container or BSD guest), so it sticks to POSIX sh.
#
#   ci.sh build vm64|vm32 [extra cmake arguments...]
#   ci.sh test  vm64|vm32
#
# The steps mirror the self-ci recipes: configure and build with cmake, then
# (vm64 only) the VM's own tests, build a world with worldBuilder, reload it,
# and run the Self automatic test suite.
set -eu

mode=$1
kind=$2
shift 2

case "$kind" in
  vm64) src=vm64; snap=auto.snap64 ;;
  vm32) src=vm;   snap=auto.snap ;;
  *) echo "unknown VM kind: $kind" >&2; exit 2 ;;
esac

root=$(pwd)

self_binary() {
  if [ -x "$root/build/Self.app/Contents/MacOS/Self" ]; then
    echo "$root/build/Self.app/Contents/MacOS/Self"
  else
    echo "$root/build/Self"
  fi
}

case "$mode" in
  build)
    ncpu=$(getconf _NPROCESSORS_ONLN 2>/dev/null || sysctl -n hw.ncpu)
    quartz=
    [ "$(uname -s)" = Darwin ] || quartz=-DSELF_QUARTZ=OFF
    cmake -S "$src" -B build -DCMAKE_BUILD_TYPE=Release $quartz "$@"
    cmake --build build -j"$ncpu"
    ls -l "$(self_binary)"
    ;;

  test)
    SELF=$(self_binary)

    if [ "$kind" = vm64 ]; then
      echo "== VM tests"
      "$SELF" --vm-run-tests
    fi

    echo "== Building a world"
    (cd objects && echo "saveAs: '$snap'. _Quit" | "$SELF" -f worldBuilder.self -o morphic)

    echo "== Reloading the world"
    echo "_Quit" | "$SELF" -s "objects/$snap"

    echo
    echo "== Self automatic tests"
    # The Self console quits when stdin reaches end of file, which would end
    # the suite early and still exit 0.  Hold stdin open through a fifo.
    fifo=${TMPDIR:-/tmp}/self-ci-stdin.$$
    rm -f "$fifo"
    mkfifo "$fifo"
    sleep 14400 > "$fifo" &
    holder=$!
    rc=0
    "$SELF" -s "objects/$snap" --runAutomaticTests --headless < "$fifo" || rc=$?
    kill "$holder" 2>/dev/null || true
    wait "$holder" 2>/dev/null || true
    rm -f "$fifo"
    exit "$rc"
    ;;

  *)
    echo "unknown mode: $mode" >&2
    exit 2
    ;;
esac
