#!/bin/bash
PCT=$(pmset -g batt | grep -o '[0-9]*%' | head -1 | tr -d '%')
CHARGING=$(pmset -g batt | grep -c 'AC Power')

if [ "$CHARGING" -gt 0 ]; then
    sketchybar --set battery label="⚡ ${PCT}%" label.color=0xffb8bb26
elif [ "${PCT:-100}" -lt 20 ]; then
    sketchybar --set battery label="${PCT}%" label.color=0xfffb4934
elif [ "${PCT:-100}" -lt 50 ]; then
    sketchybar --set battery label="${PCT}%" label.color=0xfffabd2f
else
    sketchybar --set battery label="${PCT}%" label.color=0xffb8bb26
fi
