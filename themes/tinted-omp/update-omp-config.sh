#!/bin/bash
CONFIG="$HOME/.omp/agent/config.yml"
python3 - "$CONFIG" <<'EOF'
import re, sys
p = sys.argv[1]
with open(p) as f:
    c = f.read()
c = re.sub(r'(dark:)\s*\S+', r'\1 base16-active', c)
with open(p, 'w') as f:
    f.write(c)
EOF
