#!/usr/bin/env bash
./configure CFLAGS="-I$PREFIX/include" LDFLAGS="-Wl,-rpath -Wl,$PREFIX/lib" --prefix=$PREFIX  --with-libpng --with-jpeg --with-libopenjpeg --with-libtiff
make
make install
