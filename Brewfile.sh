#!/bin/bash

set -e

brew update
brew upgrade

FORMULAS=( \
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
)

for f in ${FORMULAS[@]}; do
  brew install $f
done
