#!/bin/bash

set -ue

brew install ghq
ghq get https://github.com/shrkw/dotfiles.git
cd ~/ghq/github.com/shrkw/dotfiles
bash create_symlink.sh
bash ~/ghq/github.com/shrkw/dotfiles/Brewfile.sh
