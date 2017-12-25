#!/usr/bin/env zsh 

if [[ !$(dscl . -read /Users/${USER} UserShell) =~ /zsh/ ]]; then
    echo "Current shell is not zsh, setting zsh for current user"
    sudo dscl . -create /Users/${USER} UserShell /bin/zsh
else
    echo "zsh is already set"
fi

# Grab prezto code 
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Installing prezto configs except zshrc and zpreztorc
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^(README.md|zshrc|zpreztorc)(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Download my favourite theme
curl -sSL https://gist.githubusercontent.com/wikimatze/4c2fbaf8ebe1e8ce0c1f/raw/ed34a873ab0be5dc687b8047eb1912afabaa2014/prompt_wikimatze_setup > .zprezto/modules/prompt/functions/prompt_wikimatze_setup 

function link_file {
    source="${PWD}/$1"
    target="${HOME}/$1"

    if [ -f "${target}" ]; then
        mv ${target}{,.$(date +%F).bak}
    fi

    ln -sf ${source} ${target}
}

for file in ".zshrc" ".zpreztorc" ".aliases"; do
    link_file $file
done
unset file
