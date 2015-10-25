FROM ubuntu:14.04.3

MAINTAINER aprikyblue <aprikyblue@gmail.com>

RUN apt-get update && \
    apt-get install -y m2crypto git python2.7-minimal

RUN git clone -b manyuser https://github.com/breakwa11/shadowsocks.git /etc/shadowsocks

ADD shadowsocks.json /etc/shadowsocks.json

EXPOSE 443

CMD ["/etc/shadowsocks/shadowsocks/server.py","-c","/etc/shadowsocks.json"]