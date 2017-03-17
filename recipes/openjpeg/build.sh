#!/usr/bin/env bash

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D TIFF_LIBRARY=$PREFIX/lib/libtiff${SHLIB_EXT} \
      -D TIFF_INCLUDE_DIR=$PREFIX/include \
      -D PNG_LIBRARY_RELEASE=$PREFIX/lib/libpng${SHLIB_EXT} \
      -D PNG_PNG_INCLUDE_DIR=$PREFIX/include \
      -D ZLIB_LIBRARY=$PREFIX/lib/libz${SHLIB_EXT} \
      -D ZLIB_INCLUDE_DIR=$PREFIX/include \
      .

make
make tests
make install
make clean
