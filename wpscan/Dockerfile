FROM ruby:3.0.2-alpine AS builder
RUN echo "install: --no-document --no-post-install-message\nupdate: --no-document --no-post-install-message" > /etc/gemrc \
&& apk add --no-cache git \
&& git clone https://github.com/wpscanteam/wpscan.git /wpscan
RUN apk add --no-cache git libcurl ruby-dev libffi-dev make gcc musl-dev zlib-dev procps sqlite-dev && \
  bundle config force_ruby_platform true && \
  bundle config disable_version_check 'true' && \
  bundle config without "test development" && \
  bundle config path.system 'true' && \
  bundle install --gemfile=/wpscan/Gemfile --jobs=8
WORKDIR /wpscan
RUN rake install --trace
RUN chmod -R a+r /usr/local/bundle

FROM ruby:3.0.2-alpine
RUN adduser -h /wpscan -g WPScan -D wpscan
COPY --from=builder /usr/local/bundle /usr/local/bundle
RUN chown -R wpscan:wpscan /wpscan
RUN apk add --no-cache libcurl procps sqlite-libs
WORKDIR /wpscan
USER wpscan
RUN /usr/local/bundle/bin/wpscan --update --verbose
ENTRYPOINT ["/usr/local/bundle/bin/wpscan"]
