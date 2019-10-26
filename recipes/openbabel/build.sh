#!/bin/bash

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_BUILD_TYPE=Release \
      -DWITH_INCHI=ON \
      -DOPENBABEL_USE_SYSTEM_INCHI=ON \
      -DWITH_MAEPARSER=OFF \
      -DRUN_SWIG=ON \
      -DPYTHON_BINDINGS=ON \
      -DPYTHON_EXECUTABLE=$PYTHON \
      .


make -j${CPU_COUNT}
make install
