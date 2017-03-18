#!/usr/bin/env bash
./autobuild
LDFLAGS="-Wl,-rpath -Wl,$PREFIX/lib" CFLAGS="-I$PREFIX/include" ./configure --prefix=$PREFIX
make
make install
