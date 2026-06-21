# ── Starship prompt ───────────────────────────────────────
eval "$(starship init zsh)"

# ── Tinty — reapply current theme on shell start ──────────
if command -v tinty &>/dev/null; then
  tinty init &>/dev/null
fi
