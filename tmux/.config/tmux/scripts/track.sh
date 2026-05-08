#!/bin/bash

playback_status=$(playerctl status)
if [[ "$playback_status" == "Playing" ]]; then
    symbol="▶"
else
    symbol="⏸"
fi

playerctl metadata --format "$symbol {{ artist }} - {{ title }}"
