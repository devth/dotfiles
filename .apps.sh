echo "NOTE: Install Dropbox and let it sync before running this"



# Setup / Homebrew {{{
  open ./assets/Monaco%20for%20Powerline.otf

  mkdir -p ~/.bin # this is in PATH - can put stuff here

  echo "NOTE: Xcode must be installed"

  sudo xcodebuild -license accept

  # install homebrew
  brew -v || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# }}}

# Rely on Brewkfile
brew bundle

# not sure how to do this in Brewfile
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# gcloud / kubectl {{{

  # brew cask install google-cloud-sdk
  # brew cask uninstall google-cloud-sdk

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


# Optional tools {{{

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


# license stuff
open ~/Dropbox/Licenses/license-dash4.dash-license

