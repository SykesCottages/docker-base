#!/bin/bash
LATEST_VERSION="ubuntu-22-04"

# You need to provide your own creds because #security
docker login >> /dev/null 2>&1

VERSIONS=( "ubuntu-20-04" "ubuntu-22-04" )
for VERSION in "${VERSIONS[@]}"
do
  ./build.sh $VERSION $LATEST_VERSION
done

wait
