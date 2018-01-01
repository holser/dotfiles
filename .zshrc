#
# Executes commands at the start of an interactive session.
#

path=(
  /usr/local/opt/coreutils/libexec/gnubin
  /usr/local/opt/findutils/libexec/gnubin
  /usr/local/opt/curl/bin
  $path
)

# Functions
# Rolling slash
function rolling_slash() {
    n=0
    str='/-\|'
    while true; do
        n=$(( (n + 1) % 4))
        printf '%s\b' "${str:$n:1}"
        sleep 1
    done
}

# Handy Extract Program
function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xvjf $1   ;;
            *.tar.gz)  tar xvzf $1   ;;
            *.bz2)     bunzip2 $1    ;;
            *.rar)     unrar x $1    ;;
            *.gz)      gunzip $1     ;;
            *.tar)     tar xvf $1    ;;
            *.tbz2)    tar xvjf $1   ;;
            *.tgz)     tar xvzf $1   ;;
            *.zip)     unzip $1      ;;
            *.Z)       uncompress $1 ;;
            *.7z)      7z x $1       ;;
            *)         echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Generate Random password
function generate_pass() {
    cat /dev/urandom | tr -d -c 'a-zA-Z0-9' | fold -w 16 | head -1
}
path=(
  /usr/local/opt/coreutils/libexec/gnubin
  /usr/local/opt/findutils/libexec/gnubin
  /usr/local/opt/curl/bin
  $path
)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source .aliases
