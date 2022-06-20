#!/bin/bash

source conf/personalize.bash
source lib/base.bash

cd modules/personalize


# Prepare

source ../check_root.bash


# Network

source ../ethernet.bash
# source ../wifi.bash
source ../resolv.bash
source ../check_connection.bash


# AUR Helper

source yay.bash


# DM

source dm.bash

# Utils

source utils.bash

# WM

source wm.bash

source dotfiles.bash

out '[+] Done.'
