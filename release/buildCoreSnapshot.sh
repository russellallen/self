#!/bin/sh
mkdir -p artifacts
echo "saveAs: 'artifacts/core.snap'. quitNoSave" | Self -f ../objects/worldbuilder.self -b ../objects -o core 