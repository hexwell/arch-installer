#!/bin/bash

desktop_module() {

# IMPORTS:
#   out
#   REPOSITORY_LOCATION
#   REPOSITORY_NAME
#   chroot
#   user_stdout

out '[+] Installing desktop.'

local dropdir=/root/

cp --recursive $REPOSITORY_LOCATION$REPOSITORY_NAME $INSTALLATION_MOUNTPOINT$dropdir

$chroot bash -c "cd $dropdir$REPOSITORY_NAME; ./desktop.bash" >&$user_stdout

}

desktop_module
