#!/bin/sh
mkdir -p artifacts
echo "memory snapshotOptions useCompression: true. saveAs: 'artifacts/core.snap'. quitNoSave" | Self -f ../objects/worldBuilder.self -b ../objects -o core 
