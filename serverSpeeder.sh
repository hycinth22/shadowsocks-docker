#!/bin/bash

set -e

workdir="/tmp/serverSpeeder/"

# Download ServerSpeeder Installer
mkdir ${workdir}
wget -P ${workdir} http://my.serverspeeder.com/d/ls/serverSpeederInstaller.tar.gz
tar xzvf /tmp/serverSpeeder/serverSpeederInstaller.tar.gz -C ${workdir}
chmod -R +x ${workdir}