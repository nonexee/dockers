FROM golang:alpine as build
ENV GO111MODULE=on
RUN go install github.com/sw33tLie/sns@latest

FROM alpine:latest
COPY --from=build /go/bin/sns /usr/bin/sns
ENTRYPOINT ["/usr/bin/sns"]
