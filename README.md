# Install

To install or update run:

```bash
curl -L https://github.com/holser/dotfiles/raw/master/install.sh | /bin/bash
```

To launch tmux by default add the following lines into *.bashrc*

```bash
if [[ "$TERM" != "screen-256color" ]]; then
    tmux -2 attach-session -t "$USER" || tmux -2 new-session -s "$USER" 
    exit
fi
```
