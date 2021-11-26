#!/bin/bash

# IMPORTS:
#   LOGFILE
#
# EXPORTS:
#   out : Log function
#   user_stdout : User stdout file descriptor

# Logging
exec {user_stdout}>&1 &>"$LOGFILE"

# e - fail on non-zero exit codes
# u - fail on undeclared variables
# x - echo commands (for logging)
# o pipefail - fail early in pipelines
set -euxo pipefail

out() {
    echo $1 >&$user_stdout
}

trap "[[ \$? -eq 0 ]] || out '[!] An error occurred.'" EXIT
