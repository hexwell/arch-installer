#!/bin/bash

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

trap "if [ \$? -ne 0 ]; then out '[!] An error occurred.'; fi" EXIT
