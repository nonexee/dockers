FROM golang:alpine as build-env
RUN GO111MODULE=on go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

FROM alpine:latest
RUN apk add --no-cache bind-tools ca-certificates git
COPY --from=build-env /go/bin/nuclei /usr/local/bin/nuclei
ENTRYPOINT ["nuclei"]
