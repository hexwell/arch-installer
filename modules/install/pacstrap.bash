#!/bin/bash

out '[.] Installing OS...'

pacstrap /mnt base linux linux-firmware intel-ucode networkmanager

out '[+] OS installed.'
