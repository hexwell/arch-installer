#!/bin/bash

dotfiles_module() {

# IMPORTS:
#   out
#   username

out '[+] Copying dotfiles.'

local config_dir=/home/$username/.config

mkdir $config_dir/i3
mkdir $config_dir/alacritty

# TODO symlink the dotfiles from the repo

}

dotfiles_module
