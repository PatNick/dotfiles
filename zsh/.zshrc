# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_TMUX_AUTOSTART=false

#Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="simple"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(dnf
    fzf
    git
    vi-mode
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias vim="nvim"
alias docker="podman"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export WORKON_HOME=~/.ve
export PROJECT_HOME=~/workspace

export JAVA_HOME="/usr/lib/jvm/jre-17-openjdk"
export JDK_HOME="/usr/lib/jvm/java-17-openjdk"

export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"

export PATH=$PATH:$HOME/.local/bin

setopt hist_ignore_dups
setopt hist_ignore_space

autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete _ignore _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

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

mutt() { run_under_tmux 'neomutt'; }
aerc() { run_under_tmux 'aerc'; }
irc() { run_under_tmux irssi "TERM='screen' command irssi" }

bindkey -v
source /usr/share/fzf/shell/key-bindings.zsh
source ~/completion.zsh

alias -g Z='| fzf'

## File Manager Key Binds
cdUndoKey() {
    popd
    zle reset-prompt
    zle reset-prompt
}

cdParentKey() {
    pushd ..
    zle reset-prompt
    zle reset-prompt
}

zle -N              cdParentKey
zle -N              cdUndoKey
bindkey '^[[1;3A'   cdParentKey
bindkey '^[[1;3D'   cdUndoKey

## CDR setup
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs


bindkey -s  "tmux-sessionizer\n"

export GOPATH="$HOME/go:/usr/share/gocode"
export GOBIN="$HOME/go/bin"
export PATH="$GOBIN:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"
export MANPAGER="nvim +Man!"


alias luamake=/home/pat/sumneko/3rd/luamake/luamake

# add Pulumi to the PATH
export PATH=$PATH:/home/pat/.pulumi/bin
export BWS_ACCESS_TOKEN=0.6dea9f03-673a-4407-9ec7-b2380122e2e7.zonoH7XvgqLRMUT6vK8C2fivTWYQ76:d52FSO1CqfO3aF22S3/acg==

change_bg() {
    feh --bg-fill ~/Pictures/wallpapers/$(ls ~/Pictures/wallpapers/ | fzf)
}
