# dotfiles

Personal dotfiles for Ubuntu, managed with a bare git repo.

## Fresh machine setup

```bash
git clone git@github.com/DankersW/dotfiles.git ~/dotfiles

~/dotfiles/bootstrap.sh

# Apply dotfiles to $HOME
alias dotfiles='git --git-dir=$HOME/dotfiles/.git --work-tree=$HOME'
dotfiles checkout

# Reload shell
source ~/.zshrc
```

## Daily usage

The `dotfiles` alias is a regular git command pointed at `$HOME` as the work tree.

```bash
# Check what's changed
dotfiles status

# Track a new file
dotfiles add ~/.some_config
dotfiles commit -m "Add some config"
dotfiles push

# Pull updates on another machine
dotfiles pull
```
