# shrkw’s dotfiles

- Zsh
- Tmux
- Vim
- Homebrew

## Installation

### Homebrew

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
bash Brewfile.sh
```

see http://brew.sh/ for further detail

## Config files

### Get dotfiles

```bash
ghq get https://github.com/shrkw/dotfiles.git && cd ~/.ghq/github.com/shrkw/dotfiles && ./create_symlink.sh
```

`create_symlink.sh` is cloned from https://github.com/sugyan/dotfiles/blob/master/create_symlink.sh

### Zsh

Above shell script will create dot local files.
You can store environment specific configuration.
`.zshrc` will read this file.

    $HOME/.zshenv.local

### Vim

###Install NeoBundle

NeoBundle as Plugin manager.

```bash
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
```

see https://github.com/Shougo/neobundle.vim

