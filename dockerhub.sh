#!/bin/bash

LATEST_VERSION="ubuntu-22-04"

# You need to provide your own creds because #security
docker login

VERSIONS=( "ubuntu-20-04" "ubuntu-22-04" )
for VERSION in "${VERSIONS[@]}"
do
  docker build --no-cache -t sykescottages/base:${VERSION} $VERSION
  docker push sykescottages/base:${VERSION}

  if [[ "$LATEST_VERSION" == "$VERSION" ]]; then
    docker tag sykescottages/base:${VERSION} sykescottages/base:latest
    docker push sykescottages/base:latest
    docker rmi sykescottages/base:latest
  fi

  docker rmi sykescottages/base:${VERSION}
done
