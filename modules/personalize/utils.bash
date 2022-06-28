#!/bin/bash

utils_module() {

# IMPORTS:
#   out

out '[.] Installing utils...'

pacman --sync --needed --noconfirm pulseaudio alsa-utils dmenu alacritty mate-polkit brightnessctl slock wget

local install_dir=/usr/local/bin/

download() {
	wget $1 --directory-prefix $install_dir
}

download https://tools.suckless.org/dmenu/scripts/dmenu_run_with_command_history/dmenu_run_history
download https://raw.githubusercontent.com/LukeSmithxyz/voidrice/master/.local/bin/dmenumount
download https://raw.githubusercontent.com/LukeSmithxyz/voidrice/master/.local/bin/dmenuumount

chmod +x $install_dir/*

pacman --remove --recursive --noconfirm wget

out '[+] Utils installed.'

}

utils_module
