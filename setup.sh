#!/bin/bash
apt-get install zsh git curl -y
mkdir ~/.ssh;
echo "" >> ~/.ssh/config;
echo "Include ~/dotfiles/config" > ~/.ssh/config
cp -v ~/dotfiles/.zshrc > ~/.zshrc
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended --keep-zshrc
echo "exec zsh" >> ~/.bashrc
echo "Please disconnect and connect again to run the new shell!"
exit 0
