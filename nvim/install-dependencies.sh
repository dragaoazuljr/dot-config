#!/bin/bash
source /etc/os-release

DISTRO=$PRETTY_NAME

if [[ $DISTRO == *"Fedora"* ]]; then
  sudo dnf install libstdc++-static ripgrep g++
fi

if [[ $DISTRO == *"Ubuntu"* ]]; then
  sudo apt install ripgrep
fi

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
npm install -g typescript-language-server typescript tree-sitter-cli @fsouza/prettierd

# Install C# lsp omnisharp
curl -sL https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.39.1/omnisharp-linux-x64.tar.gz | tar xvzf - -C $HOME/.bin/

