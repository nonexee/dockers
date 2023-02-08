FROM golang:1.18-alpine as build
RUN apk --no-cache add git gcc make g++ zlib zlib-dev
RUN go install -v github.com/xm1k3/cent@latest && /go/bin/cent init

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=build /root/.cent.yaml /root/.cent.yaml
COPY --from=build /go/bin/cent /bin/cent
ENTRYPOINT ["/bin/cent"]
