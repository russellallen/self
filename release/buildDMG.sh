#/bin/sh

# Assumes everything in artifacts/

# Copy what we need
rm -r ../build
mkdir -p ../build

cp artifacts/*.snap ../build
cp -r artifacts/Self\ Control.app ../build

hdiutil create -volname "$1" -srcfolder ../build/ -ov -format UDZO $2.dmg

mv $2.dmg artifacts/

rm -r ../build