#!/bin/bash
source "$HOME/.local/share/tinted-theming/tinty/tinted-sketchybar-themes-file.sh" 2>/dev/null

PCT=$(pmset -g batt | grep -o '[0-9]*%' | head -1 | tr -d '%')
CHARGING=$(pmset -g batt | grep -c 'AC Power')

if [ "$CHARGING" -gt 0 ]; then
    ICON="󰂄"; COLOR=$SBAR_GREEN
elif [ "${PCT:-100}" -ge 80 ]; then
    ICON="󰁹"; COLOR=$SBAR_GREEN
elif [ "${PCT:-100}" -ge 50 ]; then
    ICON="󰁾"; COLOR=$SBAR_GREEN
elif [ "${PCT:-100}" -ge 30 ]; then
    ICON="󰁼"; COLOR=$SBAR_YELLOW
else
    ICON="󰁺"; COLOR=$SBAR_RED
fi

sketchybar --set battery icon="$ICON" icon.color=$COLOR label="${PCT}%" label.color=$COLOR
