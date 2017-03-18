#!/usr/bin/env bash
./configure \
    CFLAGS="-I$PREFIX/include" \
    LDFLAGS="-Wl,-rpath -Wl,$PREFIX/lib" \
    --prefix=$PREFIX \
    --with-libpng=$PREFIX \
    --with-jpeg=$PREFIX \
    --with-libopenjpeg=$PREFIX \
    --with-libtiff=$PREFIX
make
make install
