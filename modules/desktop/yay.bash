#!/bin/bash

# IMPORTS:
#   out
#   install
#   USERNAME

out '[.] Installing yay...'

$install --refresh git base-devel

git clone https://aur.archlinux.org/yay-bin.git

cd yay-bin

chown --recursive $USERNAME .
sudo -u $USERNAME makepkg --noconfirm --syncdeps --install

cd ..
rm --recursive yay-bin

out '[+] yay installed.'
