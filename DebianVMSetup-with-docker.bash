#!/bin/bash
###check so networking works
ping -q -c1 cloudflare.com &>/dev/null && echo online && exit 0 || echo offline && exit 1
###check if the OS is supported
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "OS Supported executing script"
        sleep 1s;
else
    echo "apt-get :: Error no supported operating system found... exiting" ; exit 1 ;
fi
###error if not ran with sudo
[[ "$(id -u)" == 0 ]] || { echo "Run: sudo !!" ; exit 1 ; }
###update repos and upgrade system if needed
apt-get update && apt-get upgrade -y || { echo "apt-get :: Error Upgrading ... exiting" ; exit 1 ; }
###install variues tools
apt-get install rsync open-vm-tools tmux wget apt-transport-https ca-certificates curl gnupg lsb-release -y || { echo "apt-get :: Error Installing packages! ... exiting" ; exit 1 ; }
###grab docker install script and run it
#curl -fsSL https://download.docker.com/linux/debian/gpg |  gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg || { echo "curl || gpg :: Error curling gpg>
###add necessary info to docker.list
#echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" >> /etc/apt/source>
###update apt; install docker packages
apt-get update && apt-get install docker-ce docker-ce-cli containerd.io -y || { echo "apt-get :: Error installing docker packages ... exiting" >&2 ; exit 1 ; }
###curl docker-compose image
#curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose || { echo "curl :: Error curlin>
###set permissions
chmod 770 /usr/bin/docker-compose || { echo "chmod :: Error setting permissions ... exiting" >&2 ; exit 1 ; }
usermod -aG docker administrator || { echo "usermod :: Error ... exiting" >&2 ; exit 1 ; }
wget https://cdn.robinsmediateam.dev/Temp/motd -O /etc/motd  || { echo "apt-get :: Error Getting key ... exiting" ; exit 1 ; }
###create ssh dir and set set perms
mkdir /home/administrator/.ssh  || { echo "apt-get :: Error Creatring directory ... exiting" ; exit 1 ; }
chown -R administrator:administrator /home/administrator/.ssh/  || { echo "apt-get :: Error Setting permissions ... exiting" ; exit 1 ; }
###grab ssh pub key to ssh folder
wget https://cdn.robinsmediateam.dev/Temp/id_rsa.pub -O /home/administrator/.ssh/authorized_keys  || { echo "apt-get :: Error Getting key ... exiting" ; exit 1 ; }
###exit success
exit 0
