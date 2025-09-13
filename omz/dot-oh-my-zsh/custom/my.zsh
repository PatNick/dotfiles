if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

alias vim="nvim"
alias docker="podman"

export PYENV_ROOT="$HOME/.pyenv"
export WORKON_HOME=~/.ve
export PROJECT_HOME=~/workspace
export ZSH_THEME="simple"

export JAVA_HOME="/usr/lib/jvm/jre-17-openjdk"
export JDK_HOME="/usr/lib/jvm/java-17-openjdk"

export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_DEFAULT_OPTS="--style full --tmux 90%"
export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"

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

export GOPATH="$HOME/go:/usr/share/gocode"
export GOBIN="$HOME/go/bin"
export PATH="$GOBIN:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export MANPAGER="nvim +Man!"
export XDG_CONFIG_HOME="$HOME/.config"

# task bindings
eval "$(task --completion zsh)"

# add Pulumi to the PATH
export PATH=$PATH:/home/pat/.pulumi/bin
export BWS_ACCESS_TOKEN=0.6dea9f03-673a-4407-9ec7-b2380122e2e7.zonoH7XvgqLRMUT6vK8C2fivTWYQ76:d52FSO1CqfO3aF22S3/acg==

change_bg() {
    feh --bg-fill ~/Pictures/wallpapers/$(ls ~/Pictures/wallpapers/ | fzf)
}

export PATH=$HOME/.local/scripts:$PATH
export PATH=$HOME/.local/bin:$PATH
