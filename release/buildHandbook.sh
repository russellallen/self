#!/bin/sh

pushd ../docs/handbook
make singlehtml
make latexpdf

cp _build/latex/*.pdf  ../../release/artifacts
mkdir ../../release/artifacts/handbook
cp -r _build/singlehtml/* ../../release/artifacts/handbook

popd
