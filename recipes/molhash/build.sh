#!/bin/bash

mkdir build
cd build

cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_PREFIX_PATH=$PREFIX \
    -D CMAKE_INSTALL_PREFIX=$PREFIX \
    -D TARGET=RDKIT \
    -D RDKIT_DIR=$PREFIX \
    ..

cmake --build . --config Release

cp molhash "$PREFIX/bin/"
cp libmolhashlib.a "$PREFIX/lib/"
