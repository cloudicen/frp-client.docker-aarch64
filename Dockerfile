FROM alpine:3.8
MAINTAINER cloudicen <cloudicen@gmail.com>

CMD ["/bin/sh"]

RUN apk add --update tzdata

ENV TZ=Asia/Shanghai

ENV FRP_VERSION=0.31.2

WORKDIR /


RUN wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_arm64.tar.gz && tar -xf frp_${FRP_VERSION}_linux_arm64.tar.gz && mkdir /frpc && cp frp_${FRP_VERSION}_linux_arm64/frpc* /frpc/ && rm -rf frp_${FRP_VERSION}_linux_arm64*

RUN rm -rf /var/cache/apk/*

RUN mkdir /conf

VOLUME [/conf]

WORKDIR /frpc

ENTRYPOINT ["/frpc/frpc" "-c" "/conf/frpc.ini"]
