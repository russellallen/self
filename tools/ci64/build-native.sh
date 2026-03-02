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
"$BUILD_DIR/Self" --vm-run-tests

echo "--- macOS native build: SUCCESS ---"
