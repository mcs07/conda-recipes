#!/bin/env bash

./configure --prefix=$PREFIX \
    --with-gocr-include=$PREFIX/include/gocr \
    --with-gocr-lib=$PREFIX/lib \
    --with-openbabel-include=$PREFIX/include/openbabel-2.0 \
    --with-openbabel-lib=$PREFIX/lib \
    --with-graphicsmagick-include=$PREFIX/include \
    --with-graphicsmagick-lib=$PREFIX/lib \
    --with-tesseract \
    --with-tesseract-include=$PREFIX/include/tesseract \
    --with-tesseract-lib=$PREFIX/lib \
    CXXFLAGS="$CXXFLAGS -Wno-c++11-narrowing"
make
make install
