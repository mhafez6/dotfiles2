#!/bin/bash
PCT=$(pmset -g batt | grep -o '[0-9]*%' | head -1 | tr -d '%')
CHARGING=$(pmset -g batt | grep -c 'AC Power')

if [ "$CHARGING" -gt 0 ]; then
    ICON="󰂄"
    COLOR=0xffb8bb26
elif [ "${PCT:-100}" -ge 80 ]; then
    ICON="󰁹"
    COLOR=0xffb8bb26
elif [ "${PCT:-100}" -ge 50 ]; then
    ICON="󰁾"
    COLOR=0xffb8bb26
elif [ "${PCT:-100}" -ge 30 ]; then
    ICON="󰁼"
    COLOR=0xfffabd2f
else
    ICON="󰁺"
    COLOR=0xfffb4934
fi

sketchybar --set battery \
    icon="$ICON" \
    icon.color=$COLOR \
    label="${PCT}%" \
    label.color=$COLOR
