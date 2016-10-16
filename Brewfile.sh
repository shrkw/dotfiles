#!/bin/bash

set -e

brew update
brew upgrade

FORMULAS=( \
coreutils readline colordiff tree \
zsh tmux reattach-to-user-namespace \
git tig peco ghq jq direnv \
pyenv rbenv ruby-build \
unrar p7zip xz \
)

for f in ${FORMULAS[@]}; do
  brew install $f
done

brew install vim --with-lua

