#!/usr/bin/env bash
selected=$(go list all std | fzf --preview 'go doc {1}')
read -p "query: " query
go doc $selected $query | less
