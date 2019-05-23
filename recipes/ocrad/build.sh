#!/usr/bin/env bash

# Manually extract source archive as conda-build doesn't automatically support lzip
lzip -d ocrad-$PKG_VERSION.tar.lz
tar xvf ocrad-$PKG_VERSION.tar --strip-components=1

./configure --prefix=$PREFIX
make
make install
