# shrkw’s dotfiles

- Zsh
- Tmux
- Vim
- Homebrew

## Installation

### Homebrew

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

see http://brew.sh/ for further detail

### Install ghq, fetch dotfiles and Install Formulae

```bash
# Install Repository manager
brew install ghq
ghq get https://github.com/shrkw/dotfiles.git

# Install Apps via Homebrew
bash ~/ghq/github.com/shrkw/dotfiles/Brewfile.sh
```

## Config files


```bash
cd ~/ghq/github.com/shrkw/dotfiles
```

### Get dotfiles

```bash
bash create_symlink.sh
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

