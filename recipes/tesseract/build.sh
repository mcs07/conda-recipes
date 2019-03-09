#!/usr/bin/env bash

pushd tesseract

autoreconf -fi
./autogen.sh
mkdir build && cd build
../configure --prefix="${PREFIX}"
make -j $CPU_COUNT
make install
popd

pushd tessdata_fast
cp -avf eng.traineddata $PREFIX/share/tessdata
cp -avf osd.traineddata $PREFIX/share/tessdata
