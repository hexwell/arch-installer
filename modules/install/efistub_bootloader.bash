#!/bin/bash

bootloader_module() {

# IMPORTS:
#   boot_partition_disk_device
#   boot_partition_number
#   root_partition_device
#
# Optionals:
#   encryption_kernel_param
#   ucode_kernel_param
#   resume_kernel_params

out '[.] Setting up bootloader.'

set +u
if ! [ -v encryption_kernel_param ]; then
    local encryption_kernel_param=""
fi
set -u

set +u
if ! [ -v ucode_kernel_param ]; then
    local ucode_kernel_param=""
fi
set -u

set +u
if ! [ -v resume_kernel_params ]; then
    local resume_kernel_params=""
fi
set -u

# Save bootloader configuration so the installation can be recovered if the firmware deletes the entry

local bootloader_setup_script="$INSTALLATION_MOUNTPOINT""/boot/setup_bootloader.bash"

echo #!/bin/bash > "$bootloader_setup_script"
echo efibootmgr --disk "$boot_partition_disk_device" --part "$boot_partition_number" --create --label \"arch linux\" --loader /vmlinuz-linux --unicode \""$encryption_kernel_param""root=""$root_partition_device"" rw ""$ucode_kernel_param""initrd=\initramfs-linux.img""$resume_kernel_params"\" --verbose >> "$bootloader_setup_script"
echo >> "$bootloader_setup_script"

chmod +x "$bootloader_setup_script"

"$bootloader_setup_script"

}

bootloader_module
