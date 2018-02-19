
# macOS Settings {{{

  # System: disable spelling

  # Disable automatic capitalization as it’s annoying when typing code
  defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

  # Disable smart dashes as they’re annoying when typing code
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

  # Disable automatic period substitution as it’s annoying when typing code
  defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

  # Disable smart quotes as they’re annoying when typing code
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

  # Disable auto-correct
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

  # TODO: also have to disable quotes/spelling in individual apps

  # only show apps that are open
  defaults write com.apple.dock static-only -bool TRUE

  # indicate if an app is hidden
  defaults write com.apple.dock showhidden -bool TRUE

  # defaults read -g InitialKeyRepeat
  defaults write -g KeyRepeat -int 0
  defaults write -g InitialKeyRepeat -int 10

  # hide desktop icons
  defaults write com.apple.finder CreateDesktop -bool false
  defaults write com.apple.finder CreateDesktop false

  # Set login shell to ZSH
  chsh -s /bin/zsh
  ln -sfn ~/Dropbox/dotfiles/.oh-my-zsh ~/.oh-my-zsh
  ln -sfn ~/Dropbox/dotfiles/.zshrc ~/.zshrc

  # Standby delay to 24 hours
  sudo pmset -a standbydelay 86400

  # Disable transparency in the menu bar and elsewhere on Yosemite
  defaults write com.apple.universalaccess reduceTransparency -bool true

  # Menu bar: hide the Time Machine and User icons
  defaults -currentHost write dontAutoLoad -array \
    "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
    "/System/Library/CoreServices/Menu Extras/Clock.menu" \
    "/System/Library/CoreServices/Menu Extras/User.menu"
  defaults write com.apple.systemuiserver menuExtras -array \
    "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
    "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
    "/System/Library/CoreServices/Menu Extras/Battery.menu"

  # Expand save panel by default
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

  # Expand print panel by default
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

  # Disable the “Are you sure you want to open this application?” dialog
  defaults write com.apple.LaunchServices LSQuarantine -bool false

  # Restart automatically if the computer freezes
  sudo systemsetup -setrestartfreeze on


# }}}

# Global Shortcuts {{{

  # TODO investigate Karabiner Elements to provide the below shortcuts

  # Example of reading global shortuts for reference:
  defaults read -globalDomain NSUserKeyEquivalents
  defaults find NSUserKeyEquivalents

  # System Preferences: opt + cmd + ,
  defaults write -g NSUserKeyEquivalents -dict-add "System Preferences..." "@~,";

  # Notification center: F12

  # Remap capslock to control
  defaults write -g com.apple.keyboard.modifiermapping.1452-594-0 -array '<dict><key>HIDKeyboardModifierMappingDst</key><integer>2</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>'


  # cmd + F1 show terminal

  # cmd + space for Alfred

# }}}

# iTerm {{{

  # Don’t display the annoying prompt when quitting iTerm
  defaults write com.googlecode.iterm2 PromptOnQuit -bool false

  # Tell iTerm to load prefs from ~/Dropbox/dotfiles/iterm2
  defaults write com.googlecode.iterm2 PrefsCustomFolder '~/Dropbox/dotfiles/iterm2' 
  defaults write com.googlecode.iterm2 "LoadPrefsFromCustomFolder" -bool true

# }}}

# Mac App Store {{{

  # Enable the WebKit Developer Tools in the Mac App Store
  defaults write com.apple.appstore WebKitDeveloperExtras -bool true

  # Enable Debug Menu in the Mac App Store
  defaults write com.apple.appstore ShowDebugMenu -bool true

  # Enable the automatic update check
  defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

  # Check for software updates daily, not just once per week
  defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

  # Download newly available updates in background
  defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

  # Install System data files & security updates
  defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

  # Automatically download apps purchased on other Macs
  defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

  # Turn on app auto-update
  defaults write com.apple.commerce AutoUpdate -bool true

  # Allow the App Store to reboot machine on macOS updates
  defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

# }}}


# Google Chrome & Google Chrome Canary {{{

# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true

# Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true

# }}}

# restart the dock for settings to take affect
killall Dock

