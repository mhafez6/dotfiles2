#!/bin/bash
source "$HOME/.local/share/tinted-theming/tinty/tinted-sketchybar-themes-file.sh" 2>/dev/null

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"
else
  VOLUME=$(osascript -e 'output volume of (get volume settings)')
fi
MUTED=$(osascript -e 'output muted of (get volume settings)')

[ -z "$VOLUME" ] && exit 0

if [ "$MUTED" = "true" ]; then
  ICON="󰖁"; COLOR=$SBAR_DIM
elif [ "$VOLUME" -ge 66 ]; then
  ICON="󰕾"; COLOR=$SBAR_GREEN
elif [ "$VOLUME" -ge 33 ]; then
  ICON="󰖀"; COLOR=$SBAR_CYAN
else
  ICON="󰕿"; COLOR=$SBAR_FG
fi

sketchybar --animate tanh 10 \
  --set "$NAME" icon="$ICON" icon.color=$COLOR label="${VOLUME}%" label.color=$COLOR
