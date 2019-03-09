#!/usr/bin/env bash

set -xeuo pipefail
export PYTHONUNBUFFERED=1

cat >~/.condarc <<CONDARC
channels:
 - mcs07
 - conda-forge
 - defaults
show_channel_urls: true
CONDARC

conda install --yes --quiet conda-forge-ci-setup=2.* conda-forge-pinning networkx conda-build>=3.16
source run_conda_forge_build_setup

# yum installs anything from a "yum_requirements.txt" file that isn't a blank line or comment.
find /home/conda/conda-recipes/recipes -mindepth 2 -maxdepth 2 -type f -name "yum_requirements.txt" \
    | xargs -n1 cat | { grep -v -e "^#" -e "^$" || test $? == 1; } | \
    xargs -r /usr/bin/sudo -n yum install -y

python /home/conda/conda-recipes/.ci_support/build_all.py /home/conda-recipes/recipes
