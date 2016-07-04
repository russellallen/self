#!/bin/sh
mkdir -p artifacts
cd ../objects
echo "'../release/loadAll.self' runScript. desktop open. saveAs: '../release/artifacts/kitchensink.snap'. quitNoSave" | Self -f worldbuilder.self  -o morphic, ui1 
cd ../release