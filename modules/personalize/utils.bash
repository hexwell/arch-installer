#!/bin/bash

# IMPORTS:
#   out

out '[.] Installing utils.'

pacman --sync --needed --noconfirm pulseaudio alsa-utils dmenu alacritty mate-polkit brightnessctl udisks2 udiskie wget

wget https://tools.suckless.org/dmenu/scripts/dmenu_run_with_command_history/dmenu_run_history --directory-prefix /usr/bin/
chmod +x /usr/bin/dmenu_run_history

pacman --remove --recursive --noconfirm wget

out '[+] Utils installed.'
