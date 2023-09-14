#!/bin/bash

VERSION=$1
LATEST_VERSION=$2

docker build --quiet --no-cache -t sykescottages/base:${VERSION} $VERSION
docker push sykescottages/base:${VERSION}
docker run -it sykescottages/base:${VERSION} bash -c "apt -qq list | tail -n+2" | tail -n+4 > ${VERSION}/aptitude-itinerary

if [[ "$LATEST_VERSION" == "$VERSION" ]]; then
  docker tag sykescottages/base:${LATEST_VERSION} sykescottages/base:latest
  docker push sykescottages/base:latest
  docker rmi sykescottages/base:latest
fi

docker rmi sykescottages/base:${VERSION}
