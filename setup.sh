#!/bin/bash
if [ ! -d "~/.ssh" ]; then
  sudo apt-get install zsh git curl -y
  mkdir ~/.ssh;
  echo "" >> ~/.ssh/config
  echo "Include ~/dotfiles/config" > ~/.ssh/config
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  cp -v ~/dotfiles/.zshrc > ~/.zshrc
  . ~/.zshrc
  echo "done adding aliases, ssh configs"
  exit 0
fi
echo "have a nice day!"