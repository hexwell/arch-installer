#!/bin/bash

# IMPORTS:
#   out
#   user_stdout
#
#   Either:
#     DEVICE
#     device

# EXPORTS:
#   override device : Installation target device

if [[ -v DEVICE ]]; then
    device="$DEVICE"
fi

out "[+] Selected '$device'."
read -p "Press enter to continue..." 2>&$user_stdout

# Clear previous line and leave caret there
echo -en "\e[1A\e[K" >&$user_stdout
