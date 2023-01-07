#!/bin/bash
[[ whoami != root ]] && echo "must be run as root!"
# updated sources and install requierd files 
apt-get update
# create .ssh and continue even if it fails
mkdir ~/.ssh;
# make empty config file
echo "" >> ~/.ssh/config;
# replace config file with one in home folder
echo "Include ~/config" > ~/.ssh/config
cat ~/dotfiles/alias.conf >> ~/.bashrc
echo "Please disconnect and connect again"
exit 0
