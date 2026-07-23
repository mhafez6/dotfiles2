#!/usr/bin/env sh

app="Obsidian"
lock_dir="${TMPDIR:-/tmp}/skhd-open-obsidian-floating.lock"

if ! mkdir "$lock_dir" 2>/dev/null; then
  exit 0
fi
trap 'rmdir "$lock_dir"' EXIT HUP INT TERM

open -a "$app"

for _ in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15; do
  osascript <<'APPLESCRIPT' >/dev/null 2>&1
tell application "System Events"
  if exists process "Obsidian" then
    tell process "Obsidian"
      if exists window 1 then
        return
      end if
    end tell
  end if
end tell
error number -128
APPLESCRIPT
  [ "$?" -eq 0 ] && break
  sleep 0.2
done

osascript <<'APPLESCRIPT' >/dev/null 2>&1
tell application "System Events"
  if exists process "Obsidian" then
    tell process "Obsidian"
      set frontmost to true
      if exists window 1 then
        set position of window 1 to {120, 80}
        set size of window 1 to {1120, 800}
      end if
    end tell
  end if
end tell
APPLESCRIPT
