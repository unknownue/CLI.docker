
FROM alpine:latest

ENV LANG=C.UTF-8

# Localization
RUN \
    echo "http://mirrors.ustc.edu.cn/alpine/v3.5/main" > /etc/apk/repositories && \
    echo "http://mirrors.ustc.edu.cn/alpine/v3.5/community" >> /etc/apk/repositories
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
   echo "Asia/Shanghai" > /etc/timezone
COPY authorization.txt authorization.txt

RUN apk update
RUN apk --no-cache add tzdata
RUN apk add --no-cache python3 && \
    pip3 install bypy

RUN echo -e $(cat authorization.txt) | bypy info

CMD ["bash"]
