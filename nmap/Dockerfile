FROM alpine

RUN apk -U upgrade && apk add --no-cache \
    nmap \
    nmap-scripts \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/nmap"]