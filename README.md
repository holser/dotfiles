# Install

To Configure brew and OSX

```bash
curl -L https://github.com/holser/dotfiles/raw/master/osx_install.sh | /bin/bash
```

To install or update vim

```bash
curl -L https://github.com/holser/dotfiles/raw/master/vim_install.sh | /bin/bash
```

To install dotfiles

```bash
curl -L https://github.com/holser/dotfiles/raw/master/dot_install.sh | /bin/bash
```

To launch tmux by default add the following lines into *.bashrc*

```bash
if [[ "$TERM" != "screen-256color" ]]; then
    tmux -2 attach-session -t "$USER" || tmux -2 new-session -s "$USER" 
    exit
fi
```
