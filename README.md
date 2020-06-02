# cAdvisor (https://github.com/google/cadvisor)

* 386, amd64, arm/v6, arm/v7, arm64, ppc64le, s390x supported
* Raspberry Pi tested
* latest (v0.35.0) release build (2020-06-03)
* v0.35.0 release build (2020-06-03)
* v0.36.0 pre-release build (2020-06-03)
* multi-stage build
* not official image

# Tags

## prerelease

* v0.36.0 v0.36

## release

* v0.35.0 v0.35 latest
* v0.34.0 v0.34
* v0.33.1 v0.33

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
  zcube/cadvisor:latest
```

# Build

* build by docker buildx 
```
docker buildx rm mybuilder
docker buildx create --use --name mybuilder
docker buildx inspect --bootstrap
docker buildx build --build-arg CADVISOR_VERSION=v0.35.0 --pull . -t zcube/cadvisor:v0.35.0 --platform linux/386,linux/amd64,linux/arm64,linux/arm/v6,linux/arm/v7 --push
docker buildx build --build-arg CADVISOR_VERSION=v0.35.0 --pull . -t zcube/cadvisor:v0.35 --platform linux/386,linux/amd64,linux/arm64,linux/arm/v6,linux/arm/v7 --push
docker buildx build --build-arg CADVISOR_VERSION=v0.35.0 --pull . -t zcube/cadvisor:latest --platform linux/386,linux/amd64,linux/arm64,linux/arm/v6,linux/arm/v7 --push
docker buildx build --build-arg CADVISOR_VERSION=v0.36.0 --pull . -t zcube/cadvisor:v0.36.0 --platform linux/386,linux/amd64,linux/arm64,linux/arm/v6,linux/arm/v7 --push
docker buildx build --build-arg CADVISOR_VERSION=v0.36.0 --pull . -t zcube/cadvisor:v0.36 --platform linux/386,linux/amd64,linux/arm64,linux/arm/v6,linux/arm/v7 --push
```

# links
* github : https://github.com/zcube/cadvisor-docker
* docker hub : https://hub.docker.com/r/zcube/cadvisor
