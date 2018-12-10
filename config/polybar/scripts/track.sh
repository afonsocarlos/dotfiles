#!/bin/bash

format() {
    printf "%d:%02d" $(($1 / 60)) $(($1 % 60))
}

while true
do
    info=$(qdbus org.mpris.MediaPlayer2.MellowPlayer /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.GetAll org.mpris.MediaPlayer2.Player)

    title=$(echo "$info" | awk '/^xesam:title/ {print $2}')
    artist=$(echo "$info" | awk '/^xesam:artist/ {$1=""; print $0}')
    album=$(echo "$info" | awk '/^xesam:album/ {print $2}')

    length=$(echo "$info" | awk '/^mpris:length/ {print $2}')
    (( length = length / 1000000 ))

    cur=$(qdbus org.mpris.MediaPlayer2.MellowPlayer /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Position)
    (( cur = cur / 1000000 ))

    echo -en "\r$title by $artist - $album $(format $cur)/$(format $length)"
done
