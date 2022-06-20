#!/bin/bash

# IMPORTS:
#   out
#   USER

out "[.] Installing Xorg."

pacman -S --noconfirm xorg-server

echo setxkbmap -layout it > /home/$USER/.xprofile
echo >> /home/$USER/.xprofile
echo /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 \& >> /home/$USER/.xprofile

chown $USER /home/$USER/.xprofile

out "[+] Xorg installed."
