#!/bin/bash

# IMPORTS:
#   out
#   MIRROR
#   isodir
#   fileprefix
#   filepostfix
#   versiondelimiter
#
# Optionals:
#   VERSION

# EXPORTS:
#   version : Arch ISO version

if [[ -v VERSION ]]; then
    version="$VERSION"
else
    out '[.] Getting version...'
    version=$(curl "$MIRROR""/""$isodir""/latest/" | grep -Po "$fileprefix([0-9 | \.]+)$filepostfix" | head -1 | awk -F "$versiondelimiter" '{print $2}')
fi

out "[+] Using version $version."
