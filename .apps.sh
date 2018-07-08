echo "NOTE: Install Dropbox and let it sync before running this"



# Setup / Homebrew {{{
  open ./assets/Monaco%20for%20Powerline.otf

  mkdir -p ~/.bin # this is in PATH - can put stuff here

  echo "NOTE: Xcode must be installed"

  sudo xcodebuild -license accept

  # install homebrew
  brew -v || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# }}}

# Foundations {{{

  brew install zsh
  brew install vim --with-override-system-vi
  brew install tmux
  brew install reattach-to-user-namespace
  brew install git

# }}}

# Utils {{{
  brew install watch
  brew install ctags
  brew install graphviz
  brew install asciinema
  brew install cheat
  brew install autojump
  brew install sdcv
  brew install hub
  brew install watchman

  # minio - S3-compatible interface client
  # https://github.com/minio/mc
  brew install minio-mc
# }}}

# Languages {{{
  brew install ruby

  # nodejs
  #
  # This installs nvm, which we don't currently use.
  # curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
  # nvm install node
  # nvm use node
  # nvm alias default node
  # nvm is so slow 🐢. DO NOT WANT
  #
  # Installing via brew doesn't allow us to switch versions but at least it's
  # not NVM. If we ever need to switch versions, investigate having multiple
  # versions with node and switching between them?
  brew install nodejs
  brew install yarn --without-node
  # maybe someday we'll switch to Nix 🦄

  brew install python
  brew install python3
  brew install golang
# }}}

# Database {{{

brew install postgres
brew services start postgresql

# }}}

# Linter suport {{{
  brew install shellcheck
  brew install mdl
# }}}

# Security {{{

  brew install vault
  brew install git-crypt
  brew install cfssl

  echo "Note: openssl is keg only and requires an explicit PATH in ~/.zshrc"
  # shellcheck disable=SC2016
  echo 'export PATH="/usr/local/opt/openssl/bin:$PATH" >> ~/.zshrc'
  # echo 'export PATH="/usr/local/opt/openssl/bin:$PATH"' >> ~/.zshrc
  brew info openssl
  brew install --force openssl
  brew link --force openssl

# }}}

# json {{{

  brew install jq
  brew install jsonnet

# }}}

# Clojure {{{
  # Drip requires java 8 :(
  brew cask install homebrew/cask-versions/java8
  brew install drip
  brew install leiningen
  brew install boot-clj
  brew install datomic
# }}}

# File searching and management {{{

  brew install ag
  brew install ack
  brew install tree
  brew install ripgrep
  brew install fzf

# }}}

# Custom taps {{{

  brew tap codeclimate/formulae
  brew install codeclimate

  brew tap johanhaleby/kubetail
  brew install kubetail

  # brew tap neovim/neovim
  # brew untap neovim/neovim
  # brew install neovim
  # need this commit so until it's released, install neovim from master
  # https://github.com/neovim/neovim/pull/5758/commits/af2e629be4d20dda334a7c6ca817f5599956e4ff
  brew install neovim --HEAD || brew reinstall neovim --HEAD
  pip3 install neovim --upgrade
  pip2 install neovim --upgrade

  brew tap thoughtbot/formulae
  brew install rcm

  # required by vim tiagofumo/vim-nerdtree-syntax-highlight plugin
  brew tap caskroom/fonts
  brew cask install font-hack-nerd-font

# }}}

# Brew Cask {{{

  brew tap caskroom/cask

  # brew cask install zooom # WTF why is this dead
  # we'll obtain it from dropbox instead

  brew cask install java

  brew cask install vimr

  brew cask install backblaze

  brew cask install selfcontrol

  # brew install docker
  # brew install docker-machine
  brew cask install docker

  brew cask install google-chrome

  brew tap caskroom/versions
  brew cask install google-chrome-canary

  brew cask install iterm2

  # brew cask install divvy
  brew cask install spectacle

  brew cask install spotify

  brew cask install alfred

  brew cask install slack

  brew cask install istat-menus

  # get license from gmail
  brew cask install airfoil

  brew cask install dash
  open ~/Dropbox/Licenses/license-dash4.dash-license

  brew cask install virtualbox
  brew cask install vagrant

  brew cask install gitter

  brew cask install gpgtools

  brew cask install keybase

  # rest client
  brew cask install insomnia

  # alacritty dependencies
  brew install rustup-init
  rustup-init -y
  # alacritty - a blazing fast gpu-acelerated term
  # brew install --HEAD cema-sp/homebrew-tap/alacritty
  brew tap mscharley/homebrew
  brew install --HEAD alacritty

  brew cask install macvim

  # Powerline fonts!
  brew cask install \
    font-anonymous-pro \
    font-dejavu-sans-mono-for-powerline \
    font-droid-sans-mono-for-powerline \
    font-meslo-lg font-input \
    font-menlo-for-powerline \
    font-inconsolata font-inconsolata-for-powerline \
    font-meslo-lg \
    font-nixie-one \
    font-office-code-pro \
    font-pt-mono \
    font-raleway font-roboto \
    font-source-code-pro font-source-code-pro-for-powerline \
    font-source-sans-pro

  # quicklook
  brew cask install \
    qlcolorcode qlmarkdown qlprettypatch qlstephen \
    qlimagesize \
    quicklook-csv quicklook-json epubquicklook

  brew cask install sharemouse

  # toggl time tracking
  brew cask install toggl-beta

  # choosy allows configuring which browser to open a URL in
  brew cask install choosy

# }}}

# gcloud / kubectl {{{

  brew cask install google-cloud-sdk

  # curl https://sdk.cloud.google.com | bash
  # echo "NOTE: you may need to reload shell your after installing gcloud"
  # # echo "Reloading ~/.zshrc"
  # # shellcheck source=/dev/null
  # . "$HOME/.zshrc"

  gcloud components install kubectl

  echo "Installing cloud_sql_proxy"
  curl -o cloud_sql_proxy \
    https://dl.google.com/cloudsql/cloud_sql_proxy.darwin.amd64

  mv ./cloud_sql_proxy ~/.bin
  chmod +x ~/.bin/cloud_sql_proxy

# }}}

# Cloud tools {{{

  brew install kubernetes-helm
  brew install terraform
  brew install ngrep

  brew tap drone/drone
  brew install drone # --HEAD

# }}}

# Manual steps (TODO automate these) {{{

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
