#
# Executes commands at the start of an interactive session.
#

path=(
  /usr/local/opt/{coreutils,findutils}/libexec/gnubin
  /usr/local/opt/curl/bin
  /usr/local/opt/openssl/bin
  /usr/local/opt/python/libexec/bin
  /usr/local/bin
  /usr/local/sbin
  $HOME/.local/bin
  $path
)

function activate_cloud() {
    source ~/Work/.venvs/.venv/sgolovat-openrc.sh
    source ~/Work/.venvs/.venv/bin/activate
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

function add_upgrade_reviewers () {
  if [ -z "$1" ]; then
    sha=$(git rev-parse HEAD)
  else
    sha="$1"
  fi
  ssh -p 29418 holser@review.openstack.org gerrit \
    set-reviewers -a ccamacho@redhat.com \
    -a dbengt@redhat.com -a jesse@odyssey4.me -a jistr@redhat.com \
    -a lbezdick@redhat.com \
    -a sathlang@redhat.com ${sha}
}

# Generate Random password
function generate_pass() {
    cat /dev/urandom | tr -d -c 'a-zA-Z0-9~!@#$%^&*()-_+={}[]|\:' | fold -w 16 | head -1
}

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source ~/.aliases
export GOPATH=$HOME/.go

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

source ~/.venvs/.venv/bin/activate
