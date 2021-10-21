FROM golang:1.16-alpine as build
RUN apk --no-cache add git
RUN go get -v github.com/OWASP/Amass/v3/...

FROM alpine:latest
RUN apk --no-cache add ca-certificates \
&& wget https://raw.githubusercontent.com/janmasarik/resolvers/master/resolvers.txt -O /resolvers.txt
COPY --from=build /go/bin/amass /bin/amass
ENTRYPOINT ["/bin/amass"]
