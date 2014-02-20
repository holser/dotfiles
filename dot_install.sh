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
    for file in .[a-zA-Z]*; do
        link_file $file 
    done 
    popd
fi
