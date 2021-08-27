FROM golang:alpine as build
RUN apk --no-cache add gcc make cmake g++
ENV GO111MODULE on
RUN go install github.com/netevert/delator@latest \
&& apk del gcc make cmake g++

FROM alpine:latest

COPY --from=build /go/bin/delator /go/bin/delator
ENV HOME /
ENTRYPOINT ["/go/bin/delator"]
