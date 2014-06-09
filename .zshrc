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


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git compleat osx)

source $ZSH/oh-my-zsh.sh

# User configuration

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

# function for grepping through python files.
function greppy() { find . -name '*.py' -exec grep -nHr --color "$1" {} \; ; }
function grepcy() { find . -name '*.pyx' -exec grep -nHr --color "$1" {} \; ; }
function grepm() { find . -name '*.m' -exec grep -nHr --color "$1" {} \; ; }
function grepclj() { find . -name '*.clj' -exec grep -nHr --color "$1" {} \; ; }
function greptex() { find . -name '*.tex' -exec grep -nHr --color "$1" {} \; ; }

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
