FROM alpine
RUN apk add --no-cache bash wget ncurses \
&& wget https://raw.githubusercontent.com/urbanadventurer/bing-ip2hosts/master/bing-ip2hosts -O /usr/bin/bing-ip2hosts \
&& apk del wget \
&& chmod +x /usr/bin/bing-ip2hosts
ENTRYPOINT ["bash","/usr/bin/bing-ip2hosts"]
