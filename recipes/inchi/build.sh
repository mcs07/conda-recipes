#!/bin/sh

# Build libinchi
mkdir -p $SRC_DIR/INCHI_API/bin/Linux
mkdir -p $PREFIX/lib
cd $SRC_DIR/INCHI_API/libinchi/gcc
make ISLINUX=1
cp $SRC_DIR/INCHI_API/bin/Linux/libinchi.so.1.05.00 $PREFIX/lib/libinchi.so.1.05.00
cp $SRC_DIR/INCHI_API/bin/Linux/libinchi.so.1 $PREFIX/lib/libinchi.so.1

# Build inchi-1 executable
mkdir -p $SRC_DIR/INCHI_EXE/bin/Linux
mkdir -p $PREFIX/bin
cd $SRC_DIR/INCHI_EXE/inchi-1/gcc
make ISLINUX=1
cp $SRC_DIR/INCHI_EXE/bin/Linux/inchi-1 $PREFIX/bin/inchi-1
