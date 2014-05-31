# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="smt"
ZSH_THEME="pure"

alias zshconfig="mvim ~/.zshrc"
alias ohmyzsh="mvim ~/.oh-my-zsh"
alias s="source"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git compleat osx)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/bkamphaus/Sage:/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin"

# virtualenv stuff
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

# alias to turn on caleuche
alias cal-on="wol 40:61:86:f2:9f:44"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Flag for Datomic
export JAVA_HOME="/usr"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

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

# custom prompt test
#export PROMPT='$fg_bold[green]% @%m $fg_bold[blue]$(git_prompt_info) %'
#export RPROMPT=''

# prompt options
#alias simple="prompt adam1"
#alias verbose="prompt clint"

#prompt="(精力善用)λ "

# Option to uncomment to use MacVim if necessary.
#alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# Use vi/vim mode for terminal
set -o vi
bindkey -v

# set alias for matlab
alias matlab="/Applications/MATLAB_R2011a_Student.app/bin/matlab -nodisplay"

# Set ssh connections:
source ~/.sshaliases
