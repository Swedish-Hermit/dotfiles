#!/bin/bash
  sudo apt-get install zsh git curl -y
  mkdir ~/.ssh;
  echo "" >> ~/.ssh/config
  echo "Include ~/config" > ~/.ssh/config
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  cp -v ~/dotfiles/.zshrc > ~/.zshrc
  . ~/.zshrc
  echo "done adding aliases, ssh configs"
  exit 0
echo "have a nice day!"
