#!/bin/bash

set -e

# default option
ss_dir="/shadowsocks"
config_file="/etc/shadowsocks.json"

# changeConf(name, val)
changeConf() {
    echo "Modify configuration [$1] to [$2]"
    sed -e 's/\(\s*"'$1'"\s*:\s*\).*\(\s*[,|$]\)/\1'$2'\2/' -i $config_file
}

# changeConf_str(name, str)
changeConf_str() {
    changeConf $1 '"'$2'"'
}

# parse arguments
while getopts "d:c:p:k:m:t:o:w:" arg
do
        case $arg in
             d) ss_dir=$OPTARG
                ;;
             c) config_file=$OPTARG
                ;;
             p) server_port=$OPTARG
                changeConf 'server_port' $server_port
                ;;
             k) password=$OPTARG
                changeConf_str 'password' $password
                ;;
             m) method=$OPTARG
                changeConf_str 'method' $method
                ;;
             t) timeout=$OPTARG
                changeConf 'timeout' $timeout
                ;;
             o) obfs=$OPTARG
                changeConf_str 'obfs' $obfs
                ;;
             w) workers=$OPTARG
                changeConf 'workers' $workers
                ;;
             e) cmds=$OPTARG
                ;;
             ?)
                echo "unkonwn argument $arg"
                exit 1
        esac
done

# startup ssh daemon
bash /run.sh &

python $ss_dir/shadowsocks/server.py -c $config_file