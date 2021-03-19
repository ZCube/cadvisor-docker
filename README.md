# cAdvisor (https://github.com/google/cadvisor)

* 386, amd64, arm/v6, arm/v7, arm64, ppc64le, s390x supported
* Raspberry Pi tested
* multi-stage build
* not official image
* build by latest release tag
* not maintained actively, but I'll check this repository quarterly
* scheduled monthly
* s390x building is too buggy. so non CGO enabled cross compiled binary used.
* libipmctl build on amd64
* libpfm build on 386, amd64, arm/v6, arm/v7, arm64, ppc64le, s390x

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

# links
* github : https://github.com/zcube/cadvisor-docker
* docker hub : https://hub.docker.com/r/zcube/cadvisor
