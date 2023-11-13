if command -v pmset; then
    echo `pmset -g batt | grep -o "[0-9]\{1,3\}%"`
else
    echo `upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage/ { print ($2=="0%" ? "100%" : $2) }'`
fi
