#!/bin/bash

utils_module() {

# IMPORTS:
#   out
#   install
#   LOCKER_PKG

out '[.] Installing utils...'

$install pulseaudio alsa-utils dunst libnotify xdg-utils dmenu alacritty brightnessctl $LOCKER_PKG udisks2 mate-polkit

local install_dir=/usr/local/bin/

# These mounting scripts are used instead of udiskie (for example) to allow for manual control of mounting,
# and because udiskie only auto mounts disks, so unmount must be done manually and a helper would have been necessary anyways.

curl --output-dir $install_dir --remote-name-all https://tools.suckless.org/dmenu/scripts/dmenu_run_with_command_history/dmenu_run_history https://raw.githubusercontent.com/hexwell/voidrice/master/.local/bin/dmenumount https://raw.githubusercontent.com/hexwell/voidrice/master/.local/bin/dmenuumount

cp ../../res/notify $install_dir

chmod +x $install_dir/*

sed --in-place '/#HandlePowerKey/s/^#//;s/HandlePowerKey=poweroff/HandlePowerKey=ignore/;/#HandleLidSwitch/s/^#//;s/HandleLidSwitch=suspend/HandleLidSwitch=ignore/' /etc/systemd/logind.conf

out '[+] Utils installed.'

}

utils_module
