# Build breakwa11/shadowsocks from github source
# single-user version

FROM ubuntu:14.04.3

MAINTAINER aprikyblue <aprikyblue@gmail.com>

RUN apt-get update && \
    apt-get install -y wget m2crypto git python2.7-minimal

# Shadowsocks will be saved to /shadowsocks
RUN git clone -b manyuser https://github.com/breakwa11/shadowsocks.git /shadowsocks/
RUN chmod -R +x /shadowsocks/

# Optimizing shadowsocks
COPY 60-shadowsocks.conf /etc/sysctl.d/60-shadowsocks.conf
RUN sysctl --system

# Copy configuration file
COPY shadowsocks.json /etc/shadowsocks.json

# Copy entrypoint file
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Download ServerSpeeder Installer
RUN mkdir /tmp/serverSpeeder/
RUN wget -P /tmp/serverSpeeder/ http://my.serverspeeder.com/d/ls/serverSpeederInstaller.tar.gz
RUN tar xzvf /tmp/serverSpeeder/serverSpeederInstaller.tar.gz
RUN chmod -R +x /tmp/serverSpeeder/

# Default Port
EXPOSE 34780

# Startup single-user version
CMD /entrypoint.sh $EXT_PARMS 