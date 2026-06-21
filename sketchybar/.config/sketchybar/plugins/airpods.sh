#!/bin/bash
source "$HOME/.local/share/tinted-theming/tinty/tinted-sketchybar-themes-file.sh" 2>/dev/null

BT=$(system_profiler SPBluetoothDataType 2>/dev/null)
BATTERY=$(echo "$BT" | python3 -c "
import sys, re
data = sys.stdin.read()
sections = re.split(r'\n(?=    \S)', data)
for s in sections:
    if re.search(r'airpods', s, re.IGNORECASE) and 'Connected: Yes' in s:
        m = re.search(r'Battery Level: (\d+%)', s)
        print(m.group(1) if m else '')
        break
" 2>/dev/null)

if [ -n "$BATTERY" ]; then
    sketchybar --set airpods drawing=on icon="󰋋" icon.color=$SBAR_FG label=" $BATTERY" label.color=$SBAR_FG
else
    sketchybar --set airpods drawing=off
fi
