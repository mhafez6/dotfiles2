# ── Starship prompt ───────────────────────────────────────
eval "$(starship init zsh)"

# ── Zsh autosuggestions ───────────────────────────────────
if [[ -r /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# ── Atuin shell history ───────────────────────────────────
if command -v atuin &>/dev/null; then
  eval "$(atuin init zsh)"
fi

# ── Tinty — reapply current theme on shell start ──────────
if command -v tinty &>/dev/null; then
  tinty init &>/dev/null
fi

# Added by Devin
export PATH="/Users/h/.codeium/windsurf/bin:$PATH"

# Bazaar key for OMP; the secret file is ignored in the alkonos repo.
if [[ -r /Users/h/dev/alkonos/.envrc.secret ]]; then
  source /Users/h/dev/alkonos/.envrc.secret
fi

# Claude Code with GPT-5.6 Sol through CLIProxyAPI.
alias claudex='GITHUB_PERSONAL_ACCESS_TOKEN="$(gh auth token)" CLAUDE_CODE_SUBAGENT_MODEL=gpt-5.6-sol CLAUDE_CODE_ALWAYS_ENABLE_EFFORT=1 CLAUDE_CODE_MAX_TOOL_USE_CONCURRENCY=3 ENABLE_TOOL_SEARCH=false claude --dangerously-skip-permissions --model gpt-5.6-sol'
