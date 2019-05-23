#!/bin/env bash

./configure --prefix=$PREFIX \
    --with-openbabel-include=$PREFIX/include/openbabel-2.0 \
    --with-openbabel-lib=$PREFIX/lib \
    CXXFLAGS="$CXXFLAGS -Wno-c++11-narrowing"
make
make install
