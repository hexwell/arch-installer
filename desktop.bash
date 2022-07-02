#!/bin/bash

source conf/desktop.bash
source lib/base.bash

# EXPORTS:
#   install : Command to install packages silently
#   username : Username

install='pacman --sync --needed --noconfirm'
username=${1:-$USERNAME}

cd modules/desktop


# Prepare

source ../check_root.bash
source check_username.bash


# Network

# source ../ethernet.bash
source ../wifi.bash
# source ../resolv.bash
source ../check_connection.bash


# AUR Helper

source yay.bash


# LM

source ly_lm.bash

source xorg.bash

# WM

source i3_wm.bash

# Utils

source utils.bash

source user.bash

source dotfiles.bash

out '[+] Done installing desktop.'
