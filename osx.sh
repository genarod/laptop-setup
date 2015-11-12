#!/bin/bash

appdir="/Applications"

taps=(
    homebrew/dupes
    homebrew/completions
)

binaries=(
    bash
    bash-completion
    tmux
    gnu-which
    git
    coreutils
    findutils
    imagemagick
    ffmpeg
    the_silver_searcher
    wget
    rsync
    openssl
    htop-osx (homebrew-alt)
    ssh-copy-id
    caskroom/cask/brew-cask
    python
    python3
    pyenv
    pyenv-virtualenv
    rbenv
    ruby-build
    rbenv-gem-rehash
    rbenv-default-gems
)
# Add jenv to binaries if you need multiple versions of java)

apps=(
    firefox
    google-chrome
    skype
    slack
    virtualbox
    vagrant
    vagrant-manager
    appcleaner
    caffeine
    keepassx
    vlc
    gimp
    emacs
    transmission
    iterm2
    the-unarchiver
    java
    sourcetree
    gitup
    atom
    sublime-text
)
# Either sourcetree or gitup must go
# Either atom or sublime-text must go

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor

brew update

brew tap ${taps[@]}

brew install ${binaries[@]}

brew cask install --appdir=$appdir ${apps[@]}

brew cleanup

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

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
