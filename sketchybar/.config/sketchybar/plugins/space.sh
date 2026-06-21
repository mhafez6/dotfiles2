#!/bin/bash
source "$HOME/.local/share/tinted-theming/tinty/tinted-sketchybar-themes-file.sh" 2>/dev/null

if [ "$SELECTED" = true ]; then
  sketchybar --animate tanh 10 --set "$NAME" \
    icon.color=$SBAR_GREEN \
    background.border_color=$SBAR_GREEN
else
  sketchybar --animate tanh 10 --set "$NAME" \
    icon.color=$SBAR_FG \
    background.border_color=$SBAR_BG_ALT
fi
