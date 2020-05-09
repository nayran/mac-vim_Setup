#!/bin/bash

read -p "Password: " sudo_pass

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enable tap to click (Trackpad)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Homebrew packages
brew analytics off
brew install wget
brew install mysql
brew install python
brew install dockutil

# Python
easy_install pip
pip install --upgrade distribute

# Install npm
curl http://npmjs.org/install.sh | clean=no sh

# Vim
bash vim-setup.sh

# Dock
defaults write com.apple.Dock autohide -bool false
defaults write com.apple.dock show-recents -bool false
killall 'Dock'

#Dockutil
dockutil --remove 'Downloads'
dockutil --remove 'System Preferences'
dockutil --remove 'TV'
dockutil --remove 'Messages'
dockutil --remove 'Photos'
dockutil --remove 'Reminders'
dockutil --remove 'Calendar'
dockutil --remove 'Mission Control'

#Time Capsule
sudo tmutil enable

#Menu enable
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu"
killall SystemUIServer

# To do:
# Softwares: MacVim, Slack, Discord, Zoom
# Menu: Finder, Launchpad, Settings, Mail, Music, Slack, MacVim, Terminal, Discord, AppStore, Safari
