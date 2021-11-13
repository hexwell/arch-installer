#!/bin/bash

set +x

unset TMUX

tmux new-session -d -s arch "sleep 1; ""$1"

tmux split-window -h -t arch:0 "echo > log && tail -f log"
tmux select-pane -t arch:0.0

tmux set -g -t arch mouse on

tmux a -t arch
