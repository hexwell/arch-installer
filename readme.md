# Arch Linux installer

## Creating a USB installation media

```bash
git clone https://github.com/hexwell/arch-installer.git
cd arch-installer
```

- Edit `conf/usb.bash` appropriately.

```bash
./usb.bash
```

## Install

- Edit `conf/install.bash` on the created USB appropriately.
- Edit `modules/install/pacstrap.bash` on the created USB to add/remove installation of packages to your taste.
- Boot the USB using UEFI.

```bash
./install.bash
```
