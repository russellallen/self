#!/bin/sh
mkdir -p artifacts
echo "desktop open. memory snapshotOptions useCompression: true. saveAs: 'artifacts/morphic.snap'. quitNoSave" | Self -f ../objects/worldBuilder.self -b ../objects -o morphic 
