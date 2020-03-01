FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN echo 'Acquire::http::Pipeline-Depth "0";' > /etc/apt/apt.conf.d/00no-pipeline

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update; \
    apt-get install -yy \
        zip \
        git \
        curl \
        openssl \
        software-properties-common

RUN apt autoremove; \
    apt clean