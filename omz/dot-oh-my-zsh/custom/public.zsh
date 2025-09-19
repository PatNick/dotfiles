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

export GOPATH="$HOME/go:/usr/share/gocode"
export GOBIN="$HOME/go/bin"
export PATH="$GOBIN:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export MANPAGER="nvim +Man!"
export XDG_CONFIG_HOME="$HOME/.config"

export PATH=$PATH:/home/pat/.pulumi/bin

export PATH=$HOME/.local/scripts:$PATH
export PATH=$HOME/.local/bin:$PATH
