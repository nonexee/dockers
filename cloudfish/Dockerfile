FROM python:3.9-alpine
RUN apk add --update --no-cache \
    build-base \
    libffi-dev \
    openssl-dev \
    git \
    && pip install --no-cache-dir \
    requests \
    argparse
RUN git clone https://github.com/indianajson/cloudfish.git /app
RUN apk del git
WORKDIR /app
ENTRYPOINT ["python3", "cloudfish.py"]
