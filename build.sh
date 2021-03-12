#/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'No arguments supplied! Please add version as argument.'
    exit 1
fi

TAG="$1"
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker buildx rm mybuilder
docker buildx create --use --name mybuilder --driver docker-container
docker buildx inspect --bootstrap
docker buildx build --build-arg CADVISOR_VERSION="$TAG" --pull . -t nazman/cadvisor:"$TAG" -t nazman/cadvisor:latest --platform linux/arm64,linux/arm/v7,linux/arm/v6 --push
