# oh-my-zsh config
ZSH=$HOME/.oh-my-zsh

# set name of the theme to load:
# look in ~/.oh-my-zsh/themes/
# nice ones: smt, pure, kolo
ZSH_THEME="smt"

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias s="source"
alias h="history"
alias pd="pushd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git compleat osx autojump z)

source $ZSH/oh-my-zsh.sh

# Fixes some character issues
export LANG=en_US.UTF-8

# Path config
export PATH="/home/bkamphaus/bin:/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin"

# virtualenv stuff
export PROJECT_HOME=$HOME/code/py
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
export PATHBASE=$PATH
export JULIA_HOME="/Applications/Julia-0.4.5.app/Contents/Resources/julia/bin" 
export PATH=$JULIA_HOME:$JAVA_HOME/bin:$PATHBASE

# find the directory of the named Python module.
function pymoddir () {
    echo "$(python -c "import os.path as _, ${1}; \
        print _.dirname(_.realpath(${1}.__file__[:-1]))"
        )"
}

# function for grepping through various code files, verbose but w/e.
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

# still want ctrl-R for reverse search
bindkey "^R" history-incremental-search-backward

# lein shortcuts
alias repl="lein repl"

# Datomic log grepping routines
function metric-grep () {
  cat *.log | perl -n -e 'print "$1 $2\n" if /^(.*) INFO .* '"$1"' {.*?'"$2"' ([0-9]+).*?}/' | less
}
function mb-grep () {
  cat *.log | perl -nle 'print $1 if /:AvailableMB.*?(\d+)/' | less
}
#-n -e 'print "$1\n" if /(:TransactionBytes .*?})/' | less
alias clj="java -cp clojure.jar clojure.main"

# So I can enter key on terminal
export GPG_TTY=$(tty)

# alias for IJulia terminal
alias ijulia="ipython console --kernel julia-0.3"

# annoying processes that don't have readline built in properly
export RLWRAP_EDITOR="vim '+call cursor(%L,%C)'"
alias pgup="postgres -D /usr/local/var/postgres"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/cuda/lib64
