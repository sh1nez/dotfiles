#1/usr/bin/env bash

pacman -Syu

MAIN_USER=2happy
USER_MAIL=biv888iii888@yandex.ru
if [ -z "$INSTALL" ]; then
	INSTALL="pacman -S"
fi

yes | $INSTALL tmux
yes | $INSTALL neovim
yes | $INSTALL ranger
yes | $INSTALL btop
yes | $INSTALL ripgrep
yes | $INSTALL neofetch
yes | $INSTALL fish

ln -s /usr/bin/nvim /usr/bin/v
ln -s /usr/bin/nvim /usr/bin/vi

useradd -m -G wheel $MAIN_USER

yes | $INSTALL --needed base-devel
su -c "cd /home/$MAIN_USER/ && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si" $MAIN_USER

chsh -s /usr/bin/fish
su -c "chsh -s /usr/bin/fish" $MAIN_USER

copy_to_dir() {
	mkdir "$1"/.config/ | true
	cp -r home/sad1/.config/fish/ "$1"/.config/
	cp -r home/sad1/.config/btop/ "$1"/.config/
	cp -r home/sad1/.config/tmux/ "$1"/.config/
}

copy_to_dir "/root"
copy_to_dir "/home/$MAIN_USER"

echo
echo "gen ssh key..."
echo 

ssh-keygen -t ed25519 -C $USER_MAIL
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

neofetch
