echo `upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage/ { print ($2=="0%" ? "100%" : $2) }'`
