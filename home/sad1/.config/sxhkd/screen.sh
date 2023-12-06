#/bin/env bash
touch ~/shot.png

scrot -s "~/shot.png"

xclip -selection clipboard -t image/png -i "~/shot.png"

# Удаляем временный файл
rm "~/shot.png"
