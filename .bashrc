#setting vi mode
#set -o vi

# don't put duplicate line in the history
export HISTCONTROL=ignoreboth:erasedups:ignorespace
# append to history file, don't overwrite it
shopt -s histappend

#setting history lenght and size 
export HISTSIZE=2000
export HISTFILESIZE=4000

#Editor settings
export EDITOR=vim
export VISUAL=${EDITOR}

#UTF-8 Support
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

PATH=$HOME/bin:$PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
