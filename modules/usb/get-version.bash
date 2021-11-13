#!/bin/bash

set +u
if [ -v VERSION ]; then
    set -u
    version="$VERSION"
else
    set -u
    out '[.] Getting version...'
    version=$(curl "$MIRROR""/""$isodir""/latest/" | grep -Po "$fileprefix([0-9 | \.]+)$filepostfix" | head -1 | awk -F "$versiondelimiter" '{print $2}')
fi

out "[+] Using version $version."
