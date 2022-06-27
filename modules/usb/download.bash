#!/bin/bash

download_module() {

# IMPORTS:
#   out
#   MIRROR
#   isofile
#   path
#   sigfile
#   user_stdout

out '[.] Downloading...'

local current_dir=$(pwd)

cd ../..

wget "$MIRROR""/""$path""/""$isofile" "https://archlinux.org/""$path""/""$sigfile" --show-progress 2>&$user_stdout

cd $current_dir

out '[+] Downloaded.'

}
