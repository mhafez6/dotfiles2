#!/bin/bash
THEME_FILE="$HOME/.local/share/tinted-theming/tinty/tinted-sketchybar-themes-file.sh"
[ -f "$THEME_FILE" ] || exit 0
source "$THEME_FILE"

HEX="${SBAR_BG:4}"
R=$(( 16#${HEX:0:2} ))
G=$(( 16#${HEX:2:2} ))
B=$(( 16#${HEX:4:2} ))

WALLPAPER="$HOME/.local/share/tinted-theming/tinty/wallpaper.png"

python3 - "$R" "$G" "$B" "$WALLPAPER" <<'PYEOF'
import struct, zlib, sys
r, g, b, path = int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3]), sys.argv[4]
def chunk(tag, data):
    c = struct.pack('>I', len(data)) + tag + data
    return c + struct.pack('>I', zlib.crc32(c[4:]) & 0xffffffff)
w, h = 10, 10
sig = b'\x89PNG\r\n\x1a\n'
ihdr = chunk(b'IHDR', struct.pack('>IIBBBBB', w, h, 8, 2, 0, 0, 0))
rows = b''.join(b'\x00' + bytes([r, g, b] * w) for _ in range(h))
idat = chunk(b'IDAT', zlib.compress(rows))
iend = chunk(b'IEND', b'')
with open(path, 'wb') as f:
    f.write(sig + ihdr + idat + iend)
PYEOF

osascript -e "tell application \"System Events\" to set picture of every desktop to POSIX file \"$WALLPAPER\""
