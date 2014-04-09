for FILE in ~/.{aliases,bash_prompt,functions}; do
    [ -r "$FILE" ] && [ -f "$FILE" ] && source "$FILE"
done
unset FILE

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

if [ $OSTYPE == "darwin"* ]; then
    complete -W "NSGlobalDomain" defaults
    complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

 PATH=$PATH:$HOME/.rvm/bin
