# oh-my-zsh config
ZSH=$HOME/.oh-my-zsh

# set name of the theme to load:
# look in ~/.oh-my-zsh/themes/
# nice ones: smt, pure, kolo
ZSH_THEME="smt"

alias s="source"
alias h="history"
alias pd="pushd"

plugins=(git compleat osx autojump z)

source $ZSH/oh-my-zsh.sh

# Fixes some character issues
export LANG=en_US.UTF-8

# OSX Path config
# export PATH="/Users/bkamphaus/bin:/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin"
# append custom manpath.
# export MANPATH=/usr/local/man:$MANPATH
# export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

# OSX Compilation flags
export ARCHFLAGS="-arch x86_64"

# ls aliases
export LS_OPTIONS='--color=auto'
eval $(dircolors -b ~/.dir_colors) > /dev/null
alias la='ls $LS_OPTIONS -a'
alias ll='ls $LS_OPTIONS -lrt'
alias ls='ls $LS_OPTIONS'

# Preferred editor for local and remote sessions
export EDITOR="vim"
export PAGER="less"

# Various path config
export PATH="/usr/local/sbin:$PATH"
export PATHBASE=$PATH

# OS X Java version swapping
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
# function java7 () {
#    export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
#    export PATH=$JAVA_HOME/bin:$PATHBASE
#}
#
#function java8 () {
#    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
#    export PATH=$JAVA_HOME/bin:$PATHBASE
#}


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

# tab completion
autoload -U compinit
compinit

# prompt options
autoload  -U promptinit
promptinit

# Use vi/vim mode for terminal
set -o vi
bindkey -v
# but keep ctrl-R for reverse search
bindkey "^R" history-incremental-search-backward


# Datomic log grepping routines
function metric-grep () {
  cat *.log | perl -n -e 'print "$1 $2\n" if /^(.*) INFO .* '"$1"' {.*?'"$2"' ([0-9]+).*?}/' | less
}
function mb-grep () {
  cat *.log | perl -nle 'print $1 if /:AvailableMB.*?(\d+)/' | less
}

# So I can enter key on terminal on Mac OS X
# eval $(gpg-agent --daemon)
# export GPG_TTY=$(tty)

# annoying processes that don't have readline built in properly
export RLWRAP_EDITOR="vim '+call cursor(%L,%C)'"
