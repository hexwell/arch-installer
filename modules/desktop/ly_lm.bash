#!/bin/bash

# IMPORTS:
#   out
#   USERNAME

out '[.] Installing login manager...'

sudo -u $USERNAME yay -S --noconfirm ly

systemctl enable ly

sed --in-place 's/@tty2/@tty1/;s/tty2/tty7/' /usr/lib/systemd/system/ly.service
sed --in-place '/#tty/s/^#//;s/tty = 2/tty = 7/' /etc/ly/config.ini

out '[+] LM installed.'
