FROM alpine:3.13 AS build

RUN apk --no-cache add libc6-compat device-mapper findutils build-base linux-headers go bash git wget cmake pkgconfig ndctl-dev make python3 && \
    apk --no-cache add zfs || true && \
    apk --no-cache add thin-provisioning-tools --repository http://dl-3.alpinelinux.org/alpine/edge/main/ && \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
    rm -rf /var/cache/apk/*

RUN wget https://sourceforge.net/projects/perfmon2/files/libpfm4/libpfm-4.11.0.tar.gz && \
  echo "112bced9a67d565ff0ce6c2bb90452516d1183e5  libpfm-4.11.0.tar.gz" | sha1sum -c  && \
  tar -xzf libpfm-4.11.0.tar.gz && \
  rm libpfm-4.11.0.tar.gz && \
  export DBG="-g -Wall" && \
  make -e -C libpfm-4.11.0 || true && \
  make install -C libpfm-4.11.0 || true && \
  rm -rf libpfm-4.11.0

RUN git clone -b v02.00.00.3820 https://github.com/intel/ipmctl/ && \
    cd ipmctl && \
    mkdir output && \
    cd output && \
    cmake -DRELEASE=ON -DCMAKE_INSTALL_PREFIX=/ -DCMAKE_INSTALL_LIBDIR=/usr/local/lib .. && \
    make -j all || true && \
    make install || true && \
    cd ../.. && \
    rm -rf ipmctl
