#!/bin/bash

# IMPORTS:
#   out

out '[.] Installing login manager...'

aur-install ly

systemctl enable ly

sed --in-place 's/@tty2/@tty1/;s/tty2/tty7/' /usr/lib/systemd/system/ly.service
sed --in-place '/#tty/s/^#//;s/tty = 2/tty = 7/' /etc/ly/config.ini

out '[+] LM installed.'
