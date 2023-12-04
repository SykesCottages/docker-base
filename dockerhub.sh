#!/bin/bash

VERSIONS=("ubuntu-20-04" "ubuntu-22-04")
ARCH=$(arch)

docker login >>/dev/null 2>&1

if [ "x86_64" == "$ARCH" ]; then
  ARCH=amd64
elif [ "aarch64" == "$ARCH" ]; then
  ARCH=arm64
else
  echo "Architecture ${ARCH} not supported."
  exit 1
fi

echo "Building ${ARCH} images"
for VERSION in "${VERSIONS[@]}"; do
  ./build.sh $VERSION $ARCH >>/dev/null 2>&1 &
done

wait
