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

  # restart the dock for settings to take affect
  killall Dock

# }}}

# Global Shortcuts {{{

  # Example of reading global shortuts for reference:
  # defaults read -globalDomain NSUserKeyEquivalents

  # System Preferences: opt + cmd + ,
  defaults write -globalDomain NSUserKeyEquivalents -dict-add \
    "System Preferences..." "@~,";

  # Notification center: F12

# }}}
