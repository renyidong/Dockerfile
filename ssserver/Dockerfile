FROM alpine
MAINTAINER Yidong Ren <docker@yidong.im>

RUN apk add --no-cache py-setuptools libsodium &&\
    apk add --no-cache --virtual build-dependencies py-pip &&\
    pip install git+https://github.com/shadowsocks/shadowsocks.git@master &&\
    apk del build-dependencies

ENTRYPOINT ["/usr/bin/ssserver"]
