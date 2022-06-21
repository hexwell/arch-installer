#!/bin/bash

# IMPORTS:
#   out
#   USER

out '[.] Installing display manager.'

sudo -u $USER yay -S --noconfirm ly

systemctl enable ly

sed -i 's/@tty2/@tty1/;s/tty2/tty7/' /usr/lib//systemd/system/ly.service
sed -i '/#tty/s/^#//;s/tty = 2/tty = 7/' /etc/ly/config.ini

out '[+] DM installed.'
