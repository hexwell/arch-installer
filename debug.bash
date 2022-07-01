#!/bin/bash

unset TMUX

tmux new-session -d -s arch "bash <(echo 'sleep 1; ""$1""; read -p \"Press enter to exit...\"')"

logfile=${1%.bash}.log

tmux split-window -h -t arch:0 'echo > '"$logfile"' && tail -f '"$logfile"
tmux select-pane -t arch:0.0

tmux set -g -t arch mouse on

tmux a -t arch
