# shadowsocks-docker
A docker image of breakwa11/shadowsocks, based on Ubuntu 14.04

# Environment Varible Options
+ `EXT_PARMS`: shadowsocks Startup parameters.
  + -d <dir_p           shadowsocks directory, default: /shadowsocks
  + -c <conf_path>      shadowsocks configuration file, default: /etc/shadowsocks.json
  + -p <port>           shadowsocks port(in docker container), default: 34780
  + -k <password>       shadowsocks password, default: 123456
  + -m <method>         shadowsocks encrypt method, default: rc4-md5
  + -t <timeout>        shadowsocks timeout seconds, default: 300
  + -o <obfs>           shadowsocks timeout seconds, default: plain
  + -w <workers>        shadowsocks timeout seconds, default: 1
+ ~~`EXT_CMD`: execute its value as bash command after shadowsocks startup.~~

If you want to use *chacha20* encrypt method, please install [*libsodium*](https://download.libsodium.org/libsodium/releases/) ~~by `EXT_CMDS`~~


# About serverSpeeder

The image will download [*serverSpeederInstaller*](http://my.serverspeeder.com/d/ls/serverSpeederInstaller.tar.gz) lastest version automatically. It's saved at /tmp/serverSpeeder/

You can write the following command to `EXT_CMDS` in order to enable it.

[ServerSpeeder Office Website](http://serverspeeder.com/)

`bash /tmp/serverSpeeder/serverSpeederInstaller.sh -e email -p password [-in inbound_bandwidth] [-out outbound_bandwidth] [-i interface] [-r] [-t] [-b]`

```
> Usage:  serverSpeederInstaller.sh
   or:  serverSpeederInstaller.sh -e email -p password [-in inbound_bandwidth] [-out outbound_bandwidth] [-i interface] [-r] [-t shortRttMS] [-gso <0|1>] [-rsc <0|1>] [-b] [-f]
   or:  serverSpeederInstaller.sh uninstall

  -b, --boot            auto load ServerSpeeder on linux start-up
  -e, --email           specify your Email
  -f                    force install, if ServerSpeeder has been installed uninstall it automaticlly
  -gso          0 or 1, enable or disable gso
  -h, --help            display this help and exit
  -i                    specify your accelerated interface(s), default eth0
  -in                   inbound bandwidth, default 1000000 kbps
  -n                    don't resolve DNS
  -out                  outbound bandwidth, default 1000000 kbps
  -p, --pwd             specify your password
  -r                    start ServerSpeeder after installation
  -rsc          0 or 1, enable or disable rsc
  -s                    show system information and exit
  -t                    specify shortRttMS, default 0
  -v, --version         print package version
  uninstall             uninstall ServerSpeeder
  ```
