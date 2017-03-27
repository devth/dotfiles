# NOTE: Install Dropbox and let it sync before running this

open ./assets/Monaco%20for%20Powerline.otf

# install homebrew
brew -v || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install zsh

brew install vim --with-override-system-vi

brew install python
brew install python3

brew tap neovim/neovim
brew info neovim
# brew install neovim
# need this commit so until it's released, install neovim from master
# https://github.com/neovim/neovim/pull/5758/commits/af2e629be4d20dda334a7c6ca817f5599956e4ff
brew install neovim --HEAD
pip3 install neovim --upgrade
pip2 install neovim --upgrade

brew tap thoughtbot/formulae
brew install rcm

brew install ctags

brew install ruby

brew install nodejs

brew install graphviz

brew install cfssl


# Linter suport {{{
  brew install shellcheck
  brew search mdl
# }}}


# This is keg only and requires an explicit PATH in ~/.zshrc
# echo 'export PATH="/usr/local/opt/openssl/bin:$PATH"' >> ~/.zshrc
brew info openssl
brew install --force openssl
brew link --force openssl

brew install vault

brew install fzf

brew install jq

brew install kubernetes-helm

brew install tmux
brew install reattach-to-user-namespace

brew install golang

brew install autojump

brew install kubernetes-helm

brew install mas
mas install 918858936 # Airmail 3 (3.2.1)
mas install 413857545 # Divvy (1.5)
mas install 957734279 # Toggl Desktop
mas install 409789998 # Twitter
mas install 414030210 # LimeChat
mas install 443987910 # 1Password - Password Manager and Secure Wallet
mas install 406056744 # Evernote - stay organized
mas install 416581096 # QuickCal

mas upgrade

brew install git

brew tap caskroom/cask

# brew cask install zooom # WTF why is this dead
# we'll obtain it from dropbox instead
brew cask install java
brew install drip
brew install leiningen
brew install boot-clj
brew install datomic



brew install ag
brew install ack
brew install tree

brew tap codeclimate/formulae
brew install codeclimate

# required by vim tiagofumo/vim-nerdtree-syntax-highlight plugin
brew tap caskroom/fonts   
brew cask install font-hack-nerd-font

brew cask install selfcontrol

# brew install docker
# brew install docker-machine
brew cask install docker

brew cask install google-chrome

brew tap caskroom/versions
brew cask install google-chrome-canary

brew cask install iterm2

brew cask install divvy

brew cask install spotify

brew cask install alfred

brew cask install 1password

brew cask install slack

brew cask install istat-menus


# get license from gmail
brew cask install airfoil


brew cask install dash
open ~/Dropbox/Licenses/license-dash4.dash-license


#
# Node
#

npm install -g doctoc


#
# gcloud / kubectl
#

curl https://sdk.cloud.google.com | bash
echo "NOTE: you may need to reload shell your after installing gcloud"
echo "Reloading ~/.zshrc"
# shellcheck source=/dev/null
. "$HOME/.zshrc"
gcloud components install kubectl

#
# Manual steps (TODO automate these)
#

# iTerm2 prefs (do not use native full screen, fonts, colors)
#
# System Preferences
# - Touchpad: 3 finger swipe left to go back/forward
#
# Configure istat-menus
#
# Configure IRC to connect to firrre:
# https://firrre.com/connect/
