#
# Executes commands at the start of an interactive session.
#

path=(
  /opt/local/{bin,sbin}
  /usr/local/opt/{coreutils,findutils}/libexec/gnubin
  /usr/local/opt/curl/bin
  /usr/local/opt/openssl/bin
  /usr/local/sbin
  $path
)

function activate_cloud() {
    source ~/Work/.venv/sgolovat-openrc.sh
    source ~/Work/.venv/bin/activate
}
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

# Generate Random password
function generate_pass() {
    cat /dev/urandom | tr -d -c 'a-zA-Z0-9' | fold -w 16 | head -1
}

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source ~/.aliases
export GOPATH=$HOME/.go
