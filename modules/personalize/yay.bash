#!/bin/bash

pacman -Sy --needed base-devel openssh git

git clone https://aur.archlinux.org/yay-bin.git

cd yay-bin

makepkg -si

cd ..
rm -r yay-bin
