#!/bin/bash

source lib/conf.bash

# EXPORTS:
#   LOGFILE  : Log file
#   MIRROR: Arch ISO mirror url

#   DEVICE
#   VERSION


# Module: Base
# --- MANDATORY ---

LOGFILE=usb.log


# Modules: Select device, confirm device
# --- OPTIONALS ---

# DEVICE=/dev/sdX


# Module: Get version, download
# --- MANDATORY ---

MIRROR=https://archmirror.it/repos


# Module: Get version
# --- OPTIONALS ---

# VERSION=2021.02.01
