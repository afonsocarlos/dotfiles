#!/bin/bash

api_key="547bbdc38bd641bef6645cd2c4bc613f"

# reference: https://openweathermap.org/weather-conditions
weather_icon() {
    case $1 in
        "800" ) echo "☼"
            ;;
        "801" ) echo "🌤"
            ;;
        "802" ) echo "☁"
            ;;
        "803" | "804" ) echo "☁"
            ;;
        3* | "52*" ) echo "🌧"
            ;;
        50* ) echo "🌦"
            ;;
        2* ) echo "🌩"
            ;;
        "511" | "6*" ) echo "🌨"
            ;;
        7* ) echo "🌫"
            ;;
        *) echo "$1"
    esac
}

location=$(curl --silent http://ip-api.com/csv)
city=$(echo "$location" | cut -d, -f6 | tr -d \")
lat=$(echo "$location" | cut -d, -f8)
lon=$(echo "$location" | cut -d, -f9)

weather=$(curl --silent http://api.openweathermap.org/data/2.5/weather\?lat="$lat"\&lon="$lon"\&APPID="$api_key"\&units=metric)
icon=$(echo "$weather" | jq -r .weather[0].id)
temperature="$(echo "$weather" | jq -r .main.temp | cut -d. -f1)°C"

echo "$(weather_icon "$icon") $temperature"
