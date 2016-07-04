#/bin/sh

# Assumes everything in artifacts/

# Copy what we need
rm -r ../build
mkdir -p ../build/$1

cp artifacts/*.snap ../build/$1
cp -r artifacts/Self ../build/$1
chmod a+x ../build/$1/Self

cd ../build
zip -r $1.zip $1

mv $1.zip ../release/artifacts/

cd ../release
rm -r ../build