# Build breakwa11/shadowsocks from github source
# single-user version

FROM ubuntu:14.04.3

MAINTAINER aprikyblue <aprikyblue@gmail.com>

RUN apt-get update && \
    apt-get install -y m2crypto git python2.7-minimal

ENV SS_DIR /shadowsocks
ENV SS_CONFIG /etc/shadowsocks.json

# Shadowsocks will be saved to $SS_DIR
RUN git clone -b manyuser https://github.com/breakwa11/shadowsocks.git $SS_DIR/
RUN chmod -R +x $SS_DIR/

# Optimizing shadowsocks
ADD 60-shadowsocks.conf /etc/sysctl.d/60-shadowsocks.conf
RUN sysctl --system

# Copy configuration file
ADD shadowsocks.json $SS_CONFIG

# Copy entrypoint file
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Please modify this if you chanaged shadowsocks server port
EXPOSE 34780

# Startup single-user version
ENTRYPOINT /entrypoint.sh -d $SS_DIR -c $SS_CONFIG $EXT_PARMS