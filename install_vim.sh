#!/bin/bash
set -eu

# ========
# Defaults
# ========
REPO_ADDRESS=${REPO_ADDRESS:-'https://github.com/holser/dotfiles.git'}
VIM_DIR=${VIM_DIR:-~/.vim}
VIMRC=${VIMRC:-~/.vimrc}
GIT=${GIT:-'git'}
VIM=${VIM_EXECUTABLE:-'vim'}

function link_file {
    source="${PWD}/$1"
    target="${HOME}/$1"

    if [ -f "${target}" ]; then
        mv ${target}{,.$(date +%F).bak}
    fi

    ln -sf ${source} ${target}
}

function check_binary {
    if [ -z $1 ]; then
        echo "No arguments found"
        exit 1
    fi

    if ! command -v $1; then
        echo "$1 was not found. Please install it"
    fi
}

check_binary $VIM
check_binary $GIT
check_binary curl

if [ -d ~/.dotfiles ]; then
    pushd ~/.dotfiles/
    ${GIT} pull origin master
    popd
else
    ${GIT} clone ${REPO_ADDRESS} ~/.dotfiles
fi
# Install vim-plug
curl -fLo ${VIM_DIR}/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pushd ~/.dotfiles
link_file .vimrc
for file in .vim/*.vim; do
    link_file ${file} ${VIM_DIR}
done
popd

${VIM} -u ~/.dotfiles/.vimrc +PlugInstall! +PlugUpdate! +PlugClean! +qall
