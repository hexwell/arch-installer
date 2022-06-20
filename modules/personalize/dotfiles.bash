#!/bin/bash

# IMPORTS:
#   out
#   USER

out "[+] Copying dotfiles."

mkdir /home/$USER/.config/i3
mkdir /home/$USER/.config/alacritty

# TODO symlink the dotfiles from the repo
