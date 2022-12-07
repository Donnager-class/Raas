#!/bin/env bash

#Neovim dependencies
sudo chmod -S ctags git curl
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#Polybar dependencies
sudo pacman -S ttc-iosevka ttf-icomoon-icons