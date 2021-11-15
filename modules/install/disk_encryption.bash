#!/bin/bash

disk_encryption_module() {

# IMPORTS:
#   out
#   LUKSPASS : LUKS encryption passphrase
#   DMNAME : device mapper name
#   root_partition_device : the device of the root partition
#
# EXPORTS:
#   encryption_kernel_param
#   override root_partition_device : the device of the root partition


# TODO mind that if partitions exist this is interactive.
# TODO maybe don't use STDIN for password input. If you do, you need to delete the log.
# TODO Mind that in the log there's also the wifi pass, so either that has to change or the log has to be deleted anyways.

out '[.] Setting up disk encryption.'
echo -n "$LUKSPASS" | cryptsetup -v -d - luksFormat "$root_partition_device"
echo -n "$LUKSPASS" | cryptsetup -d - open "$root_partition_device" $DMNAME

local DEV_UUID=$(blkid -s UUID -o value "$root_partition_device")
encryption_kernel_param="cryptdevice=UUID=""$DEV_UUID"":""$DMNAME"" "
root_partition_device=/dev/mapper/$DMNAME

}

disk_encryption_module
