FROM --platform=$BUILDPLATFORM ubuntu:24.04

ENV DEBIAN_FRONTEND noninteractive
ENV TZ UTC

RUN echo 'Acquire::http::Pipeline-Depth "0";' > /etc/apt/apt.conf.d/00no-pipeline

RUN echo $TZ > /etc/timezone

RUN apt update && \
    apt upgrade -y && \
    apt install -y -q \
        zip \
        git \
        curl \
        openssl \
        software-properties-common

RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*
