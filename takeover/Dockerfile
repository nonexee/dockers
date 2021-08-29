FROM python:3-alpine
WORKDIR /app
RUN apk add --no-cache git \
&& git clone https://github.com/m4ll0k/takeover.git /app \
&& python3 setup.py install \
&& apk del git

ENTRYPOINT ["python3", "takeover.py"]
CMD ["-v"]
