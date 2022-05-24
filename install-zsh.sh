#!/bin/bash

set -u

# Install zsh and set to default shell
# https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
echo "Installing zsh"
sudo apt-get update && sudo apt-get install zsh -y
chsh -s "$(which zsh)"

# Install oh-my-zsh as a framework for managing zsh configuration
# https://github.com/ohmyzsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Link .zshrc in this folder to one in $HOME
echo "Linking .zshrc in $PWD to \$HOME/.zshrc"
rm -rf "$HOME"/.zshrc
ln -s "$PWD"/.zshrc "$HOME"/.zshrc

# Install angigen zsh package manager
# https://github.com/zsh-users/antigen
(cd "$HOME" && curl -L git.io/antigen >antigen.zsh)
