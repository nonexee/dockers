FROM alpine

RUN apk -U upgrade && apk add --no-cache \
    nmap \
    nmap-scripts \
    wget \
    && rm -rf /var/cache/apk/* \
    && wget https://raw.githubusercontent.com/vulnersCom/nmap-vulners/master/http-vulners-regex.nse -O /usr/share/nmap/scripts/http-vulners-regex.nse \
    && wget https://raw.githubusercontent.com/vulnersCom/nmap-vulners/master/http-vulners-regex.json -O /usr/share/nmap/nselib/data/http-vulners-regex.json \
    && wget https://raw.githubusercontent.com/vulnersCom/nmap-vulners/master/http-vulners-paths.txt -O /usr/share/nmap/nselib/data/http-vulners-paths.txt \
    && wget https://raw.githubusercontent.com/vulnersCom/nmap-vulners/master/vulners.nse -O /usr/share/nmap/scripts/vulners.nse \
    && apk del wget \
    && nmap --script-updatedb

ENTRYPOINT ["/usr/bin/nmap"]
