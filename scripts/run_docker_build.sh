#!/usr/bin/env bash
REPO_ROOT=$(cd "$(dirname "$0")/.."; pwd;)

docker info

config=$(cat <<CONDARC
channels:
 - mcs07
 - defaults
conda-build:
 root-dir: /conda-recipes/build_artefacts
show_channel_urls: true
CONDARC
)

rm -f "$REPO_ROOT/build_artefacts/conda-forge-build-done"

cat << EOF | docker run -i \
                        -v "${REPO_ROOT}":/conda-recipes \
                        -a stdin -a stdout -a stderr \
                        condaforge/linux-anvil \
                        bash || exit 1

export BINSTAR_TOKEN=${BINSTAR_TOKEN}

echo "$config" > ~/.condarc
conda clean --lock
export CPU_COUNT=2
export PYTHONUNBUFFERED=1
conda config --set show_channel_urls true
conda config --set add_pip_as_python_dependency false
conda update -n root --yes --quiet --all
conda install -n root --yes --quiet -c conda-forge conda-build-all
conda install -n root --yes --quiet -c conda-forge autoconf automake

conda info
conda config --get

conda-build-all /conda-recipes/recipes --inspect-channels mcs07 --upload-channels mcs07 --matrix-conditions "numpy >=1.10" "python >=2.7,<3|>=3.4,<3.5|>=3.5,<3.6|>=3.6,<3.7"

EOF
