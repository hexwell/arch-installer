#!/bin/bash

# Logging
exec 3>&1 &>$LOGFILE

# e - fail on non-zero exit codes
# u - fail on undeclared variables
# x - echo commands
# o pipefail - fail early in pipelines
set -euxo pipefail

out() {
    echo $1 >&3
}

trap "out '[!] An error occurred.'" ERR
