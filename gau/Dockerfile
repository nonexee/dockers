FROM golang:1.16-alpine as build
RUN apk --no-cache add git
ENV GO111MODULE=on
RUN go get -u -v github.com/lc/gau

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=build /go/bin/gau /bin/gau
ENTRYPOINT ["/bin/gau"]
