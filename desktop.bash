#!/bin/bash

source conf/desktop.bash
source lib/base.bash

cd modules/desktop


# Prepare

source ../check_root.bash


# Network

# source ../ethernet.bash
source ../wifi.bash
# source ../resolv.bash
source ../check_connection.bash


# AUR Helper

source yay.bash


# DM

source ly_dm.bash

source xorg.bash

# WM

source i3_wm.bash

# Utils

source utils.bash

source dotfiles.bash

out '[+] Done.'
