# Build breakwa11/shadowsocks from github source
# single-user version

FROM tutum/ubuntu:trusty

MAINTAINER aprikyblue <aprikyblue@gmail.com>

RUN apt-get update && \
    apt-get install -y wget m2crypto git python2.7-minimal

# Optimizing shadowsocks
COPY 60-shadowsocks.conf /etc/sysctl.d/60-shadowsocks.conf
RUN sysctl --system

# Copy entrypoint file
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Copy configuration file
COPY shadowsocks.json /etc/shadowsocks.json

# Shadowsocks will be saved to /shadowsocks
RUN git clone -b manyuser https://github.com/breakwa11/shadowsocks.git /shadowsocks/
RUN chmod -R +x /shadowsocks/

# Download ServerSpeeder Installer
RUN mkdir /tmp/serverSpeeder/
RUN wget -P /tmp/serverSpeeder/ http://my.serverspeeder.com/d/ls/serverSpeederInstaller.tar.gz
RUN tar xzvf /tmp/serverSpeeder/serverSpeederInstaller.tar.gz -C /tmp/serverSpeeder/
RUN chmod -R +x /tmp/serverSpeeder/

# Default Port
EXPOSE 34780 22

# Startup single-user version
CMD /entrypoint.sh $EXT_PARMS 