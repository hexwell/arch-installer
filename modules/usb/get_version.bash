#!/bin/bash

# IMPORTS:
#   MIRROR
#   iso_dir
#   file_prefix
#   file_postfix
#   version_delimiter
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
    version=$(curl $MIRROR/$iso_dir/latest/ | grep --perl-regexp --only-matching "$file_prefix([0-9 | \.]+)$file_postfix" | head -1 | awk --field-separator $version_delimiter '{print $2}')
fi

out "[+] Using version '$version'."
