#!/bin/bash

utils_module() {

# IMPORTS:
#   out

out "[.] Installing utils..."

pacman --sync --needed --noconfirm pulseaudio alsa-utils dmenu alacritty mate-polkit brightnessctl slock wget

local install_dir=/usr/local/bin/

wget https://tools.suckless.org/dmenu/scripts/dmenu_run_with_command_history/dmenu_run_history --directory-prefix $install_dir
wget https://raw.githubusercontent.com/LukeSmithxyz/voidrice/master/.local/bin/dmenumount --directory-prefix $install_dir
wget https://raw.githubusercontent.com/LukeSmithxyz/voidrice/master/.local/bin/dmenuumount --directory-prefix $install_dir

chmod +x $install_dir/dmenu_run_history
chmod +x $install_dir/dmenumount
chmod +x $install_dir/dmenuumount

pacman --remove --recursive --noconfirm wget

out "[+] Utils installed."

}

utils_module
