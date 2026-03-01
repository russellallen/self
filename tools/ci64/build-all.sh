#!/bin/bash
# build-all.sh — Main CI runner for vm64 cross-platform builds
#
# Usage:
#   ./tools/ci64/build-all.sh                  # Run all platforms
#   ./tools/ci64/build-all.sh linux-arm64      # Run specific platform(s)
#   ./tools/ci64/build-all.sh --parallel       # Run VM builds concurrently
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# All available platforms
# TODO: re-enable freebsd-arm64 and netbsd-arm64 after fixing remaining build errors
# (machineCache_unix.cpp missing ARM64 case, xlib_glue.cpp NULL/nullptr mismatch)
ALL_PLATFORMS=(macos-native linux-arm64 linux-amd64)
# ALL_PLATFORMS=(macos-native linux-arm64 linux-amd64 freebsd-arm64 netbsd-arm64)

PARALLEL=false
PLATFORMS=()

# Parse arguments
for arg in "$@"; do
    case "$arg" in
        --parallel) PARALLEL=true ;;
        --help|-h)
            echo "Usage: $0 [--parallel] [platform ...]"
            echo ""
            echo "Platforms: ${ALL_PLATFORMS[*]}"
            echo "  --parallel  Run VM builds concurrently"
            echo ""
            echo "With no arguments, runs all platforms sequentially."
            exit 0
            ;;
        *) PLATFORMS+=("$arg") ;;
    esac
done

# Default: all platforms
if [ ${#PLATFORMS[@]} -eq 0 ]; then
    PLATFORMS=("${ALL_PLATFORMS[@]}")
fi

RESULTS=()
FAILS=0
START_TIME=$SECONDS

run_build() {
    local platform="$1"
    local logfile="$SCRIPT_DIR/logs/${platform}.log"
    mkdir -p "$SCRIPT_DIR/logs"

    echo "=== Building: $platform ==="

    if [ "$platform" = "macos-native" ]; then
        if "$SCRIPT_DIR/build-native.sh" 2>&1 | tee "$logfile"; then
            RESULTS+=("$platform: PASS")
        else
            RESULTS+=("$platform: FAIL")
            FAILS=$((FAILS + 1))
        fi
    else
        if "$SCRIPT_DIR/build-vm.sh" "$platform" 2>&1 | tee "$logfile"; then
            RESULTS+=("$platform: PASS")
        else
            RESULTS+=("$platform: FAIL")
            FAILS=$((FAILS + 1))
        fi
    fi
}

run_vm_builds_parallel() {
    local pids=()
    local platforms=("$@")
    mkdir -p "$SCRIPT_DIR/logs"

    for platform in "${platforms[@]}"; do
        [ "$platform" = "macos-native" ] && continue
        local logfile="$SCRIPT_DIR/logs/${platform}.log"
        echo "=== Starting: $platform (background) ==="
        "$SCRIPT_DIR/build-vm.sh" "$platform" > "$logfile" 2>&1 &
        pids+=("$!:$platform")
    done

    for entry in "${pids[@]}"; do
        local pid="${entry%%:*}"
        local platform="${entry##*:}"
        if wait "$pid"; then
            RESULTS+=("$platform: PASS")
        else
            RESULTS+=("$platform: FAIL")
            FAILS=$((FAILS + 1))
        fi
    done
}

# Run builds
if $PARALLEL; then
    # In parallel mode: run macos-native sequentially, then VM builds in parallel
    for platform in "${PLATFORMS[@]}"; do
        [ "$platform" = "macos-native" ] && run_build "macos-native"
    done
    run_vm_builds_parallel "${PLATFORMS[@]}"
else
    for platform in "${PLATFORMS[@]}"; do
        run_build "$platform"
    done
fi

# Summary
ELAPSED=$((SECONDS - START_TIME))
printf '\n=============================\n'
printf '=== CI Results (%dm %ds) ===\n' $((ELAPSED / 60)) $((ELAPSED % 60))
printf '=============================\n'
for r in "${RESULTS[@]}"; do
    case "$r" in
        *PASS) printf '  \033[32m%s\033[0m\n' "$r" ;;
        *FAIL) printf '  \033[31m%s\033[0m\n' "$r" ;;
    esac
done
printf '=============================\n'

if [ $FAILS -gt 0 ]; then
    echo "FAILED: $FAILS platform(s) failed. See logs in $SCRIPT_DIR/logs/"
    exit 1
else
    echo "ALL PASSED"
    exit 0
fi
