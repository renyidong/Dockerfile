FROM alpine:edge
RUN  echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >>/etc/apk/repositories &&\
     apk add --no-cache libmicrohttpd libssl1.0 libstdc++ libgcc hwloc &&\
     apk add --no-cache --virtual .build-deps wget openssl unzip patch cmake make g++ libmicrohttpd-dev openssl-dev hwloc-dev patch &&\
     cd && mkdir build && cd build &&\
     wget -O - https://github.com/fireice-uk/xmr-stak/archive/master.tar.gz | tar xzf - --strip-components=1 &&\
     echo '#pragma once' >donate-level.h &&\
     echo 'constexpr double fDevDonationLevel = 0;' >>donate-level.h &&\
     cmake . -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF -DCMAKE_INSTALL_PREFIX=/usr/local && make install &&\
     cd && rm -rf build &&\
     apk del .build-deps
ENTRYPOINT ["nice", "-n", "99", "xmr-stak"]

