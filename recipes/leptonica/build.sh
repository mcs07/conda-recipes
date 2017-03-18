#!/usr/bin/env bash
export LDFLAGS="-Wl,-rpath -Wl,$PREFIX/lib"
export CFLAGS="-I$PREFIX/include"
./autobuild
./configure --prefix=$PREFIX
make
make install
