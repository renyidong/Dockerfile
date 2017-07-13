FROM alpine
MAINTAINER Yidong Ren <docker@yidong.im>

RUN apk add --no-cache py-setuptools &&\
    apk add --no-cache --virtual build-dependencies py-pip &&\
    pip install shadowsocks &&\
    apk del build-dependencies

ENTRYPOINT ["/usr/bin/ssserver"]
