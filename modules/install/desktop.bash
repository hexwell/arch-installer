#!/bin/bash

desktop_module() {

# IMPORTS:
#   out
#   USERNAME
#   REPOSITORY_LOCATION
#   REPOSITORY_NAME
#   INSTALLATION_MOUNTPOINT

out '[+] Installing desktop.'

local homedir=/home/$USERNAME/

cp --recursive $REPOSITORY_LOCATION$REPOSITORY_NAME $INSTALLATION_MOUNTPOINT$homedir

arch-chroot $INSTALLATION_MOUNTPOINT cd $homedir$REPOSITORY_NAME\; ./personalize.bash

}

desktop_module
