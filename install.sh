#1/usr/bin/env bash

if [ ! "$INSTALL" ]; then
	INSTALL="pacman -Syu"
fi

yes | $INSTALL tmux | true
yes | $INSTALL neovim | true 
yes | $INSTALL ranger | true 
yes | $INSTALL btop | true 
yes | $INSTALL ripgrep | true 
yes | $INSTALL neofetch | true 

ln -s /usr/bin/nvim /usr/bin/v
chsh -s /usr/bin/fish

cd "$HOME"/.config || return
wget https://github.com/sh1nez/dotfiles/tree/main/home/sad1/.config/nvim
wget https://github.com/sh1nez/dotfiles/tree/main/home/sad1/.config/btop
wget https://github.com/sh1nez/dotfiles/tree/main/home/sad1/.config/tmux
wget https://github.com/sh1nez/dotfiles/tree/main/home/sad1/.config/fish

neofetch
