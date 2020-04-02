# shrkw’s dotfiles

- Zsh
- Tmux
- Vim
- Homebrew

## Installation

```bash
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install ghq
ghq get https://github.com/shrkw/dotfiles.git
cd ~/ghq/github.com/shrkw/dotfiles
./install.sh

bash ~/ghq/github.com/shrkw/dotfiles/Brewfile.sh
```

## Config files

### Zsh

Above shell script will create dot local files.
You can store site specific configuration.
`.zshrc` includes this file.

$HOME/.zshenv.local

### Vim

###Install NeoBundle

NeoBundle as Plugin manager.

```bash
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
```

see https://github.com/Shougo/neobundle.vim

