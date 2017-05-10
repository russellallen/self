#!/bin/sh
cd src
make html
cp -r _build/html ../built/
make epub
cp _build/epub/SelfHandbook.epub ../built/
make latexpdf
cp _build/latex/SelfHandbook.pdf ../built/
cd ..
