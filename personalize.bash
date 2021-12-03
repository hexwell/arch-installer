#!/bin/bash

source conf/root.bash
source lib/base.bash

cd modules/personalize


# Network

source ../ethernet.bash
# source ../wifi.bash
source ../resolv.bash


# AUR Helper

source yay.bash


# WM

source wm.bash


out '[+] Done.'
