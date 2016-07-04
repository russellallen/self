#!/bin/sh
mkdir -p artifacts
echo "saveAs: 'artifacts/morphic.snap'. quitNoSave" | Self -f ../objects/worldbuilder.self -b ../objects -o morphic 