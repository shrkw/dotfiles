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

CASK_FORMULAS=( \
google-chrome \
firefox \
clipy \
iterm2 \
docker \
visual-studio-code \
the-unarchiver \
)

for f in ${CASK_FORMULAS[@]}; do
  brew cask install $f
done