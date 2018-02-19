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

  # cmd + F1 show terminal

  # cmd + space for Alfred

# }}}

# iTerm {{{

  # Load iterm2 colors
  # /Users/thartman/Dropbox/dotfiles/iterm2\ Colors

  # Set default shell to zsh

  # Install Solarized profiles and set it to Dark

# }}}

# restart the dock for settings to take affect
killall Dock

