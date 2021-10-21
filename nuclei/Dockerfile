FROM golang:1.16.7-alpine as build-env
RUN GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei

FROM alpine:latest
RUN apk add --no-cache bind-tools ca-certificates git \
&& git clone https://github.com/projectdiscovery/nuclei-templates.git
COPY --from=build-env /go/bin/nuclei /usr/local/bin/nuclei
RUN apk del git
ENTRYPOINT ["nuclei"]
