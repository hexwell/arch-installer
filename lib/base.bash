#!/bin/bash

# IMPORTS:
#   LOGFILE

# EXPORTS:
#   user_stdout : User stdout file descriptor
#   out : Log function
#   REPOSITORY_NAME : name of the git repository folder

# Logging
exec {user_stdout}>&1 &>"$LOGFILE"

# fail on non-zero exit codes
set -o errexit

# fail on undeclared variables
set -o nounset

# fail early in pipelines
set -o pipefail

# echo commands (for logging)
set -o xtrace

out() {
    echo $1 >&$user_stdout
}

trap "[[ \$? -eq 0 ]] || out '[!] An error occurred.'" EXIT

REPOSITORY_NAME = 'arch-installer'
