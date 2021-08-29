FROM golang:1.16.7-alpine AS build
ENV GO111MODULE on
RUN go install github.com/haccer/subjack@latest 

FROM alpine:latest
COPY --from=build /go/bin/subjack /go/bin/subjack
ENTRYPOINT ["/go/bin/subjack"]
