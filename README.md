# shadowsocks-docker
A docker image of breakwa11/shadowsocks, based on Ubuntu 14.04

# Environment Varible Options
+ `EXT_PARMS`: shadowsocks Startup parameters.
  + -d <dir>           shadowsocks directory, default: /shadowsocks
  + -c <conf_path>      shadowsocks configuration file, default: /etc/shadowsocks.json
  + -p <port>           shadowsocks port(in docker container), default: 34780
  + -k <password>       shadowsocks password, default: 123456
  + -m <method>         shadowsocks encrypt method, default: rc4-md5
  + -t <timeout>        shadowsocks timeout seconds, default: 300
  + -o <obfs>           shadowsocks timeout seconds, default: plain
  + -w <workers>        shadowsocks timeout seconds, default: 1

If you want to use *chacha20* encrypt method, please install [*libsodium*](https://download.libsodium.org/libsodium/releases/)

Besides, Your can your configuration file via mounting
Configuration File Path: `/etc/shadowsocks.json`

# Getting Started

1. Chnage to work directory

    cd /path/to/the/repo

2. Clone the repo

    git clone https://github.com/inkedawn/shadowsocks-docker .

3. Build the image

    docker build --tag ik:ssr /path/to/the/repo

4. Create & Start a container

Default Configuration:

    docker run -it --name ssr ik:ssr

Custom Configuration:

    docker run -it --name ssr -e "EXT_PARMS=-p yourPort -k youPassWord -m YourMethod" ik:ssr

Custom Configuration File:

    docker run -it --name ssr -v "/path/to/your/configuration/file:/etc/shadowsocks.json" ik:ssr