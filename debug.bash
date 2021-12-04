#!/bin/bash

unset TMUX

tmux new-session -d -s arch "bash <(echo 'sleep 1; ""$1""; read -p \"Press enter to exit...\"')"

tmux split-window -h -t arch:0 "echo > ""$1"".log && tail -f ""$1"".log"
tmux select-pane -t arch:0.0

tmux set -g -t arch mouse on

tmux a -t arch
