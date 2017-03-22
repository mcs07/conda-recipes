#!/usr/bin/env bash
export CFLAGS="-g -O2 -I$PREFIX/include"
export LDFLAGS="-Wl,-rpath -Wl,$PREFIX/lib"
./autobuild
./configure --prefix=$PREFIX --with-libpng --with-jpeg --with-libopenjpeg --with-libtiff
make
make install
