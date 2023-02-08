FROM golang:1.18-alpine as build
RUN apk --no-cache add git
RUN go install -v github.com/OWASP/Amass/v3/...@master

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=build /go/bin/amass /bin/amass
ENTRYPOINT ["/bin/amass"]
