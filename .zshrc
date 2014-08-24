# Path to your oh-my-zsh configuration.  
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="smt"
ZSH_THEME="pure"

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias s="source"
alias h="history"
alias pd="pushd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git compleat osx)

source $ZSH/oh-my-zsh.sh

# Fixes some character issues
export LANG=en_US.UTF-8

# Path config
export PATH="/Users/bkamphaus/Sage:/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin"

# virtualenv stuff
export PROJECT_HOME=$HOME/code/py
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/.env
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

# append custom manpath.
export MANPATH=/usr/local/man:$MANPATH
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

# ls aliases
export LS_OPTIONS='--color=auto'
eval $(dircolors -b ~/.dir_colors) > /dev/null
alias la='ls $LS_OPTIONS -a'
alias ll='ls $LS_OPTIONS -lrt'
alias ls='ls $LS_OPTIONS'

# Preferred editor for local and remote sessions
export EDITOR="vim"
export PAGER="less"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Flag for Datomic, java, etc.
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
export PATH=$JAVA_HOME/bin:$PATH

# find the directory of the named Python module.
function pymoddir () {
    echo "$(python -c "import os.path as _, ${1}; \
        print _.dirname(_.realpath(${1}.__file__[:-1]))"
        )"
}

# for riak
ulimit -n 8192 

# function for grepping through python files.
function findgrep() { find . -name "$2" -exec grep -nHr --color "$1" {} \; ; }
function greppy() { find . -name '*.py' -exec grep -nHr --color "$1" {} \; ; }
function grepcy() { find . -name '*.pyx' -exec grep -nHr --color "$1" {} \; ; }
function grepm() { find . -name '*.m' -exec grep -nHr --color "$1" {} \; ; }
function grepclj() { find . -name '*.clj' -exec grep -nHr --color "$1" {} \; ; }
function greptex() { find . -name '*.tex' -exec grep -nHr --color "$1" {} \; ; }
function greprb() { find . -name '*.rb' -exec grep -nHr --color "$1" {} \; ; }
function grepjava() { find . -name '*.java' -exec grep -nHr --color "$1" {} \; ; }
function grepjs() { find . -name '*.js' -exec grep -nHr --color "$1" {} \; ; }


# tab completion
autoload -U compinit
compinit

# prompt options
autoload  -U promptinit
promptinit

# Use vi/vim mode for terminal
set -o vi
bindkey -v

# Set ssh connections:
# source ~/.sshaliases
# lein shortcuts
alias lrepl="lein repl"
alias ltrepl="lein trampoline repl"

# AWS environment setup
source ~/.aws/aws-creds.sh

# Infinispan environment setup
export INFINISPAN_HOME="/Users/bkamphaus/infinispan-5.1.6.FINAL"
export ISPN_HOME=$INFINISPAN_HOME

# Couchbase environment setup
export PATH=$PATH:/Applications/Couchbase\ Server.app/Contents/Resources/couchbase-core/bin

# Datomic config
# export DATOMIC_VERSION=0.9.4880.2
