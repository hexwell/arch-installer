#!/bin/bash

xorg_module() {

# IMPORTS:
#   out
#   install
#   LOCKER_CMD

out '[.] Installing Xorg...'

$install xorg-server xautolock xss-lock xorg-xclipboard xorg-xrandr

local xprofile=/etc/xprofile

echo /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 \& >> $xprofile
echo >> $xprofile
echo xss-lock $LOCKER_CMD \& >> $xprofile

out '[+] Xorg installed.'

}

xorg_module
