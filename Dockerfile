FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y \
       build-essential \
       cmake \
       flex \
       bison \
       libxml2-utils \
       texlive-base \
       python

COPY . /tmp/doxygen

RUN mkdir /tmp/build
WORKDIR /tmp/build
RUN cmake /tmp/doxygen \
    && cmake --build . \
    && ctest --output-on-failure

