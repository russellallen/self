#!/bin/sh
mkdir -p artifacts
echo "saveAs: 'artifacts/core.snap'. quitNoSave" | Self -f ../objects/worldBuilder.self -b ../objects -o core 