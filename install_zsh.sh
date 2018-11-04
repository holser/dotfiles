#!/usr/bin/env zsh
set -eu

# =======
# Defaults
# =======
ZPREZTO_DIR=${ZPREZTO_DIR:-"${HOME}/.zprezto"}
GIT=${GIT:-'git'}
REPO_ADDRESS=${REPO_ADDRESS:-'https://github.com/holser/dotfiles.git'}

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

check_binary $GIT
check_binary curl

if [[ $(dscl . -read /Users/${USER} UserShell) =~ 'zsh$' ]]; then
    echo "zsh is already set"
else
    echo "Current shell is not zsh, setting zsh for current user"
    sudo dscl . -create /Users/${USER} UserShell /bin/zsh
fi

if [ -d "${ZPREZTO_DIR}" ]; then
    pushd ${ZPREZTO_DIR}
    ${GIT} pull origin master
    popd
else
    # Grab prezto code
    ${GIT} clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZPREZTO_DIR}"
fi

if [ -d ~/.dotfiles ]; then
    pushd ~/.dotfiles/
    ${GIT} pull origin master
    popd
else
    ${GIT} clone ${REPO_ADDRESS} ~/.dotfiles
fi

# Installing prezto configs except zshrc and zpreztorc
for rcfile in $(find "${ZPREZTO_DIR}"/runcoms -type f \( ! -name README.md ! -name zpreztorc ! -name zshrc \)); do
    echo "Linking ${rcfile}"
    ln -sf "${rcfile}" "${HOME}/.${rcfile:t}"
done

# Download my favourite theme
curl -sSL https://gist.githubusercontent.com/wikimatze/4c2fbaf8ebe1e8ce0c1f/raw/ed34a873ab0be5dc687b8047eb1912afabaa2014/prompt_wikimatze_setup > "${ZPREZTO_DIR}"/modules/prompt/functions/prompt_wikimatze_setup

pushd ~/.dotfiles
for file in ".zshrc" ".zpreztorc" ".aliases"; do
    link_file $file
done
popd
unset file
