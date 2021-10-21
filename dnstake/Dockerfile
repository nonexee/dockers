FROM golang:1.16.7-alpine AS build
ENV GO111MODULE on
RUN go install github.com/pwnesia/dnstake/cmd/dnstake@latest

FROM alpine:latest
COPY --from=build /go/bin/dnstake /go/bin/dnstake
ENTRYPOINT ["/go/bin/dnstake"]
