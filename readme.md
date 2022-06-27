# Arch Linux Installer

## Features

- USB creator
- Modular
- Minimal
- Blazing fast
- Disk encryption 
- EFISTUB bootloader
- ly display manager
- i3 window manager
- yay included

## Creating a USB installation media

```bash
git clone https://github.com/hexwell/arch-installer.git
cd arch-installer
```

- Edit `conf/usb.bash` appropriately.

```bash
sudo ./usb.bash
```

## Install

- Edit `conf/install.bash` on the created USB appropriately.
- Edit `install.bash` on the created USB to enable/disable modules to your liking. 
- Edit `modules/install/pacstrap.bash` on the created USB to add/remove installation of packages to your taste.
- Boot the USB using UEFI.

```bash
./install.bash
```
