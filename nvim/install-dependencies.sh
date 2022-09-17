#!/bin/bash
source /etc/os-release

DISTRO=$PRETTY_NAME

if [[ $DISTRO == *"Fedora"* ]]; then
  sudo dnf install libstdc++-static
fi

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
npm install -g typescript-language-server typescript tree-sitter-cli @fsouza/prettierd
