FROM alpine:latest

RUN apk --no-cache add py3-setuptools py3-qt5 py3-matplotlib git \
    && git clone https://github.com/guelfoweb/knock.git \
    && cd knock/ \
    && python3 setup.py install \
    && rm -rf /knock/

ENTRYPOINT ["/usr/local/bin/knockpy"]
