FROM debian:7
MAINTAINER Yidong Ren <ryd994@163.com>
RUN apt-get update &&\
    apt-get install -y curl &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/* &&\
    useradd -mN utorrent &&\
    su utorrent -c 'mkdir ~/bin ~/data && cd ~/bin &&\
                    curl http://download.ap.bittorrent.com/track/beta/endpoint/utserver/os/linux-x64-debian-7-0 | tar xzf - &&\
                    mv */* ./' 
COPY entrypoint.sh /bin/
USER utorrent
EXPOSE 8080
VOLUME /home/utorrent/data/
ENTRYPOINT ["/bin/entrypoint.sh"]
