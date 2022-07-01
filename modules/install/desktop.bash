#!/bin/bash

desktop_module() {

# IMPORTS:
#   out
#   USERNAME
#   REPOSITORY_LOCATION
#   REPOSITORY_NAME
#   chroot
#   user_stdout

out '[+] Installing desktop.'

local homedir=/home/$USERNAME/

cp --recursive $REPOSITORY_LOCATION$REPOSITORY_NAME $INSTALLATION_MOUNTPOINT$homedir

$chroot bash -c "cd $homedir$REPOSITORY_NAME; ./desktop.bash" >&$user_stdout

}

desktop_module
