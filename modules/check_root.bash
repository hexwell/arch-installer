#!/bin/bash

# IMPORTS:
#   out

if [[ "$EUID" -ne 0 ]]; then
    out '[!] Please run as root.'
    exit 1
fi
