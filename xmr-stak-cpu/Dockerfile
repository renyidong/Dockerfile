FROM fedora
RUN dnf -y install gcc-c++ cmake libmicrohttpd-devel wget unzip sed openssl-devel &&\
    dnf clean all &&\
    wget https://github.com/fireice-uk/xmr-stak-cpu/archive/master.zip &&\
    unzip master.zip && cd xmr-stak-cpu-master &&\
    sed -i 's/fDevDonationLevel.*;/fDevDonationLevel=0;/' donate-level.h &&\
    cmake . && make
WORKDIR /xmr-stak-cpu-master/bin/
ENTRYPOINT ["/bin/nice", "-n", "99", "/xmr-stak-cpu-master/bin/xmr-stak-cpu"]
