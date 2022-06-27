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

local previous_dir=$(pwd)

cd ../..

wget "$MIRROR""/""$path""/""$isofile" "https://archlinux.org/""$path""/""$sigfile" --show-progress 2>&$user_stdout

cd $previous_dir

out '[+] Downloaded.'

}

download_module
