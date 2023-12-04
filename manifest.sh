#!/bin/bash

TAG="sykescottages/base:${VERSION}"

export DOCKER_CLI_EXPERIMENTAL=enabled

docker manifest create $TAG \
    --amend "$TAG-amd64" \
    --amend "$TAG-arm64"

docker manifest push $TAG
