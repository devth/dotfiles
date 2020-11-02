# NOTE: Install Dropbox and let it sync before running this

# Foundations {{{
  brew "zsh"
  brew "tmux"
  brew "reattach-to-user-namespace"
  brew "git"
  brew "neovim"
# }}}

# Utils {{{
  brew "watch"
  # brew install ctags # this is outdated, use below instead for
  # https://github.com/universal-ctags/ctags
  brew "graphviz"
  brew "asciinema"
  brew "cheat"
  brew "autojump"
  brew "sdcv"
  brew "hub"
  brew "watchman"
  brew "pstree" # process tree, like `ps fax`
  brew "cloc" # lines of code counter
  # minio - S3-compatible interface client
  # https://github.com/minio/mc
  # brew install minio-mc
# }}}

# Languages {{{
  brew "ruby"
  # nvm is so slow 🐢. DO NOT WANT
  # maybe someday we'll switch to Nix 🦄
  # Installing via brew doesn't allow us to switch versions but at least it's
  # not NVM. If we ever need to switch versions, investigate having multiple
  # versions with node and switching between them?
  brew "nodejs"
  brew "yarn"
  brew "python3"
  brew "golang"
# }}}

# Database {{{
  brew "postgres", restart_service: true
# }}}

# Cloud tools, Kubernetes {{{
  brew "kubectx"
  brew "kubernetes-helm"
  brew "terraform"
  brew "ngrep"
  brew "awscli"
# }}}

# Linter suport {{{
  brew "shellcheck"
# }}}

# Security {{{
  brew "vault"
  brew "git-crypt"
  brew "cfssl"
  # Note: openssl is keg only and requires an explicit PATH in ~/.zshrc
  brew "openssl", link: true
  # brew install --force openssl
  # brew link --force openssl
# }}}

# json {{{
  brew "jq"
  brew "jsonnet"
# }}}

# Clojure {{{
  brew "leiningen"
  brew "boot-clj"
  brew "borkdude/brew/clj-kondo"
# }}}

# File searching and management {{{
  brew "ag"
  brew "ack"
  brew "tree"
  brew "ripgrep"
  brew "fd"
  brew "fzf"
# }}}

# Fonts {{{
  tap "homebrew/cask-fonts"
  cask "font-fira-code"
  cask "font-fira-code-nerd-font"
  cask "font-meslo-lg"
  cask "font-input"
  cask "font-menlo-for-powerline"
  cask "font-inconsolata"
  cask "font-inconsolata-for-powerline"
  cask "font-meslo-lg"
  cask "font-nixie-one"
  cask "font-office-code-pro"
  cask "font-pt-mono"
  cask "font-source-code-pro"
  cask "font-source-sans-pro"
# }}}

# Custom taps {{{

  # tap "github/gh/gh"
  # brew install github/gh/gh

  # brew tap codeclimate/formulae
  # brew install codeclimate

  # brew tap johanhaleby/kubetail
  # brew install kubetail

  brew "rcm"

  # required by vim tiagofumo/vim-nerdtree-syntax-highlight plugin
  # brew tap caskroom/fonts
  # brew cask install font-hack-nerd-font

  # brew tap unisonweb/unison
  # brew install unison-language

# }}}

# Desktop cask apps {{{
  # cask "jira-client"
  brew "java"

  # tap "caskroom/cask"
  # tap "caskroom/versions"

  # brew cask install zooom # WTF why is this dead
  # we'll obtain it from dropbox instead

  cask "selfcontrol"

  cask "docker"
  cask "google-chrome"
  # cask google-chrome-canary

  cask "iterm2"

  # brew cask divvy
  cask "spectacle"

  cask "spotify"

  cask "alfred"

  cask "slack"

  cask "istat-menus"

  # get license from gmail
  cask "airfoil"

  cask "dash" # docs

  cask "virtualbox"
  cask "vagrant"

  cask "gitter"

  cask "gpg-suite"
  # cask keybase

  # kubernetes IDE
  cask "lens"

  # alacritty dependencies
  # NOTE: no longer using alacritty. using kitty instead
  # brew install rustup-init
  # rustup-init -y
  # # alacritty - a blazing fast gpu-acelerated term
  # # brew install --HEAD cema-sp/homebrew-tap/alacritty
  # brew tap mscharley/homebrew
  # # brew install alacritty

  # quicklook
  cask "qlcolorcode"
  cask "qlmarkdown"
  cask "qlprettypatch"
  cask "qlstephen"
  cask "qlimagesize"
  cask "quicklook-csv"
  cask "quicklook-json"
  cask "epubquicklook"

  # brew cask install sharemouse
  # toggl time tracking
  # brew cask install toggl-beta

  # choosy allows configuring which browser to open a URL in
  cask "choosy"

  # kitty gpu accelerated terminal
  cask "kitty"

  # keep mac awake
  cask "caffeine"
  # cask install keybase

  cask "discord"

# }}}


# }}}
