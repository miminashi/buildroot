FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
    apt-get -y install make gcc asciidoc && \
    rm -rf /var/lib/apt/lists/*

COPY . /workdir/

WORKDIR /workdir

CMD make help

