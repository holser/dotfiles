# Scripts and dotfiles for workstation configuration

### OS X Configuration

```bash
curl -sL https://raw.githubusercontent.com/holser/dotfiles/master/configure_osx.sh | /bin/bash
```

### Brew && OSX Software Installation

```bash
curl -sL https://raw.githubusercontent.com/holser/dotfiles/master/install_osx_software.sh | /bin/bash
```

### vim installation and confiration

```bash
curl -sL https://raw.githubusercontent.com/holser/dotfiles/master/install_vim.sh | /bin/bash
```

### zpresto installation and configuration

```bash
curl -sL https://raw.githubusercontent.com/holser/dotfiles/master/install_zsh.sh | /bin/zsh
```

To launch tmux by default add the following lines into *.bashrc*

```bash
if [[ "$TERM" != "screen-256color" ]]; then
    tmux -2 attach-session -t "$USER" || tmux -2 new-session -s "$USER"
    exit
fi
```
