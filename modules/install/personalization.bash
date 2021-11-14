#!/bin/bash

out '[.] Applying personalizations.'

arch-chroot /mnt ln -sf /usr/share/zoneinfo/""$TZ"" /etc/localtime
arch-chroot /mnt hwclock --systohc

LOCALE="$LANG"" UTF-8"

sed -i "/#""$LOCALE""/s/^#//" /mnt/etc/locale.gen

arch-chroot /mnt locale-gen

echo "LANG=""$LANG" > /mnt/etc/locale.conf
echo >> /mnt/etc/locale.conf

echo "KEYMAP=""$KEYBOARD" > /mnt/etc/vconsole.conf
echo >> /mnt/etc/vconsole.conf

echo "$HOST" > /mnt/etc/hostname
echo >> /mnt/etc/hostname

arch-chroot /mnt echo -n root:$PW | chpasswd

arch-chroot /mnt systemctl enable NetworkManager
