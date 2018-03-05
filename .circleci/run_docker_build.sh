#!/usr/bin/env bash

# Unused, but needed by conda-build currently... :(
export CONDA_NPY='19'

conda config --add channels conda-forge
conda config --add channels mcs07
conda config --set show_channel_urls true
conda update conda conda-build
conda install --yes --quiet conda-build-all
conda install --yes --quiet conda-forge-build-setup
source run_conda_forge_build_setup

conda info
conda config --get

conda build-all ./recipes --inspect-channels mcs07 --upload-channels mcs07 --matrix-conditions "numpy >=1.11" "python >=2.7,<3|>=3.5" "r-base >=3.3.2"
EOF
