FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
ENV TZ UTC

RUN echo 'Acquire::http::Pipeline-Depth "0";' > /etc/apt/apt.conf.d/00no-pipeline

RUN echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -y -q \
        zip \
        git \
        curl \
        openssl \
        software-properties-common

RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*