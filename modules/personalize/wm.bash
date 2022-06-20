#!/bin/bash

# IMPORTS:
#   out

out "[.] Installing WM."

pacman -S --noconfirm i3-wm i3status noto-fonts

out "[+] WM installed."
