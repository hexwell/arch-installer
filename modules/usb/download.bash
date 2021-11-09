#!/bin/bash

out '[.] Downloading...'
wget $MIRROR/$path/$isofile https://archlinux.org/$path/$sigfile $(if ! $DEBUG; then echo "-q"; fi) --show-progress 2>&3
out '[+] Downloaded.'
