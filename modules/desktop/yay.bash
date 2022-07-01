#!/bin/bash

# IMPORTS:
#   out
#   install

out '[.] Installing yay...'

$install --refresh base-devel

curl https://raw.githubusercontent.com/hexwell/docker-archlinux-aur/master/add-aur.sh | bash

out '[+] yay installed.'
