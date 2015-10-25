# Build breakwa11/shadowsocks from github source
# single-user version

FROM ubuntu:14.04.3

MAINTAINER aprikyblue <aprikyblue@gmail.com>

RUN apt-get update && \
    apt-get install -y m2crypto git python2.7-minimal

# Shadowsocks will be saved /etc/shadowsocks
RUN git clone -b manyuser https://github.com/breakwa11/shadowsocks.git /etc/shadowsocks

# Turn on fast open temporarily
RUN echo 3 > /proc/sys/net/ipv4/tcp_fastopen

# Optimizing shadowsocks
ADD 60-shadowsocks.conf /etc/sysctl.d/60-shadowsocks.conf
RUN sysctl --system

# Copy configuration file
ADD shadowsocks.json /etc/shadowsocks.json

# Please modify this if you chanaged shadowsocks server port
EXPOSE 443

# Startup single-user version
CMD ["/etc/shadowsocks/shadowsocks/server.py","-c","/etc/shadowsocks.json"]