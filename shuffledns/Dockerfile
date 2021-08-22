FROM golang:alpine as build
RUN apk --no-cache add git wget
ENV GO111MODULE on
RUN wget https://raw.githubusercontent.com/janmasarik/resolvers/master/resolvers.txt -O /resolvers.txt \
&& wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/subdomains-top1million-110000.txt -O /all.txt \
&& go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest \
&& apk del git wget

FROM alpine:latest
RUN apk --update --no-cache add ldns \
  && apk --no-cache --virtual .deps add ldns-dev \
                                        git \
                                        build-base \
  && git clone --branch=master \
               --depth=1 \
               https://github.com/blechschmidt/massdns.git \
  && cd massdns \
  && make \
  && mv bin/massdns /usr/bin/massdns \
  && rm -rf /massdns \
  && apk del .deps

COPY --from=build /go/bin/shuffledns /usr/bin/shuffledns
COPY --from=build /resolvers.txt /resolvers.txt
COPY --from=build /all.txt /all.txt
ENV HOME /
ENTRYPOINT ["/usr/bin/shuffledns"]
