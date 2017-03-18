#!/usr/bin/env bash
export LDFLAGS="-Wl,-rpath -Wl,$PREFIX/lib"
export CFLAGS="-I$PREFIX/include"
./configure --prefix=$PREFIX  --with-libpng --with-jpeg --with-libopenjpeg --with-libtiff
make
make install
