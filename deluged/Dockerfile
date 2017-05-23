FROM alpine:edge
MAINTAINER Yidong Ren <docker@yidong.im>
ARG version=1.3.15
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ python2 py-setuptools libtorrent-rasterbar py-chardet py-xdg py-twisted py-openssl py-service_identity ca-certificates py-certifi py-setproctitle py-rencode py-mako &&\
    apk add --no-cache --virtual build-dependencies py2-pip bash &&\
    pip install attrs twisted pyOpenSSL slimit &&\
    mkdir /build/ &&\
    wget -O - http://download.deluge-torrent.org/source/deluge-${version}.tar.xz | tar xJf - -C /build/ &&\
    cd /build/deluge-${version}/ &&\
    sed -i 's/storage_mode = lt.storage_mode_t(1)/storage_mode = lt.storage_mode_t(0)/' deluge/core/torrentmanager.py &&\
    python setup.py build install &&\
    adduser -D deluge &&\
    cd / && rm -rf /build/ &&\
    apk del build-dependencies
EXPOSE 58846
USER deluge
ENTRYPOINT ["deluged", "--do-not-daemonize"]
