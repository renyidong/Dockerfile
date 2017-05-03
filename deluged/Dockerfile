FROM alpine:edge
MAINTAINER Yidong Ren <ryd994@163.com>
ARG version=1.3.14
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ python2 py-setuptools libtorrent-rasterbar py-chardet py-xdg py-twisted py-openssl py-service_identity ca-certificates py-certifi &&\
    apk add --no-cache --virtual build-dependencies py2-pip bash &&\
    mkdir /build/ &&\
    wget -O - http://download.deluge-torrent.org/source/deluge-${version}.tar.xz | tar xJf - -C /build/ &&\
    ls  /build/ &&\
    cd /build/deluge-${version}/ &&\
    python setup.py build install &&\
    adduser -D deluge &&\
    pip install attrs &&\
    apk del build-dependencies
EXPOSE 58846
USER deluge
ENTRYPOINT ["/usr/bin/deluged", "--do-not-daemonize"]
