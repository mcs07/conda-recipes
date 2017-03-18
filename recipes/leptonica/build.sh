#!/usr/bin/env bash
./autobuild
./configure --prefix=$PREFIX --with-libpng --with-jpeg --with-libopenjpeg --with-libtiff
make
make install
