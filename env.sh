#!/bin/sh
if [ -f /usr/local/lib/libpfm.so ]
then
  export GO_TAGS=${GO_TAGS},libpfm
fi
if [ -f /usr/local/lib/libipmctl.so ]
then
  export GO_TAGS=${GO_TAGS},libipmctl
fi
export GO_FLAGS="-tags=${GO_TAGS}"
echo $GO_FLAGS
