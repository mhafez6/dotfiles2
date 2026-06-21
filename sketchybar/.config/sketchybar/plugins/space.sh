#!/bin/bash
source "$HOME/.local/share/tinted-theming/tinty/tinted-sketchybar-themes-file.sh" 2>/dev/null

if [ "$SELECTED" = true ]; then
  sketchybar --animate tanh 10 --set "$NAME" \
    icon.color=$SBAR_YELLOW \
    background.border_color=$SBAR_YELLOW
else
  sketchybar --animate tanh 10 --set "$NAME" \
    icon.color=$SBAR_DIM \
    background.border_color=$SBAR_DIM
fi
