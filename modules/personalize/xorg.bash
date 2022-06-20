#!/bin/bash

# IMPORTS:
#   out

out "[.] Installing Xorg."

pacman -S --noconfirm xorg-server

out "[+] Xorg installed."
