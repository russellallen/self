#!/bin/sh
mkdir -p artifacts
echo "saveAs: 'artifacts/morphic.snap'. quitNoSave" | Self -f ../objects/worldBuilder.self -b ../objects -o morphic 