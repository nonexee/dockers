FROM alpine:latest
WORKDIR /opt/findomain
RUN wget -qO /usr/bin/findomain https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux && \
	chmod +x /usr/bin/findomain
ENTRYPOINT ["findomain"]
