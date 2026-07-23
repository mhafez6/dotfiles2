#!/bin/bash
# Merge the tinty-generated color customizations into VS Code fork settings.
# Both Cursor and Devin watch settings.json, so changes apply live.
THEME_FILE="${TINTY_THEME_FILE_PATH:-$HOME/.local/share/tinted-theming/tinty/tinted-vscode-themes-file.json}"
[ -f "$THEME_FILE" ] || exit 0

for APP in "Cursor" "Devin"; do
  SETTINGS="$HOME/Library/Application Support/$APP/User/settings.json"
  [ -f "$SETTINGS" ] || continue
  python3 - "$THEME_FILE" "$SETTINGS" <<'EOF'
import json, sys
theme_path, settings_path = sys.argv[1], sys.argv[2]
with open(theme_path) as f:
    theme = json.load(f)
with open(settings_path) as f:
    settings = json.load(f)
settings.update(theme)
with open(settings_path, "w") as f:
    json.dump(settings, f, indent=2)
    f.write("\n")
EOF
done
