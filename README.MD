# Sykes Cottages Base Docker Image

## About

This is a foundation image we at Sykes Cottages use for almost all of our docker images. We use a 
hierarchy of images for each of our containers to minimise maintenance and reduce build times. This is the top level of our own hierarchy which inherits from the official Docker [Ubuntu](https://hub.docker.com/_/ubuntu/) and [Scratch](https://hub.docker.com/_/scratch) images in turn.

## Supported versions and available tags

- Ubuntu 20.04.6 (LTS Current EOL 2030-04-02) - `sykescottages/base:ubuntu-20-04`
- Ubuntu 22.04.2 (LTS Current EOL 2032-04-09) - `sykescottages/base:ubuntu-22-04`

## Image Itinerary

For better visibility of packages there is now an included aptitude itinerary with each tag, this is located in the corresponding folder to the tag. 
This will give better clarity on package version changes and be reflected in the git history. 

## Usage

Pulling the image:
```
docker pull sykescottages/base:latest
```

Running a container:
```
docker run -it sykescottages/base:latest
```

Building from this image simply reference it as part of your Dockerfile:

```
FROM sykescottages/base:latest

# ... Your configuration
```

## Tagging

Please ensure that every modification to Dockerfile is appropriately tagged using [SemVer](http://semver.org/) e.g. 1.0.0 or 2.0.14

## Testing

Testing is done in the form of a SUT container which is run by the Docker Hub (see [Automated repository tests](https://docs.docker.com/docker-hub/builds/automated-testing/) for more information) and runs a simple shell test set in [run_tests.sh](https://github.com/SykesCottages/docker-base/blob/master/run_tests.sh).

## Contributions

Contributions are welcome, but please adhere to the [CONTRIBUTION.MD](https://github.com/SykesCottages/docker-base/blob/master/CONTRIBUTION.MD). Also, if you could ensure that there are tests with every modification of the [Dockerfile](https://github.com/SykesCottages/docker-base/blob/master/Dockerfile) to verify that your changes work.
