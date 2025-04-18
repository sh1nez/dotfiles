#!/bin/env sh

target_dir="$PWD"

if [ $# -gt 0 ]; then
    commit_msg="$1"
else
    commit_msg=$(date +"%Y-%m-%d %H:%M")
fi

dot_directories="
    ${HOME}/.config/alacritty/
    ${HOME}/.config/kitty/
    ${HOME}/.config/cava/
    ${HOME}/.config/mako/
    ${HOME}/.config/neofetch/
    ${HOME}/.config/bspwm/
    ${HOME}/.config/sxhkd/
    ${HOME}/.config/fontconfig/
    ${HOME}/.config/gtk-3.0/
    ${HOME}/.config/pavucontrol.ini
    ${HOME}/.xinitrc
    ${HOME}/.config/btop/
    ${HOME}/.config/nvim/
    ${HOME}/.config/fish/
    ${HOME}/.config/tmux/
"

for dir in $dot_directories; do
    if [ ! -d "${target_dir}${dir}" ]; then
        mkdir --parents "${target_dir}${dir}"
    fi
done

for dir in $dot_directories; do
    rsync -auv --delete "${dir}" "${target_dir}${dir}"
done

git -C "$target_dir" add -A && \
git -C "$target_dir" commit -m "$commit_msg" && \
git -C "$target_dir" push
