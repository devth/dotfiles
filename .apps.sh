# NOTE: Install Dropbox and let it sync before running this

open ./assets/Monaco%20for%20Powerline.otf

mkdir ~/.bin # this is in PATH - can put stuff here

# install homebrew
brew -v || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install zsh

brew install vim --with-override-system-vi

brew install watch

brew install python
brew install python3

brew tap neovim/neovim
brew info neovim
# brew install neovim
# need this commit so until it's released, install neovim from master
# https://github.com/neovim/neovim/pull/5758/commits/af2e629be4d20dda334a7c6ca817f5599956e4ff
brew install neovim --HEAD || brew reinstall neovim -- HEAD
pip3 install neovim --upgrade
pip2 install neovim --upgrade

brew tap thoughtbot/formulae
brew install rcm

brew install ctags

brew install ruby

brew install nodejs

brew install graphviz

brew install cfssl

brew install asciinema

brew install cheat

# Linter suport {{{
  brew install shellcheck
  brew install mdl
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

brew install git

brew install drip
brew install leiningen
brew install boot-clj
brew install datomic

brew install sdcv

# File searching and management {{{
brew install ag
brew install ack
brew install tree
brew install ripgrep
# }}}

brew tap codeclimate/formulae
brew install codeclimate

brew tap johanhaleby/kubetail
brew install kubetail

# required by vim tiagofumo/vim-nerdtree-syntax-highlight plugin

# minio - S3-compatible interface client
# https://github.com/minio/mc
brew install minio-mc

# Golang {{{
  go get github.com/influxdata/kapacitor/tick/cmd/tickfmt
# }}}

# Brew Cask {{{

  brew tap caskroom/cask

  # brew cask install zooom # WTF why is this dead
  # we'll obtain it from dropbox instead
  brew cask install java
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

  brew cask install gitter

# }}}

# Node {{{

npm install -g doctoc

# }}}

# gcloud / kubectl {{{

curl https://sdk.cloud.google.com | bash
echo "NOTE: you may need to reload shell your after installing gcloud"
# echo "Reloading ~/.zshrc"
# shellcheck source=/dev/null
. "$HOME/.zshrc"
gcloud components install kubectl

echo "Installing cloud_sql_proxy"
curl -o cloud_sql_proxy \
  https://dl.google.com/cloudsql/cloud_sql_proxy.darwin.amd64

mv ./cloud_sql_proxy ~/.bin
chmod +x ~/.bin/cloud_sql_proxy

# }}}

# {{{ Manual steps (TODO automate these)

# iTerm2 prefs (do not use native full screen, fonts, colors)
#
# System Preferences
# - Touchpad: 3 finger swipe left to go back/forward
#
# Configure istat-menus
#
# Configure IRC to connect to firrre:
# https://firrre.com/connect/

# }}}

