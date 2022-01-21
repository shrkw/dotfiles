#!/bin/bash

set -e

brew update
brew upgrade

FORMULAE=( \
coreutils \
readline \
git \
tig \
peco \
ghq \
colordiff \
tree \
jq \
direnv \
tmux \
zsh-completions \
)

for f in ${FORMULAE[@]}; do
  brew install $f
done
