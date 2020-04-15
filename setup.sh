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

# Dock
defaults write com.apple.Dock autohide -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Homebrew packages
brew analytics off
brew install wget
brew install mysql
brew install python

# Python
easy_install pip
pip install --upgrade distribute

# Install npm
curl http://npmjs.org/install.sh | clean=no sh

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
mv .vimrc ~/

#iTerm
#gruvbox-dark
