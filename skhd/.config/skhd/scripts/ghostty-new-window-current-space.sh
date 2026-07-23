#!/usr/bin/env sh

yabai_bin="/opt/homebrew/bin/yabai"
jq_bin="/usr/bin/jq"
osascript_bin="/usr/bin/osascript"

new_ghostty_window() {
  "$osascript_bin" -e 'tell application "Ghostty" to «event GhstNWin»'
}

if ! command -v "$yabai_bin" >/dev/null 2>&1 || ! command -v "$jq_bin" >/dev/null 2>&1; then
  exec "$osascript_bin" -e 'tell application "Ghostty" to «event GhstNWin»'
fi

target_space="$("$yabai_bin" -m query --spaces --space 2>/dev/null | "$jq_bin" -er '.index' 2>/dev/null || true)"
before_ids="$("$yabai_bin" -m query --windows 2>/dev/null | "$jq_bin" -c '[.[] | select(.app == "Ghostty" or .app == "ghostty") | .id]' 2>/dev/null || printf '[]')"

if [ -z "$target_space" ]; then
  exec "$osascript_bin" -e 'tell application "Ghostty" to «event GhstNWin»'
fi

new_ghostty_window >/dev/null 2>&1 || exit $?

new_id=""
tries=0
while [ "$tries" -lt 40 ]; do
  focused_id="$("$yabai_bin" -m query --windows --window 2>/dev/null | "$jq_bin" -er 'select(.app == "Ghostty" or .app == "ghostty") | .id' 2>/dev/null || true)"

  if [ -n "$focused_id" ] && printf '%s' "$before_ids" | "$jq_bin" -e --argjson id "$focused_id" 'index($id) == null' >/dev/null 2>&1; then
    new_id="$focused_id"
    break
  fi

  new_id="$("$yabai_bin" -m query --windows 2>/dev/null | "$jq_bin" -r --argjson before "$before_ids" '.[] | select(.app == "Ghostty" or .app == "ghostty") | select(.id as $id | ($before | index($id) | not)) | .id' 2>/dev/null | /usr/bin/head -n 1)"
  if [ -n "$new_id" ]; then
    break
  fi

  tries=$((tries + 1))
  /bin/sleep 0.05
done

if [ -n "$new_id" ]; then
  "$yabai_bin" -m window "$new_id" --space "$target_space" >/dev/null 2>&1 || true
  "$yabai_bin" -m space --focus "$target_space" >/dev/null 2>&1 || true
  "$yabai_bin" -m window "$new_id" --focus >/dev/null 2>&1 || true
fi
