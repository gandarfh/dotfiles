#!/bin/bash
shopt -s nullglob

if [[ -z $(which feh) ]]
then
    echo "wallpaper err: Can not found command feh." > ~/i3wm-wallpaper.err
    exit 127
fi

#===change these config start===

#wallpapers directory
path=$HOME/dotfiles/wallpapers/

while true
do
  feh --randomize --bg-fill $path &

  sleep 40s 
done

