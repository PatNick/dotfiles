#!/usr/bin/env bash

languages=$(echo "golang c cpp java python typescript rust" | tr " " "\n")
core_utils=$(echo "find xargs sed grep awk git docker" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "query: " query

if echo "$languages" | grep -qs "$selected"; then
    tmux splitw -h -t ! bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less "
else
    tmux splitw -h -t ! bash -c "curl cht.sh/$selected~$query | less"
fi
