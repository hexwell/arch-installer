#!/bin/bash

wm_module() {

# IMPORTS:
#   out
#   USER

out "[.] Installing WM."

pacman -S --noconfirm base-devel openssh git xorg-server xorg-xinit xorg-xrandr xorg-xsetroot libxinerama i3-wm i3status noto-fonts

git clone https://git.suckless.org/st /home/$USER/.config/st
git clone https://git.suckless.org/dmenu /home/$USER/.config/dmenu

current_dir=$(pwd)

cd /home/$USER/.config/st
make install

cd /home/$USER/.config/dmenu
make install

cd $current_dir

chown -R $USER /home/$USER/.config

sed -i '/# start some nice programs/,$s/^/# /' /etc/X11/xinit/xinitrc

echo exec i3 > /home/$USER/.xinitrc
echo >> /home/$USER/.xinitrc

chown $USER /home/$USER/.xinitrc

out "[+] WM installed."

}

wm_module
