FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
    apt-get -y install make gcc asciidoc w3m rsync && \
    rm -rf /var/lib/apt/lists/*

COPY . /workdir/

WORKDIR /workdir

VOLUME ["/workdir/docs", "/workdir/output"]

CMD make help

