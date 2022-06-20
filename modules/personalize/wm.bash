#!/bin/bash

# IMPORTS:
#   out

out "[.] Installing WM."

pacman -S --noconfirm xorg-server i3-wm i3status noto-fonts dmenu alacritty mate-polkit

out "[+] WM installed."
