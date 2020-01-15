#!/bin/bash

set -e

brew update
brew upgrade

FORMULAS=( \
coreutils readline \
tmux \
git tig peco ghq \
colordiff tree \
jq direnv \
)

for f in ${FORMULAS[@]}; do
  brew install $f
done
