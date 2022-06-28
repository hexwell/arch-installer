#!/bin/bash

# IMPORTS:
#   MIRROR
#   isodir
#   fileprefix
#   filepostfix
#   versiondelimiter
#   out
#
# Optionals:
#   VERSION

# EXPORTS:
#   version : Arch ISO version

if [[ -v VERSION ]]; then
    version=$VERSION
else
    out '[.] Getting version...'
    version=$(curl $MIRROR/$isodir/latest/ | grep --perl-regexp --only-matching "$fileprefix([0-9 | \.]+)$filepostfix" | head -1 | awk --field-separator $versiondelimiter '{print $2}')
fi

out "[+] Using version '$version'."
