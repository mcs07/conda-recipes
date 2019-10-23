#!/bin/bash

set -ex

scons install -j $CPU_COUNT PREFIX=$PREFIX
