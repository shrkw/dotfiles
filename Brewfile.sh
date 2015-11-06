#!/bin/sh

set -e

brew update
brew upgrade

brew install coreutils
brew install readline
brew install zsh
brew install vim --with-lua
brew install tmux
brew install tree
brew install colordiff
brew install git
brew install tig
#brew install scala
brew install sbt
brew install unrar
brew install p7zip
brew install peco
brew install ghq

# Cask
brew install caskroom/cask/brew-cask

brew cask install clipmenu
brew cask install virtualbox
brew cask install vagrant
#cask install firefox
brew cask install google-chrome
#brew cask install dropbox
#brew cask install skype
#brew cask install brackets
#cask install sublime-text3
#cask install xquartz
#install sanemat/font/ricty

brew cleanup
