#!/bin/bash
[[ whoami != root ]] && echo "must be run as root!"
# updated sources and install requierd files 
apt-get update
apt-get install zsh git curl -y
# create .ssh and continue even if it fails
mkdir ~/.ssh;
# make empty config file
echo "" >> ~/.ssh/config;
# replace config file with one in home folder
echo "Include ~/config" > ~/.ssh/config
# copy in repo zshrc file into home folder
cp -v ~/dotfiles/.zshrc > ~/.zshrc
# install zsh unattwended and keep my existing zshrc file
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended --keep-zshrc
echo "exec zsh" >> ~/.bashrc
echo "Please disconnect and connect again to run the new shell!"
exit 0
