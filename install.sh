#!/bin/bash

set -ue

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install ghq
ghq get https://github.com/shrkw/dotfiles.git
cd ~/ghq/github.com/shrkw/dotfiles
bash create_symlink.sh
bash ~/ghq/github.com/shrkw/dotfiles/Brewfile.sh