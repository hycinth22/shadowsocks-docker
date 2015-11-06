#!/bin/bash

set -e

if [ -n $1 ]; then
    ss_dir=$1
else
    ss_dir="/shadowsocks"
fi
if [ -n $2 ]; then
    config_file=$2
else
    config_file="/etc/shadowsocks.json"
fi

if [ -n $server_port ]; then
    sed -e 's/^;"server_port":\d+/"server_port":'$server_port'/' -i $config_file
fi
if [ -n $password ]; then
    sed -e 's/^;"password":".*"/"password":"'$server_port'"/' -i $config_file
fi
if [ -n $method ]; then
    sed -e 's/^;"method":".*"/"method":"'$method'"/' -i $config_file
fi

python $ss_dir/shadowsocks/server.py -c $config_file