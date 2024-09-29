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
usermod -aG wheel 2happy

echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers

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

xray-vpn() {
	bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install
	echo and x-ui now!
	bash <(curl -Ls https://raw.githubusercontent.com/lankylonky22/x-ui-arch/main/install.sh)
}

while true; do
  read -r -p "install vpn??" answer
  case $answer in
    [Yy]* ) 
	  xray-vpn
      break
      ;;
    [Nn]* )
      exit
      ;;
    * ) 
      echo "Only y/n"
      ;;
  esac
done


