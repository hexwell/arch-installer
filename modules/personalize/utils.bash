#!/bin/bash

# IMPORTS:
#   out

out '[.] Installing utils.'

pacman -S --noconfirm dmenu alacritty mate-polkit

out '[+] Utils installed.'
