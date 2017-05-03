FROM alpine:edge
MAINTAINER Yidong Ren <ryd994@163.com>
ARG version=1.3.14
ARG DELUGE_USER=deluge
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ python2 py-setuptools libtorrent-rasterbar py-chardet py-xdg py-twisted py-openssl py-service_identity ca-certificates py-certifi py-mako &&\
    apk add --no-cache --virtual build-dependencies py2-pip bash &&\
    mkdir /build/ &&\
    wget -O - http://download.deluge-torrent.org/source/deluge-${version}.tar.xz | tar xJf - -C /build/ &&\
    ls  /build/ &&\
    cd /build/deluge-${version}/ &&\
    python setup.py build install &&\
    adduser -D ${DELUGE_USER} &&\
    pip install attrs &&\
    apk del build-dependencies
EXPOSE 8112
USER ${DELUGE_USER}
RUN mkdir -p ~/.config/deluge/
VOLUME /home/${DELUGE_USER}/.config/deluge/
ENTRYPOINT ["/usr/bin/deluge-web"]
