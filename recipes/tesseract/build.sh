#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]
then
    # for Mac OSX
    export CC=clang
    export CXX=clang++
    export MACOSX_VERSION_MIN="10.9"
    export MACOSX_DEPLOYMENT_TARGET="${MACOSX_VERSION_MIN}"
    export CMAKE_OSX_DEPLOYMENT_TARGET="${MACOSX_VERSION_MIN}"
    export CFLAGS="${CFLAGS} -mmacosx-version-min=${MACOSX_VERSION_MIN}"
    export CXXFLAGS="${CXXFLAGS} -mmacosx-version-min=${MACOSX_VERSION_MIN}"
    export CXXFLAGS="${CXXFLAGS} -stdlib=libc++"
    export LDFLAGS="${LDFLAGS} -headerpad_max_install_names"
    export LDFLAGS="${LDFLAGS} -mmacosx-version-min=${MACOSX_VERSION_MIN}"
    export LDFLAGS="${LDFLAGS} -lc++"
    export LINKFLAGS="${LDFLAGS}"
fi

./autogen.sh
LIBLEPT_HEADERSDIR=$PREFIX/include ./configure --prefix=$PREFIX --with-extra-libraries=$PREFIX/lib
LDFLAGS="-L$PREFIX/lib" CFLAGS="-I$PREFIX/include" make

make install

mkdir -p $PREFIX/share/tessdata
cd $PREFIX/share/tessdata
curl -L -O "https://github.com/tesseract-ocr/tessdata_fast/raw/4.0.0-beta.1/eng.traineddata"
curl -L -O "https://github.com/tesseract-ocr/tessdata_fast/raw/4.0.0-beta.1/osd.traineddata"
