#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

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
