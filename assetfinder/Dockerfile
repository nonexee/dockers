FROM golang:alpine as build
RUN go install github.com/tomnomnom/assetfinder@latest

FROM alpine
COPY --from=build /go/bin/assetfinder /usr/bin/assetfinder
ENTRYPOINT ["/usr/bin/assetfinder"]
