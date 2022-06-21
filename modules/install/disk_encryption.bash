#!/bin/bash

disk_encryption_module() {

# IMPORTS:
#   out
#   LUKSPASS
#   DMNAME
#   root_partition_device

# EXPORTS:
#   enable_encryption : Set if encryption is required
#   encryption_kernel_param : LUKS disk encryption kernel parameter
#   override root_partition_device : Device of the root partition


# TODO mind that if partitions exist this is interactive.
# TODO maybe don't use STDIN for password input. If you do, you need to delete the log.
# TODO Mind that in the log there's also the wifi pass, so either that has to change or the log has to be deleted anyways.

out '[.] Setting up disk encryption.'
echo -n "$LUKSPASS" | cryptsetup --verbose --key-file - luksFormat "$root_partition_device"
echo -n "$LUKSPASS" | cryptsetup --key-file - open "$root_partition_device" $DMNAME

enable_encryption=true

local DEV_UUID=$(blkid -s UUID -o value "$root_partition_device")
encryption_kernel_param="cryptdevice=UUID=""$DEV_UUID"":""$DMNAME"" "
root_partition_device=/dev/mapper/$DMNAME

}

disk_encryption_module
