#!/bin/bash

utils_module() {

# IMPORTS:
#   out

out '[.] Installing utils...'

pacman --sync --needed --noconfirm pulseaudio alsa-utils dmenu alacritty brightnessctl slock mate-polkit wget

local install_dir=/usr/local/bin/

wget https://tools.suckless.org/dmenu/scripts/dmenu_run_with_command_history/dmenu_run_history https://raw.githubusercontent.com/LukeSmithxyz/voidrice/master/.local/bin/dmenumount https://raw.githubusercontent.com/LukeSmithxyz/voidrice/master/.local/bin/dmenuumount --directory-prefix $install_dir
 
chmod +x $install_dir/*

pacman --remove --recursive --noconfirm wget

out '[+] Utils installed.'

}

utils_module
