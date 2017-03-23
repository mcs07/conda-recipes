#!/usr/bin/env bash
export CFLAGS="-g -O2 -I$PREFIX/include"
export LDFLAGS="-Wl,-rpath -Wl,-L$PREFIX/lib"
./configure --prefix=$PREFIX --with-libpng --with-jpeg --with-libopenjpeg --with-libtiff
make
make install
