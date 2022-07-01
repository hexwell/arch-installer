#!/bin/bash

utils_module() {

# IMPORTS:
#   out
#   install
#   LOCKER_PKG
#   silent_pacman

out '[.] Installing utils...'

$install pulseaudio alsa-utils dmenu alacritty brightnessctl $LOCKER_PKG mate-polkit wget

local install_dir=/usr/local/bin/

wget https://tools.suckless.org/dmenu/scripts/dmenu_run_with_command_history/dmenu_run_history https://raw.githubusercontent.com/hexwell/voidrice/master/.local/bin/dmenumount https://raw.githubusercontent.com/hexwell/voidrice/master/.local/bin/dmenuumount --directory-prefix $install_dir

chmod +x $install_dir/*

$silent_pacman --remove --recursive wget

out '[+] Utils installed.'

}

utils_module
