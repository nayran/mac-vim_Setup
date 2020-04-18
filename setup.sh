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

#iTerm
wget https://iterm2.com/downloads/stable/iTerm2-3_3_9.zip
tar xf iTerm2-3_3_9.zip
mv iTerm.app /Applications
rm iTerm2-3_3_9.zip 

# Vim
#oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
#pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
#42Header
git clone https://github.com/pandark/42header.vim.git ~/.vim/bundle/42header.vim
#norminette
git clone https://github.com/42sp/norminette-client.git ~/.norminette/
cd ~/.norminette/
bundle # it will ask for your password.
echo 'alias norminette="~/.norminette/norminette.rb"' >> ~/.zshrc
source ~/.zshrc
#gruvbox - vimtheme
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox
#NERDTree
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
#vim-fugitive
mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/fugitive.git
vim -u NONE -c "helptags fugitive/doc" -c q
#vimrc
cp ./.vimrc ~/

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

