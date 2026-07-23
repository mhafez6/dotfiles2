#!/usr/bin/env sh

app="Zen"

window_id="$(
  yabai -m query --windows 2>/dev/null |
    /usr/bin/jq -r --arg app "$app" '
      [.[] | select(.app == $app and ."is-minimized" == false)]
      | sort_by(if ."is-visible" then 0 else 1 end)
      | .[0].id // empty
    ' 2>/dev/null
)"

if [ -n "$window_id" ]; then
  yabai -m window --focus "$window_id" && exit 0
fi

open -a "$app"
