#!/bin/bash

# IMPORTS:
#   out
#   USER

out "[.] Installing yay."

pacman -Sy --needed --noconfirm base-devel openssh git

git clone https://aur.archlinux.org/yay-bin.git

cd yay-bin

runuser -u $USER makepkg -si

cd ..
rm -r yay-bin

out "[+] yay installed."
