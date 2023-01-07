#!/bin/bash
# check so networking works
ping -q -c1 cloudflare.com &>/dev/null && echo online && exit 0 || echo offline && exit 1
# check if the OS is supported
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "OS Supported executing script"
        sleep 1
else
    echo "apt-get :: Error not supported Operating system ... exiting" ; exit 1 ;
fi
# error if not ran with sudo
[[ "$(id -u)" == 0 ]] || { echo "Run: sudo !!" ; exit 1 ; }
# update repos and upgrade system if needed
apt-get update && apt-get upgrade -y || { echo "apt-get :: Error Upgrading ... exiting" ; exit 1 ; }
# install variues tools
apt-get install rsync tmux wget -y || { echo "apt-get :: Error Installing packages! ... exiting" ; exit 1 ; }
# install RMT motd
wget https://cdn.robinsmediateam.dev/Temp/motd -O /etc/motd  || { echo "apt-get :: Error Getting key ... exiting" ; exit 1 ; }
# create ssh dir and set set perms
mkdir /home/pi/.ssh  || { echo "apt-get :: Error Creatring directory ... exiting" ; exit 1 ; }
chown -R pi:pi /home/pi/.ssh/  || { echo "apt-get :: Error Setting permissions ... exiting" ; exit 1 ; }
# grab ssh pub key to ssh folder
wget https://cdn.robinsmediateam.dev/Temp/id_rsa.pub -O /home/pi/.ssh/authorized_keys  || { echo "apt-get :: Error Getting key ... exiting" ; exit 1 ; }
# exit success
exit 0

