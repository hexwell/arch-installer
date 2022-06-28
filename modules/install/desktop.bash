#!/bin/bash

desktop_module() {

# IMPORTS:
#   out
#   USERNAME
#   REPOSITORY_LOCATION
#   REPOSITORY_NAME
#   chroot

out '[+] Installing desktop.'

local homedir=/home/$USERNAME/

cp --recursive $REPOSITORY_LOCATION$REPOSITORY_NAME $INSTALLATION_MOUNTPOINT$homedir

$chroot bash -c "cd $homedir$REPOSITORY_NAME; ./personalize.bash"

}

desktop_module
