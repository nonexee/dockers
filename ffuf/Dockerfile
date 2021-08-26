FROM golang:alpine as build

RUN apk --no-cache add git \
    && export GO111MODULE=on \
    && go install github.com/ffuf/ffuf@latest \
    && mkdir -p /opt/ffuf/;cd /opt/ffuf \
    && wget https://raw.github.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-large-directories.txt \
    && wget https://raw.github.com/whitehauler/SecLists/master/Discovery/Web-Content/raft-large-files.txt \
    && wget https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt \
    && cat raft-large-directories.txt raft-large-files.txt| sort -u > raft.txt \
    && wget https://github.com/six2dez/OneListForAll/raw/main/onelistforallshort.txt \
    && apk del git

FROM alpine:latest
COPY --from=build /go/bin/ffuf /opt/ffuf/ffuf
COPY --from=build /opt/ffuf/raft.txt /opt/ffuf/raft.txt
COPY --from=build /opt/ffuf/fuzz.txt /opt/ffuf/fuzz.txt
COPY --from=build /opt/ffuf/onelistforallshort.txt /opt/ffuf/onelistforallshort.txt
ENTRYPOINT ["/opt/ffuf/ffuf"]
