
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

  # Use all F1, F2, etc. keys as standard function keys
  defaults write -g com.apple.keyboard.fnState -bool true

  # only show apps that are open
  defaults write com.apple.dock static-only -bool TRUE

  # indicate if an app is hidden
  defaults write com.apple.dock showhidden -bool TRUE

  # hide desktop icons
  defaults write com.apple.finder CreateDesktop -bool false
  defaults write com.apple.finder CreateDesktop false

  # Set login shell to ZSH
  if [ -n "$ZSH_VERSION" ]; then
    # assume Zsh
    echo "Shell is zsh"
  else
    # asume something else
    chsh -s /bin/zsh
  fi

  # Link dotfiles from Dropbox
  ln -sfn ~/Dropbox/dotfiles/.oh-my-zsh ~/.oh-my-zsh
  ln -sfn ~/Dropbox/dotfiles/.zshrc ~/.zshrc
  ln -sfn ~/Dropbox/dotfiles/.ssh ~/.ssh
  ln -sfn ~/Dropbox/dotfiles/.tmuxinator ~/.tmuxinator

  # ssh permissions
  chmod -R 700 ~/.ssh/

  # Standby delay to 24 hours
  sudo pmset -a standbydelay 86400

  # Disable transparency in the menu bar and elsewhere on Yosemite
  defaults write com.apple.universalaccess reduceTransparency -bool true

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

  # Enable full keyboard access for all controls
  # (e.g. enable Tab in modal dialogs)
  defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

  # Use scroll gesture with the Ctrl (^) modifier key to zoom
  defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
  defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
  # Follow the keyboard focus while zoomed in
  defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

  # Disable press-and-hold for keys in favor of key repeat
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

  # normal minimum is 15 (225 ms)
  defaults write -g InitialKeyRepeat -int 10
  # normal minimum is 2 (30 ms)
  defaults write -g KeyRepeat -int 2

  # # Set a blazingly fast keyboard repeat rate
  # defaults write NSGlobalDomain KeyRepeat -int 10
  # defaults write NSGlobalDomain InitialKeyRepeat -int 10
  # defaults write -g InitialKeyRepeat -int 2
  # defaults write -g KeyRepeat -int 2

  # defaults write -g KeyRepeat -int 1
  # defaults write -g InitialKeyRepeat -int 1

  # Dark UI
  defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

  # Increase max files in a persistent way

  # This is non-persistent:
  # sudo sysctl -w kern.maxfiles=5242880
  # sudo sysctl -w kern.maxfilesperproc=524288
  # This persists:
  if [ ! -f /Library/LaunchDaemons/limit.maxfiles.plist ]; then

    echo "Configuring maxfiles and maxfiles per proc for macOS High Sierra."
    echo "This may not work in future versions of macOS."

    sudo cp resources/limit.maxfiles.plist /Library/LaunchDaemons/limit.maxfiles.plist
    sudo cp resources/limit.maxproc.plist /Library/LaunchDaemons/limit.maxproc.plist
    sudo launchctl load -w /Library/LaunchDaemons/limit.maxfiles.plist
    sudo launchctl load -w /Library/LaunchDaemons/limit.maxproc.plist

    # From https://gist.github.com/devinrhode2/4cbf7f02a9701510d61f5be0515b8286

  fi

  # Verify
  launchctl limit maxfiles # 64000 524288
  launchctl limit maxproc # 2048 2048

# }}}

# Global Shortcuts {{{

  # TODO investigate Karabiner Elements to provide the below shortcuts

  # Example of reading global shortuts for reference:
  # defaults read -globalDomain NSUserKeyEquivalents
  # defaults find NSUserKeyEquivalents

  # System Preferences: opt + cmd + ,
  defaults write -g NSUserKeyEquivalents -dict-add "System Preferences..." "@~,";

  # Notification center: F12

  # Remap capslock to control
  # defaults write -g com.apple.keyboard.modifiermapping.1452-594-0 -array '<dict><key>HIDKeyboardModifierMappingDst</key><integer>2</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>'
  hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000E0}]}'

  # cmd + F1 show terminal

  # disable spotlight on cmd-space so Alfred can use it
  # defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "{ enabled = 0; value = { parameters = ( 32, 49, 1048576); type = standard; }; }"
  /usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c \
    "Set AppleSymbolicHotKeys:64:enabled false"
  # defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "{ enabled = 0; value = { parameters = ( 32, 49, 1048576); type = standard; }; }"
  killall Finder

  # Configure Alfred to use synced preferences
  defaults write com.runningwithcrayons.Alfred-Preferences-3 syncfolder "~/Dropbox";
  killall "Alfred 3"
  open "/Applications/Alfred 3.app"

  # cmd + space for Alfred
  # defaults read com.runningwithcrayons.Alfred-3
  # defaults write com.runningwithcrayons.Alfred-Preferences
  # defaults read | grep Alfred
  # defaults write com.runningwithcrayons.Alfred-Preferences

# }}}

# Screen {{{

  # Enable subpixel font rendering on non-Apple LCDs
  # Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
  defaults write NSGlobalDomain AppleFontSmoothing -int 1

  # Enable HiDPI display modes (requires restart)
  sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

# }}}

# Finder {{{

  # Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
  defaults write com.apple.finder QuitMenuItem -bool true

  # Finder: disable window animations and Get Info animations
  defaults write com.apple.finder DisableAllAnimations -bool true

  # Set Desktop as the default location for new Finder windows
  # For other paths, use `PfLo` and `file:///full/path/here/`
  defaults write com.apple.finder NewWindowTarget -string "PfDe"
  defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

  # Show icons for hard drives, servers, and removable media on the desktop
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
  defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
  defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

  # Finder: show hidden files by default
  #defaults write com.apple.finder AppleShowAllFiles -bool true

  # Finder: show all filename extensions
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  # Finder: show status bar
  defaults write com.apple.finder ShowStatusBar -bool true

  # Finder: show path bar
  defaults write com.apple.finder ShowPathbar -bool true

  # Display full POSIX path as Finder window title
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

  # Keep folders on top when sorting by name
  defaults write com.apple.finder _FXSortFoldersFirst -bool true

  # When performing a search, search the current folder by default
  defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

  # Disable the warning when changing a file extension
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

  # Enable spring loading for directories
  defaults write NSGlobalDomain com.apple.springing.enabled -bool true

  # Remove the spring loading delay for directories
  defaults write NSGlobalDomain com.apple.springing.delay -float 0

  # Avoid creating .DS_Store files on network or USB volumes
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

  # Disable disk image verification
  defaults write com.apple.frameworks.diskimages skip-verify -bool true
  defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
  defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

  # Automatically open a new Finder window when a volume is mounted
  defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
  defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
  defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

  # Enable the MacBook Air SuperDrive on any Mac
  # sudo nvram boot-args="mbasd=1"

  # Show the ~/Library folder
  chflags nohidden ~/Library

  # Show the /Volumes folder
  sudo chflags nohidden /Volumes

  # Expand the following File Info panes:
  # “General”, “Open with”, and “Sharing & Permissions”
  defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    OpenWith -bool true \
    Privileges -bool true

# }}}

# Dashboard, Dock {{{

  # Expand the following File Info panes:
  # “General”, “Open with”, and “Sharing & Permissions”
  defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    OpenWith -bool true \
    Privileges -bool true

  # Don’t automatically rearrange Spaces based on most recent use
  defaults write com.apple.dock mru-spaces -bool false

  # Remove the auto-hiding Dock delay
  defaults write com.apple.dock autohide-delay -float 0
  # Remove the animation when hiding/showing the Dock
  defaults write com.apple.dock autohide-time-modifier -float 0

  # Automatically hide and show the Dock
  defaults write com.apple.dock autohide -bool true

  # Make Dock icons of hidden applications translucent

# }}}

# iTerm {{{

  # Don’t display the annoying prompt when quitting iTerm
  defaults write com.googlecode.iterm2 PromptOnQuit -bool false

  # Tell iTerm to load prefs from ~/Dropbox/dotfiles/iterm2
  defaults write com.googlecode.iterm2 PrefsCustomFolder '~/Dropbox/dotfiles/iterm2'
  defaults write com.googlecode.iterm2 "LoadPrefsFromCustomFolder" -bool true

  # defaults read com.googlecode.iterm2
  # Set cmd + F1 hotkey for iTerm2
  defaults write com.googlecode.iterm2 Hotkey -int 1;
  defaults write com.googlecode.iterm2 HotkeyChar -int 63236;
  defaults write com.googlecode.iterm2 HotkeyCode -int 122;
  defaults write com.googlecode.iterm2 HotkeyModifiers -int 262401;
  defaults write com.googlecode.iterm2 HotkeyMigratedFromSingleToMulti -int 1;
  defaults write com.googlecode.iterm2 HotkeyModifiers -int 9437448;

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

