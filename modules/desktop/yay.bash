#!/bin/bash

# IMPORTS:
#   out
#   USERNAME

out '[.] Installing yay...'

pacman --refresh --sync --needed --noconfirm git base-devel

git clone https://aur.archlinux.org/yay-bin.git

cd yay-bin

chown --recursive $USERNAME .
sudo -u $USERNAME makepkg --noconfirm --syncdeps --install

cd ..
rm --recursive yay-bin

out '[+] yay installed.'
