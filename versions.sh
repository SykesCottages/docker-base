#!/bin/bash
LATEST_VERSION="ubuntu-22-04"

VERSIONS=( "ubuntu-20-04" "ubuntu-22-04" "ubuntu-24-04")
for VERSION in "${VERSIONS[@]}"
do
  docker run -it sykescottages/base:${VERSION} lsb_release -a
  docker run -it sykescottages/base:${VERSION} bash -c "apt -qq list | tail -n+2" | tail -n+4 > ${VERSION}/aptitude-itinerary
done
