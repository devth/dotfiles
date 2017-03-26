# macOS {{{
# System: disable spelling
defaults write -g NSAutomaticSpelling -bool false
# System: disable smart quotes
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
# System: disable smart dashes
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
# TODO: also have to disable quotes/spelling in individual apps

# only show apps that are open
defaults write com.apple.dock static-only -bool TRUE

# indicate if an app is hidden
defaults write com.apple.dock showhidden -bool TRUE

# defaults read -g InitialKeyRepeat
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10

# restart the dock for settings to take affect
killall Dock
# }}}
