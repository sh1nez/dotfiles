#1/usr/bin/env bash

pacman -Syu

if [ ! "$INSTALL" ]; then
	INSTALL="pacman -S"
fi

yes | $INSTALL tmux | true
yes | $INSTALL neovim | true 
yes | $INSTALL ranger | true 
yes | $INSTALL btop | true 
yes | $INSTALL ripgrep | true 
yes | $INSTALL neofetch | true 

ln -s /usr/bin/nvim /usr/bin/v
chsh -s /usr/bin/fish

mkdir "$HOME"/.config 
cd "$HOME"/.config || return
curl -o nvim https://raw.githubusercontent.com/sh1nez/dotfiles/main/home/sad1/.config/nvim/
curl -o btop https://raw.githubusercontent.com/sh1nez/dotfiles/main/home/sad1/.config/btop
crul -o tmux https://raw.githubusercontent.com/sh1nez/dotfiles/main/home/sad1/.config/tmux
curl -o fish https://raw.githubusercontent.com/sh1nez/dotfiles/main/home/sad1/.config/fish

neofetch
