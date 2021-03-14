# Arch Linux installer

## Creating a USB installation media

```bash
git clone https://github.com/hexwell/arch-installer.git
cd arch-installer
```

- Edit `usb.config.sh` appropriately.

```bash
./usb.sh
```

## Install

- Edit `install.config.sh` on the created USB appropriately.
- Boot the USB using UEFI.

```bash
./install.sh
```

## TODO

- Divide installation script in parts (bootstrapping (keyboard, checks, time), network, partitioning, encryption, system installation (kernel, base, bootloader), packages and customization)
