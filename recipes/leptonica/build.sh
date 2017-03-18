#!/usr/bin/env bash
./autobuild
LDFLAGS="-Wl,-rpath -Wl,$PREFIX/lib" CFLAGS="-I$PREFIX/include" ./configure --prefix=$PREFIX --with-libpng --with-jpeg --with-libopenjpeg --with-libtiff
make
make install
