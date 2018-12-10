#!/bin/bash

info=$(qdbus org.mpris.MediaPlayer2.MellowPlayer /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.GetAll org.mpris.MediaPlayer2.Player)

artist=$(echo "$info" | awk '/^xesam:artist/ {$1=""; print $0}')
title=$(echo "$info" | awk '/^xesam:title/ {$1=""; print $0}')
playback_status=$(echo "$info" | awk '/^PlaybackStatus/ {print $2}')
if [[ "$playback_status" == "Playing" ]]; then
    symbol="▶"
else
    symbol="⏸"
fi

echo -en "\r$artist - $title $symbol"
