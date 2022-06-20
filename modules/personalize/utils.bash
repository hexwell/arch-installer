#!/bin/bash

# IMPORTS:
#   out

out '[.] Installing utils.'

pacman -S --noconfirm pulseaudio alsa-utils dmenu alacritty mate-polkit

out '[+] Utils installed.'
