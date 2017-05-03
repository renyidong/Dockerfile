FROM alpine
ADD  compiler_workaround.patch /root/
RUN  apk add --no-cache libmicrohttpd libssl1.0 libstdc++ libgcc &&\
     apk add --no-cache --virtual .build-deps wget openssl unzip patch cmake make g++ libmicrohttpd-dev openssl-dev patch &&\
     cd && mkdir build && cd build &&\
     wget https://github.com/fireice-uk/xmr-stak-cpu/archive/master.zip &&\
     unzip master.zip && cd xmr-stak-cpu-master &&\
     patch </root/compiler_workaround.patch &&\
     cmake . -DCMAKE_INSTALL_PREFIX=/usr/local && make install &&\
     rm /usr/local/bin/config.txt &&\
     cd && rm -rf build &&\
     apk del .build-deps
ENTRYPOINT ["nice", "-n", "99", "xmr-stak-cpu"]
