#!/bin/bash

# IMPORTS:
#   out
#   USER

out "[.] Installing yay..."

pacman --refresh --sync --needed --noconfirm base-devel git

git clone https://aur.archlinux.org/yay-bin.git

cd yay-bin

chown --recursive $USER .
sudo -u $USER makepkg --noconfirm --syncdeps --install

cd ..
rm --recursive yay-bin

out "[+] yay installed."
