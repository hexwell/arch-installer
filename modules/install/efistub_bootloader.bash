#!/bin/bash

bootloader_module() {

# IMPORTS:
#   INSTALLATION_MOUNTPOINT
#   boot_partition_disk_device
#   boot_partition_number
#   root_partition_device
#
# Optionals:
#   encryption_kernel_param
#   ucode_kernel_param
#   resume_kernel_params

out '[.] Setting up bootloader.'

for var in encryption_kernel_param  ucode_kernel_param  resume_kernel_params; do
    [[ -v $var ]] || declare local $var=""
done

# Save bootloader configuration so the installation can be recovered if the firmware deletes the entry

local bootloader_setup_script="$INSTALLATION_MOUNTPOINT""/boot/setup_bootloader.bash"

echo "#!/bin/bash" > "$bootloader_setup_script"
echo efibootmgr --disk "$boot_partition_disk_device" --part "$boot_partition_number" --create --label \"arch linux\" --loader /vmlinuz-linux --unicode \""$encryption_kernel_param""root=""$root_partition_device"" rw ""$ucode_kernel_param""initrd=\initramfs-linux.img""$resume_kernel_params"\" --verbose >> "$bootloader_setup_script"
echo >> "$bootloader_setup_script"

chmod +x "$bootloader_setup_script"

"$bootloader_setup_script"

}

bootloader_module
