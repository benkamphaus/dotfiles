# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="smt"

# Fixes some character issues
export LANG=en_US.UTF-8

# ls aliases
export LS_OPTIONS='--color=auto'
eval $(gdircolors -b ~/.dir_colors) > /dev/null
alias la='gls $LS_OPTIONS -a'
alias ll='gls $LS_OPTIONS -lrt'
alias ls='gls $LS_OPTIONS'
alias s="source"
alias h="history"
alias pd="pushd"
alias vim="nvim"
alias love="open -n -a love"

# Preferred editor for local and remote sessions
export EDITOR="nvim"
export PAGER="less"

# functions for grepping through various code files when piping from find
# -- copy/pasta verbose but w/e.
function findgrep() { find . -name "$2" -exec grep -nHr --color "$1" {} \; ; }
function greppy() { find . -name '*.py' -exec grep -nHr --color "$1" {} \; ; }
function grepcy() { find . -name '*.pyx' -exec grep -nHr --color "$1" {} \; ; }
function grepm() { find . -name '*.m' -exec grep -nHr --color "$1" {} \; ; }
function grepclj() { find . -name '*.clj' -exec grep -nHr --color "$1" {} \; ; }
function greptex() { find . -name '*.tex' -exec grep -nHr --color "$1" {} \; ; }
function greprb() { find . -name '*.rb' -exec grep -nHr --color "$1" {} \; ; }
function grepjava() { find . -name '*.java' -exec grep -nHr --color "$1" {} \; ; }
function grepjs() { find . -name '*.js' -exec grep -nHr --color "$1" {} \; ; }
function greporg() { find . -name '*.org' -exec grep -nHr --color "$1" {} \; ; }
function grepscala() { find . -name '*.scala' -exec grep -nHr --color "$1" {} \; ; }
function grepgroovy() { find . -name '*.groovy' -exec grep -nHr --color "$1" {} \; ; }
function grepedn() { find . -name '*.edn' -exec grep -nHr --color "$1" {} \; ; }
function grepjson() { find . -name '*.json' -exec grep -nHr --color "$1" {} \; ; }

# tab completion, prompt
autoload -U compinit
compinit
autoload  -U promptinit
promptinit


# Datomic log grepping routines
function metric-grep () {
  cat *.log | perl -n -e 'print "$1 $2\n" if /^(.*) INFO .* '"$1"' {.*?'"$2"' ([0-9]+).*?}/' | less
}
function mb-grep () {
  cat *.log | perl -nle 'print $1 if /:AvailableMB.*?(\d+)/' | less
}

# annoying processes that don't have readline built in properly
export RLWRAP_EDITOR="vim '+call cursor(%L,%C)'"

# zsh setup via oh-my-zsh
plugins=(git python tmux z helm kubectl vi-mode)
source $ZSH/oh-my-zsh.sh


# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/mambaforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/mambaforge/base/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/mamba.sh" ]; then
    . "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


# Use vi/vim mode for terminal
set -o vi
bindkey -v
# bindkey '\e' vi-cmd-mode
# but keep ctrl-R for reverse search
bindkey "^R" history-incremental-search-backward

alias ipython="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
alias conda=mamba
