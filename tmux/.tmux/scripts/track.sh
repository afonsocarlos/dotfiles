#!/bin/bash

info=$(qdbus org.mpris.MediaPlayer2.MellowPlayer /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.GetAll org.mpris.MediaPlayer2.Player)

artist=$(echo "$info" | grep '^xesam:artist' | cut -d' ' -f2-)
title=$(echo "$info" | grep '^xesam:title' | cut -d' ' -f2-)
playback_status=$(echo "$info" | awk '/^PlaybackStatus/ {print $2}')
if [[ "$playback_status" == "Playing" ]]; then
    symbol="▶"
else
    symbol="⏸"
fi

echo "$artist - $title $symbol"
