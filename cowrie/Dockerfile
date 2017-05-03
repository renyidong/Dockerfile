FROM alpine                                                                  
MAINTAINER Yidong Ren <ryd994@163.com>                                       
RUN apk update &&\                                                           
    apk add python py-setuptools ca-certificates &&\                                         
    apk add --virtual build-dependencies py-pip build-base python-dev libffi-dev gmp-dev mpfr-dev mpc1-dev openssl openssl-dev &&\                        
    adduser -D cowrie &&\
    su cowrie -c 'cd &&\
                  wget https://github.com/micheloosterhof/cowrie/archive/master.zip &&\
                  unzip master.zip && rm master.zip &&\
                  cd cowrie-master &&\
                  mv cowrie.cfg.dist cowrie.cfg &&\
                  pip install --user -r requirements.txt &&\
                  pip install --user pycrypto' &&\
    apk del build-dependencies &&\
    rm -rf /var/cache/apk/*
USER cowrie
ENV XARGS="--nodaemon"
CMD ["~/cowrie-master/start.sh"]
