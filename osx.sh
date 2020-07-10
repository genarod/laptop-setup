#!/usr/bin/env bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew doctor

brew update

brew bundle

# brew tap ${taps[@]}

# brew install ${binaries[@]}

# brew install --appdir=$appdir ${apps[@]}

brew cleanup

# For Python virtualenv and virtualenvwrapper
pip install virtualenv virtualenvwrapper

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Enable full keyboard access
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Finder: show full path on titlebar
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
# Finder: new windows point to Home
defaults write com.apple.finder NewWindowTarget -string "PfHm"
# Finder: Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true
# Finder: Show Path bar in Finder
# defaults write com.apple.finder ShowPathbar -bool true
# echo "Show remaining battery percentage"
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# echo "Require password 5 seconds after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 5


# Show Library
chflags nohidden ~/Library/

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Bottom right screen corner → Disable Screen Saver
defaults write com.apple.dock wvous-br-corner -int 6
defaults write com.apple.dock wvous-br-modifier -int 0
# # Bottom left screen corner → Desktop
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0
# # Top right screen corner → Start screen saver
defaults write com.apple.dock wvous-tr-corner -int 5
defaults write com.apple.dock wvous-tr-modifier -int 0

# Use dark mode
# sudo defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
# defaults write com.apple.dock persistent-apps -array ""

# Safari: Don't fill passwords
defaults write com.apple.Safari AutoFillPasswords -bool false

# Safari: Show developer tools
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Transmission
mkdir -p ~/Downloads/Torrents
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Torrents"

# Don't prompt for confirmation before downloading
defaults write org.m0k.transmission DownloadAsk -bool false

# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false

# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false

# Xcode: Always use spaces for indenting
defaults write com.apple.dt.Xcode DVTTextIndentUsingTabs -bool false

# Disable opening photos when attaching iOS devices
# (not useful except for developers)
# defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES

for app in "Address Book" "Calendar" "Contacts" "Dashboard" "Dock" "Finder" \
  "Mail" "Safari" "SystemUIServer" "Terminal" "Transmission" \
  "iCal" "iTunes"; do
  killall "$app" > /dev/null 2>&1
done

# Verify Evernote
if [ -d "/Applications/Evernote.ap" ] then
   osascript -e 'tell app "System Events" to display dialog "Install Evernote from App Store"'
fi
