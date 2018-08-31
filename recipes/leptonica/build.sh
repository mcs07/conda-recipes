#!/usr/bin/env bash

# This is a temporary hack until all dependencies filter their .la files
find $PREFIX -name '*.la' -delete

./autobuild
./configure --prefix=$PREFIX
make -j$CPU_COUNT
make install

# Filter .la files: See https://github.com/conda-forge/conda-forge.github.io/issues/621
# Also: https://github.com/conda/conda-build/pull/3102
find $PREFIX -name '*.la' -delete
