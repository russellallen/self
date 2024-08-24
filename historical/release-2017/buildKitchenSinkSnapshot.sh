#!/bin/sh
mkdir -p artifacts
cd ../objects
echo "'../release/loadAll.self' runScript. desktop open. memory snapshotOptions useCompression: true. saveAs: '../release/artifacts/kitchensink.snap'. quitNoSave" | Self -f worldBuilder.self  -o morphic, ui1 
cd ../release
