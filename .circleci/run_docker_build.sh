#!/usr/bin/env bash

REPO_ROOT=$(cd "$(dirname "$0")/.."; pwd;)
IMAGE_NAME="condaforge/linux-anvil"

docker info

config=$(cat <<CONDARC
channels:
 - mcs07
 - conda-forge
 - defaults
conda-build:
 root-dir: /home/conda/conda-recipes/build_artifacts
always_yes: true
show_channel_urls: true
CONDARC
)

rm -f "$REPO_ROOT/build_artefacts/conda-forge-build-done"

cat << EOF | docker run -i \
                        -v "${REPO_ROOT}":/conda-recipes \
                        -a stdin -a stdout -a stderr \
                        $IMAGE_NAME \
                        bash -ex || exit $?
if [ "${BINSTAR_TOKEN}" ];then
    export BINSTAR_TOKEN=${BINSTAR_TOKEN}
fi
# Unused, but needed by conda-build currently... :(
export CONDA_NPY='19'
echo "$config" > ~/.condarc
# A lock sometimes occurs with incomplete builds. The lock file is stored in build_artifacts.
conda clean --lock
conda update conda conda-build
conda install conda-build-all
conda install conda-forge-build-setup
source run_conda_forge_build_setup
# yum installs anything from a "yum_requirements.txt" file that isn't a blank line or comment.
find /conda-recipes -mindepth 2 -maxdepth 2 -type f -name "yum_requirements.txt" \
    | xargs -n1 cat | grep -v -e "^#" -e "^$" | \
    xargs -r /usr/bin/sudo -n yum install -y
conda info
conda config --get
conda build-all /conda-recipes/recipes --inspect-channels mcs07 --upload-channels mcs07 --matrix-conditions "numpy >=1.11" "python >=2.7,<3|>=3.5" "r-base >=3.3.2"
EOF
