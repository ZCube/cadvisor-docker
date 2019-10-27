# cAdvisor (https://github.com/google/cadvisor)

* arm, arm64, 386, x86_64 supported
* Raspberry Pi tested
* v0.34.0 release build (2019-10-27)
* multi-stage build
* not official image

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

build by docker buildx 

```
docker buildx rm mybuilder
docker buildx create --use --name mybuilder
docker buildx inspect --bootstrap

docker buildx build --pull . -t zcube/cadvisor:latest --platform linux/386,linux/amd64,linux/arm64,linux/arm/v6,linux/arm/v7 --push
docker buildx build --pull . -t zcube/cadvisor:v0.34.0 --platform linux/386,linux/amd64,linux/arm64,linux/arm/v6,linux/arm/v7 --push
```
