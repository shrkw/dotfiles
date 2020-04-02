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

CASK_FORMULAE=( \
google-chrome \
firefox \
clipy \
iterm2 \
docker \
visual-studio-code \
the-unarchiver \
)

for f in ${CASK_FORMULAE[@]}; do
  brew cask install $f
done