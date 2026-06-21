#!/bin/bash
system_profiler SPBluetoothDataType 2>/dev/null | python3 -c "
import sys, re
data = sys.stdin.read()
sections = re.split(r'\n(?=    \S)', data)
for s in sections:
    if re.search(r'airpods', s, re.IGNORECASE) and 'Connected: Yes' in s:
        m = re.search(r'Battery Level: (\d+%)', s)
        print(m.group(1) if m else '')
        break
"
