if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

alias vim="nvim"
alias docker="podman"

setopt hist_ignore_dups
setopt hist_ignore_space

autoload -Uz compinit
compinit

run_under_tmux() {
    command -v tmux >/dev/null 2>&1 || return 1

    if [ -z "$1" ]; then return 1; fi
    local window_name="$1"
    if [ -n "$2" ]; then
        local execute="$2"
    else
        local execute="command ${window_name}"
    fi

    tmux neww -Sn "${window_name}" "${execute}"
}

aerc() { run_under_tmux 'aerc'; }
irc() { run_under_tmux irssi "TERM='screen' command irssi" }

bindkey -v
source <(fzf --zsh)

alias -g Z='| fzf'

bindkey -s  "tmux-sessionizer\n"

# source $HOME/dotfiles/omz/dot-oh-my-zsh/custom/public.zsh
# source $HOME/dotfiles/omz/dot-oh-my-zsh/custom/private.zsh

if [ -f "$ZSH_CUSTOM/public.zsh" ]; then source "$ZSH_CUSTOM/public.zsh"; fi
if [ -f "$ZSH_CUSTOM/private.zsh" ]; then source "$ZSH_CUSTOM/private.zsh"; fi

# task bindings
eval "$(task --completion zsh)"

change_bg() {
    feh --bg-fill ~/Pictures/wallpapers/$(ls ~/Pictures/wallpapers/ | fzf)
}
