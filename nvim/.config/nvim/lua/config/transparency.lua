-- Keep transient feedback visible; all persistent UI surfaces inherit Ghostty's
-- transparent terminal background instead of painting an opaque color.
local opaque_feedback = {
  Cursor = true,
  CursorIM = true,
  DiffAdd = true,
  DiffChange = true,
  DiffDelete = true,
  DiffText = true,
  IncSearch = true,
  MatchParen = true,
  PmenuSel = true,
  QuickFixLine = true,
  Search = true,
  Substitute = true,
  Visual = true,
  VisualNOS = true,
  lCursor = true,
}

local function clear_ui_backgrounds()
  for name, highlight in pairs(vim.api.nvim_get_hl(0, {})) do
    if not opaque_feedback[name] and (highlight.bg ~= nil or highlight.ctermbg ~= nil) then
      highlight.bg = nil
      highlight.ctermbg = nil
      vim.api.nvim_set_hl(0, name, highlight)
    end
  end
end

local group = vim.api.nvim_create_augroup("transparent_background", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  group = group,
  callback = clear_ui_backgrounds,
})

vim.api.nvim_create_autocmd("VimEnter", {
  group = group,
  callback = function()
    vim.schedule(clear_ui_backgrounds)
  end,
})

vim.api.nvim_create_autocmd("User", {
  group = group,
  pattern = { "LazyDone", "LazyLoad", "VeryLazy" },
  callback = function()
    vim.schedule(clear_ui_backgrounds)
  end,
})

clear_ui_backgrounds()
