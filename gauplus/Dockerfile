FROM golang:1.16-alpine as build
RUN apk --no-cache add git
ENV GO111MODULE=on
RUN go get -u -v github.com/bp0lr/gauplus

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=build /go/bin/gauplus /bin/gauplus
ENTRYPOINT ["/bin/gauplus"]
