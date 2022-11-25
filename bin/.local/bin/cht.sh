#!/usr/bin/env bash

languages=$(echo "golang c cpp java python typescript" | tr " " "\n")
core_utils=$(echo "find xargs sed grep awk" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "query: " query

if echo "$languages" | grep -qs "$selected"; then
    bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less "
else
    bash -c "curl cht.sh/$selected~$query | less"
fi
