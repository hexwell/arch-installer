#!/bin/bash

pacman -S base-devel openssh git xorg-server xorg-xinit xorg-xrandr xorg-xsetroot libxinerama i3-wm i3status noto-fonts

git clone https://git.suckless.org/st ~/.config/st
git clone https://git.suckless.org/dmenu ~/.config/dmenu

current_dir=$(pwd)

cd ~/.config/st
sudo make install

cd ~/.config/dmenu
sudo make install

cd $current_dir

sed -i '/# start some nice programs/,$s/^/# /' /etc/X11/xinit/xinitrc

echo exec i3 > ~/.xinitrc
echo >> ~/.xinitrc
