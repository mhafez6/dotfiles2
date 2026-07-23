#!/usr/bin/env sh

target="${1:-4}"
tries=0

if ! command -v yabai >/dev/null 2>&1; then
  exit 0
fi

while [ "$tries" -lt 20 ]; do
  count="$(yabai -m query --spaces --display 2>/dev/null | /usr/bin/grep -o '"index"' 2>/dev/null | /usr/bin/wc -l | /usr/bin/tr -d ' ')"

  if [ "${count:-0}" -ge "$target" ]; then
    exit 0
  fi

  yabai -m space --create >/dev/null 2>&1 || exit 0
  tries=$((tries + 1))
  sleep 0.15
done
