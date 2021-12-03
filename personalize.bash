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


# AUR Helper

source yay.bash


# WM

source wm.bash


out '[+] Done.'
