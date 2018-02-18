# Build breakwa11/shadowsocks from github source
# single-user version

FROM tutum/ubuntu:trusty

MAINTAINER aprikyblue <aprikyblue@gmail.com>

RUN apt-get update && \
    apt-get install -y wget m2crypto git python2.7-minimal

# Shadowsocks will be saved to /shadowsocks
RUN git clone -b manyuser https://github.com/shadowsocksr-backup/shadowsocksr /shadowsocks/
RUN chmod -R +x /shadowsocks/*.py

# Copy entrypoint file
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Copy configuration file
COPY shadowsocks.json /etc/shadowsocks.json

# Default Port
EXPOSE 34780 22

# Startup single-user version
CMD /entrypoint.sh $EXT_PARMS