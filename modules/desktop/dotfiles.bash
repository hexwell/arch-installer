#!/bin/bash

dotfiles_module() {

# IMPORTS:
#   out
#   USERNAME

out '[+] Copying dotfiles.'

local config_dir=/home/$USERNAME/.config

mkdir -p $config_dir/i3
mkdir $config_dir/alacritty

# TODO symlink the dotfiles from the repo

}

dotfiles_module
