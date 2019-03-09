#!/usr/bin/env bash

REPO_ROOT=$(cd "$(dirname "$0")/.."; pwd;)
IMAGE_NAME="condaforge/linux-anvil-comp7"

docker info

# In order for the conda-build process in the container to write to the mounted
# volumes, we need to run with the same id as the host machine, which is
# normally the owner of the mounted volumes, or at least has write permission
HOST_USER_ID=$(id -u)
# Check if docker-machine is being used (normally on OSX) and get the uid from
# the VM
if hash docker-machine 2> /dev/null && docker-machine active > /dev/null; then
    HOST_USER_ID=$(docker-machine ssh $(docker-machine active) id -u)
fi

docker run -it \
           -v ${REPO_ROOT}:/home/conda/conda-recipes \
           -e HOST_USER_ID=${HOST_USER_ID} \
           $IMAGE_NAME \
           bash \
           /home/conda/conda-recipes/.circleci/build_steps.sh
