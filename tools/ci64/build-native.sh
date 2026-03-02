#!/bin/bash
# build-native.sh — Build vm64 natively on macOS
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

BUILD_DIR="$PROJECT_ROOT/build-ci-macos"
NCPU=$(sysctl -n hw.ncpu)

echo "--- macOS native build ---"
echo "Build dir: $BUILD_DIR"
echo "CPUs: $NCPU"

cmake -S "$PROJECT_ROOT/vm64" -B "$BUILD_DIR" -DCMAKE_BUILD_TYPE=Release
rm -f "$BUILD_DIR/incls/_precompiled.hh.gch"
cmake --build "$BUILD_DIR" -j"$NCPU"

echo "--- Running VM tests ---"
SELFVM="$BUILD_DIR/Self.app/Contents/MacOS/Self"
$SELFVM --vm-run-tests

echo "--- Testing Building an Snapshot ---"
cd objects
echo "saveAs: auto.snap64. _Quit" | $SELFVM -f worldbuilder.self -o morphic
cd ..

echo "--- Testing Loading a Snapshot ---"
echo "_Quit" | $SELFVM -s objects/auto.snap64

echo "--- Running Self tests ---"
$SELFVM -s objects/auto.snap64 --runAutomaticTests

echo "--- macOS native build: SUCCESS ---"
