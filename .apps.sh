set -x

# Setup / Homebrew {{{
  # open ./assets/Monaco%20for%20Powerline.otf
  mkdir -p ~/.bin # this is in PATH - can put stuff here
  # sudo xcodebuild -license accept
  # install homebrew
  echo "NOTE: Xcode must be installed"
  which brew > /dev/null 2>&1
  if [ $? -eq 1 ]; then
    xcode-select --install
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
# }}}

# Tools {{{
  # brew install zsh
  brew install git
  brew install gpg
  # brew install tmux
  # brew install reattach-to-user-namespace
# }}}

# neovim {{{
  # brew install neovim --HEAD || brew reinstall neovim --HEAD
  brew install neovim
# }}}

# Utils {{{
  brew install watch
  # brew install ctags # this is outdated, use below instead for
  # https://github.com/universal-ctags/ctags
  # brew install --HEAD universal-ctags/universal-ctags/universal-ctags
  brew install graphviz
  brew install asciinema
  brew install cheat
  # brew install autojump
  brew install zoxide
  brew install sdcv
  brew install hub
  brew install watchman
  brew install pstree # process tree, like `ps fax`
  brew install cloc # lines of code counter

  # minio - S3-compatible interface client
  # https://github.com/minio/mc
  # brew install minio-mc

  # git diff
  brew install git-delta
  brew install less
# }}}

# Languages - use asdf {{{
  brew install asdf
# }}}


# json {{{
  brew install jq
  # brew install jsonnet
# }}}

# Clojure {{{
  # brew install leiningen
  # brew install borkdude/brew/clj-kondo
# }}}

# File searching and management {{{
  brew install ag
  brew install ack
  brew install tree
  brew install ripgrep
  brew install fd
  brew install fzf
# }}}

# Custom taps {{{

  # github cli
  brew install github/gh/gh
  brew tap thoughtbot/formulae
  brew install rcm
# }}}

# Brew Cask {{{
  brew install selfcontrol
  # brew install docker
  # brew install docker-machine
  brew install iterm2
  # kitty gpu accelerated terminal
  brew install --cask kitty
  brew install --cask rectangle
  # brew install --cask spotify
  brew install --cask alfred
  brew install --cask caffeine
  brew install --cask 1password-cli
  # brew install --cask slack
  # brew install --cask istat-menus
  # get license from gmail
  # brew install --cask airfoil

  # brew install dash --cask
  # open ~/Dropbox/Licenses/license-dash4.dash-license

  # Powerline fonts!
  brew install --cask \
    font-fira-code \
    font-fira-code-nerd-font \
    font-meslo-lg font-input \
    font-menlo-for-powerline \
    font-inconsolata font-inconsolata-for-powerline \
    font-meslo-lg \
    font-nixie-one \
    font-office-code-pro \
    font-pt-mono \
    font-raleway font-roboto \
    font-source-code-pro \
    font-source-code-pro-for-powerline

  # quicklook
  brew install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize suspicious-package apparency quicklookase qlvideo
  xattr -d -r com.apple.quarantine ~/Library/QuickLook

  # choosy allows configuring which browser to open a URL in
  brew install choosy --cask
  brew install --cask discord

# }}}

# Cloud tools {{{

  brew install kubectx
  brew install kubernetes-helm
  # brew install terraform
  # brew install awscli
  brew install ngrep

# }}}

# Low priority {{{

  # for image previews in vim
  brew install chafa
  brew install imagemagick

# }}}

# Manual steps (TODO automate these) {{{
# iTerm2 prefs (do not use native full screen, fonts, colors)
# System Preferences
# - Touchpad: 3 finger swipe left to go back/forward
# Configure istat-menus
# }}}


# Optional tools {{{

# do not want
install_android() {
  touch ~/.android/repositories.cfg
  # brew cask install caskroom/versions/java8
  brew cask install android-sdk
  brew cask install intel-haxm
  export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
  java8 # java 8 is required
  sdkmanager "platform-tools" "platforms;android-27" "extras;intel;Hardware_Accelerated_Execution_Manager" "build-tools;27.0.0" "system-images;android-27;google_apis;x86" "emulator"
  avdmanager create avd -n test -k "system-images;android-27;google_apis;x86"

  avdmanager list avd

  # start the emulator
  emulator -avd test -no-cache
}

# }}}
