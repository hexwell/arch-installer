#!/bin/bash

# IMPORTS:
#   out
#   device

# EXPORTS:
#   partition_device : Device of the new partition

out '[.] Adding partition.'

(
echo n  # Create a new partition
echo    # Default type (primary)
echo    # Default number
echo    # Default first sector
echo    # Default last sector
echo w
) | fdisk "$device"

partition_device="$device""3"
