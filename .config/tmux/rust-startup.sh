#!/usr/bin/env bash

SESSION="rust-dev"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

if [ "${SESSIONEXISTS}" != "" ]
then
    # Connect and exit
    tmux attach-session -t "${SESSION}:1"
    exit 0
fi

tmux new-session -d -s ${SESSION}

tmux list-windows

# For vim
tmux rename-window -t 1 'Coding'
tmux send-keys -t 'Coding' 'vim .' C-m

# bacon | cargo | porsmo
tmux new-window -t $SESSION:2 -n 'Debug'
tmux send-keys -t 'Debug' 'bacon  .' C-m

tmux split-window -hl 30%
tmux send-keys -t 'Debug' 'cargo run .' C-m

tmux split-window -hl 30%
tmux send-keys -t 'Debug' 'porsmo' C-m

# Connect to the session
tmux attach-session -t "${SESSION}:1"

