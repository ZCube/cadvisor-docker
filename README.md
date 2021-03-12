# cAdvisor for ARM (https://github.com/google/cadvisor)

Forked from https://github.com/ZCube/cadvisor-docker

* arm/v6, arm/v7, arm64 supported
* Raspberry Pi tested
* latest (v0.37.0) release build (2021-03-12)

# Usage

* from official readme (https://github.com/google/cadvisor)
```
sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  nazman/cadvisor:latest
```

# Build

Build using **docker buildx**
```
TAG=v0.37.0
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker buildx rm mybuilder
docker buildx create --use --name mybuilder --driver docker-container
docker buildx inspect --bootstrap
docker buildx build --build-arg CADVISOR_VERSION="TAG" --pull . -t nazman/cadvisor:"$TAG" -t nazman/cadvisor:latest --platform linux/arm64,linux/arm/v7,linux/arm/v6 --push

```
Build using **build.sh** script
````
sh ./build.sh v0.37.0
````
# Links
* https://hub.docker.com/r/nazman/cadvisor

