#!/bin/bash

# IMPORTS:
#   out

out '[.] Installing login manager...'

aur-install ly

systemctl enable ly

sed --in-place 's/@tty2/@tty1/;s/tty2/tty7/' /usr/lib/systemd/system/ly.service
sed --in-place 's/#tty = 2/tty = 7/;s/#x_cmd = \/usr\/bin\/X/x_cmd = exec \/usr\/bin\/X \&> \/dev\/null/' /etc/ly/config.ini

echo kernel.printk = 3 3 3 3 > /etc/sysctl.d/20-quiet-printk.conf

out '[+] LM installed.'
