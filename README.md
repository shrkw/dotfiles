# shrkw’s dotfiles

- Zsh
- GNU Screen
- Vim
- Homebrew

## Installation

### Using Git and the bootstrap script

```bash
git clone https://github.com/shrkw/dotfiles.git && cd dotfiles && ./create_symlink.sh
```

`create_symlink.sh` is cloned from https://github.com/sugyan/dotfiles/blob/master/create_symlink.sh


## Zsh

Above shell script will create dot local files.
You can store environment specific configuration.
`.zshrc` will read this file.

    $HOME/.zshenv.local

### Dependencies

- `git clone git@github.com:rupa/z.git`

## Vim

I've used NeoBundle as Plugin manager.

## Homebrew

```
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew bundle
```

see http://brew.sh/
