FROM alpine as build

RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories \
    && apk upgrade --update-cache --available && apk add --update openssl

RUN wget https://github.com/epi052/feroxbuster/releases/latest/download/x86_64-linux-feroxbuster.zip -qO feroxbuster.zip \
    && unzip -d /tmp/ feroxbuster.zip feroxbuster \
    && chmod +x /tmp/feroxbuster \
    && wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-medium-directories.txt -O /tmp/raft-medium-directories.txt \
    && wget https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt -O /tmp/fuzz.txt

FROM alpine as release

COPY --from=build /tmp/raft-medium-directories.txt /usr/share/seclists/Discovery/Web-Content/raft-medium-directories.txt
COPY --from=build /tmp/fuzz.txt /fuzz.txt
COPY --from=build /tmp/feroxbuster /usr/local/bin/feroxbuster

RUN adduser \
    --gecos "" \
    --disabled-password \
    feroxbuster

USER feroxbuster

ENTRYPOINT ["feroxbuster"]
