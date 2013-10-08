# shrkw’s dotfiles

- Zsh
- GNU Screen
- Vim

## Installation

### Using Git and the bootstrap script

```bash
git clone https://github.com/shrkw/dotfiles.git && cd dotfiles && ./create_symlink.sh
```

`create_symlink.sh` is made by https://github.com/sugyan/dotfiles/blob/master/create_symlink.sh


## Zsh

Above shell script will create dot local files.
You can store environment specific configuration.
`.zshrc` will read this file.

    $HOME/.zshenv.local


## Vim

###Install Vundle

I am using Vundle as Plugin manager.

    git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git


