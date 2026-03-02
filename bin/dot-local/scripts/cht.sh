#!/usr/bin/env bash

selected=$(cat ~/.tmux-cht-languages ~/.tmux-cht.utils | fzf)

read -p "query: " query

if grep -qs "$selected" ~/.tmux-cht-languages; then
    tmux splitw -h -t ! bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less "
else
    tmux splitw -h -t ! bash -c "curl cht.sh/$selected~$query | less"
fi
