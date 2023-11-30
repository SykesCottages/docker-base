#!/bin/bash

# You need to provide your own creds because #security
docker login >>/dev/null 2>&1

VERSIONS=("ubuntu-20-04" "ubuntu-22-04")
for VERSION in "${VERSIONS[@]}"; do
  ./build.sh docker buildx build \
    --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm64/v8 \
    --quiet \
    --no-cache \
    --push \
    -t sykescottages/base:${VERSION} \
    $VERSION >>/dev/null 2>&1 &
done

wait
