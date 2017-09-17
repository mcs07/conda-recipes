#!/usr/bin/env bash

export LDFLAGS="-L$PREFIX/lib" 
export CFLAGS="-I$PREFIX/include"
python setup.py install --single-version-externally-managed --record record.txt
