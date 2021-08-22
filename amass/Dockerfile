FROM golang:1.16-alpine as build
RUN apk --no-cache add git
RUN go get -v github.com/OWASP/Amass/v3/...

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=build /go/bin/amass /bin/amass
ENV HOME /
RUN addgroup user \
    && adduser user -D -G user \
    && mkdir /.config \
    && chown -R user:user /.config \
    && apk del ca-certificates
USER user
ENTRYPOINT ["/bin/amass"]
