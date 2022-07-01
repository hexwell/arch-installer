#!/bin/bash

xorg_module() {

# IMPORTS:
#   out
#   install
#   LOCKER_CMD

out '[.] Installing Xorg...'

$install xorg-server xorg-setxkbmap xautolock xss-lock xorg-xclipboard xorg-xrandr

local xprofile=/etc/xprofile

echo setxkbmap -layout it > $xprofile
echo >> $xprofile
echo /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 \& >> $xprofile
echo >> $xprofile
echo xautolock -time 10 -locker $LOCKER_CMD \& >> $xprofile
echo xss-lock $LOCKER_CMD \& >> $xprofile
echo >> $xprofile
echo xclipboard \& >> $xprofile

out '[+] Xorg installed.'

}

xorg_module
