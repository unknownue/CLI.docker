
FROM ubuntu:18.04

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL version="1.0"
LABEL description="Docker images for docsify-cli tools"
LABEL license="MIT"

WORKDIR /root/

RUN apt-get update && \
    apt-get install -y nodejs npm && \
    apt clean
RUN npm i docsify-cli -g

WORKDIR /workspace
