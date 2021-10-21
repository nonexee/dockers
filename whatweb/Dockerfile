FROM ruby:alpine

RUN apk add --no-cache git make cmake gcc musl-dev \ 
    && git clone https://github.com/urbanadventurer/WhatWeb.git /src/whatweb \
    && gem install rchardet:1.8.0 mongo:2.14.0 json:2.5.1 \
    && cd /src/whatweb \
    && bundle install \ 
    && apk del git gcc cmake make

ENTRYPOINT ["/src/whatweb/whatweb"]
