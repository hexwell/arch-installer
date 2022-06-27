#!/bin/bash

xorg_module() {

# IMPORTS:
#   out
#   USER

out "[.] Installing Xorg..."

pacman --sync --needed --noconfirm xorg-server xorg-setxkbmap xautolock xss-lock xclipboard xorg-xrandr

local xprofile=/home/$USER/.xprofile
local locker=slock

echo setxkbmap -layout it > $xprofile
echo >> $xprofile
echo /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 \& >> $xprofile
echo >> $xprofile
echo xautolock -time 10 -locker $locker \& >> $xprofile
echo xss-lock $locker \& >> $xprofile
echo >> $xprofile
echo xclipboard \& >> $xprofile

chown $USER /home/$USER/.xprofile

out "[+] Xorg installed."

}

xorg_module
