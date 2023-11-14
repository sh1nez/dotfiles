#!/bin/env sh
target_dir="${HOME}/git/dotfiles"
dot_directories="
    /etc/portage/
	/etc/systemd/

    ${HOME}/.config/alacritty/
	${HOME}/.config/cava/
	${HOME}/.config/fontconfig/
	${HOME}/.config/foot/
	${HOME}/.config/htop/	
	${HOME}/.config/kitty/
	${HOME}/.config/mako/
	${HOME}/.config/neofetch/
	${HOME}/.config/pavucontrol.ini
	${HOME}/.config/sway/
	${HOME}/.config/systemd/
	${HOME}/.config/Thunar/
    ${HOME}/.config/gtk-3.0/
    ${HOME}/.config/nvim/
    
    ${HOME}/.icons/
        
"
for dir in $dot_directories; do
        if [ ! -d ${target_dir}${dir} ]; then
                mkdir --parents ${target_dir}${dir}
        fi
done


for dir in $dot_directories; do
        rsync -auv --delete ${dir} ${target_dir}${dir}
done
equery list "*" > ${target_dir}/all_pkg

date=$(date +"%Y-%m-%d %H:%M")
git -C "$target_dir" add -A && git -C "$target_dir" commit -m "$date" && git -C "$target_dir" push
