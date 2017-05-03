FROM alpine:latest
RUN apk add --no-cache transmission-daemon
VOLUME ["/config", "/watch", "/download"]
#Not exposing peer ports, as they should be set by user
EXPOSE 9091
USER transmission
ENTRYPOINT ["/usr/bin/transmission-daemon", "-f", "-a", "*", "-g", "/config", "-c", "/watch", "-w", "/download"]
