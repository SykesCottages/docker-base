#!/bin/bash

LATEST_VERSION=ubuntu-22-04

# You need to provide your own creds because #security
docker login >>/dev/null 2>&1

VERSIONS=("ubuntu-20-04" "ubuntu-22-04")
for VERSION in "${VERSIONS[@]}"; do
  docker buildx build \
    --platform linux/arm/v7,linux/arm64,linux/amd64 \
    --quiet \
    --no-cache \
    --push \
    -t sykescottages/base:${VERSION} \
    $VERSION >>/dev/null 2>&1 &
done

wait

docker buildx build \
  --platform linux/arm/v7,linux/arm64,linux/amd64 \
  --quiet \
  --no-cache \
  --push \
  -t sykescottages/base:latest \
  $LATEST_VERSION >>/dev/null 2>&1
