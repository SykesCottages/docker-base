#!/bin/bash

export DOCKER_CLI_EXPERIMENTAL=enabled
LATEST_VERSION="ubuntu-22-04"

docker login >>/dev/null 2>&1

VERSIONS=("ubuntu-20-04" "ubuntu-22-04")

for VERSION in "${VERSIONS[@]}"; do
  TAG="sykescottages/base:${VERSION}"
  docker manifest create $TAG \
      --amend "$TAG-amd64" \
      --amend "$TAG-arm64"
  docker manifest push $TAG
done

TAG="sykescottages/base:latest"
LATEST_TAG="sykescottages/base:$LATEST_VERSION"
docker manifest create $TAG \
    --amend "$LATEST_TAG-amd64" \
    --amend "$LATEST_TAG-arm64"
docker manifest push $TAG