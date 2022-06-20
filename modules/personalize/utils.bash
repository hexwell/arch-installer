#!/bin/bash

# IMPORTS:
#   out

out '[.] Installing utils.'

pacman -S --noconfirm pulseaudio alsa-utils dmenu alacritty mate-polkit acpilight wget

wget https://tools.suckless.org/dmenu/scripts/dmenu_run_with_command_history/dmenu_run_history -P /usr/bin/
chmod +x /usr/bin/dmenu_run_history

pacman -Rs --noconfirm wget

out '[+] Utils installed.'
