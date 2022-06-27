#!/bin/bash

# IMPORTS:
#   out

out '[.] Installing WM...'

pacman --sync --needed --noconfirm i3-wm i3status noto-fonts

out '[+] WM installed.'
