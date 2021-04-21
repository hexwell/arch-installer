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
- Create a unique "glue" installation script, that contains imports of other sections of the installer, and that can be customised to fit specific installation needs.
In this way for example if you only need to configure an already installed os you can still use those parts of the script.
