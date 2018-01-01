#!/bin/bash

function link_file {
    source="${PWD}/$1"
    target="${HOME}/$1"

    if [ -f "${target}" ]; then
        mv ${target}{,.$(date +%F).bak}
    fi

    ln -sf ${source} ${target}
}

if [ -d ~/.dotfiles ]; then
    pushd ~/.dotfiles/
    git pull origin master
    popd
    vim -u ~/.dotfiles/.vimrc +BundleInstall! +BundleClean! +qall
else
    git clone https://github.com/holser/dotfiles.git ~/.dotfiles
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

    pushd ~/.dotfiles
    link_file .vimrc 
    popd
    
    vim -u ~/.dotfiles/.vimrc +BundleInstall +qall
fi
