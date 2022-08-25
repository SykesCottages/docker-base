#!/bin/sh

VERSION=1.2.1

# Validate the container passes our tests
docker-compose -f docker-compose.test.yml run --rm sut

# You need to provide your own creds because #security
docker login

docker build --no-cache -t sykescottages/base:$VERSION -t sykescottages/base:latest .

docker push sykescottages/base:$VERSION
docker push sykescottages/base:latest

docker rmi sykescottages/base:$VERSION
docker rmi sykescottages/base:latest
