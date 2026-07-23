-- Tinty active scheme: Github Light Colorblind
-- Source: base16/github-light-colorblind.yaml

vim.o.background = "light"
vim.o.termguicolors = true

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "base16-github-light-colorblind"

local c = {
  base00 = "#ffffff",
  base01 = "#f6f8fa",
  base02 = "#afb8c1",
  base03 = "#8c959f",
  base04 = "#6e7781",
  base05 = "#424a53",
  base06 = "#32383f",
  base07 = "#24292f",
  base08 = "#8a4600",
  base09 = "#0550ae",
  base0A = "#bf8700",
  base0B = "#0a3069",
  base0C = "#0550ae",
  base0D = "#8250df",
  base0E = "#b35900",
  base0F = "#6f3800",
}

local terminal = {
  c.base00, c.base08, c.base0B, c.base0A,
  c.base0D, c.base0E, c.base0C, c.base05,
  c.base03, c.base08, c.base0B, c.base0A,
  c.base0D, c.base0E, c.base0C, c.base07,
}

for i, color in ipairs(terminal) do
  vim.g["terminal_color_" .. (i - 1)] = color
end

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local none = "NONE"

hi("Normal", { fg = c.base05, bg = c.base00 })
hi("NormalNC", { fg = c.base05, bg = c.base00 })
hi("NormalFloat", { fg = c.base05, bg = c.base01 })
hi("FloatBorder", { fg = c.base03, bg = c.base01 })
hi("FloatTitle", { fg = c.base0A, bg = c.base01, bold = true })
hi("ColorColumn", { bg = c.base01 })
hi("Conceal", { fg = c.base0D })
hi("Cursor", { fg = c.base00, bg = c.base05 })
hi("lCursor", { fg = c.base00, bg = c.base05 })
hi("CursorIM", { fg = c.base00, bg = c.base05 })
hi("CursorColumn", { bg = c.base01 })
hi("CursorLine", { bg = c.base01 })
hi("Directory", { fg = c.base0D })
hi("EndOfBuffer", { fg = c.base00 })
hi("ErrorMsg", { fg = c.base08, bg = c.base00 })
hi("VertSplit", { fg = c.base02, bg = c.base00 })
hi("WinSeparator", { fg = c.base02, bg = c.base00 })
hi("Folded", { fg = c.base03, bg = c.base01 })
hi("FoldColumn", { fg = c.base03, bg = c.base00 })
hi("SignColumn", { fg = c.base03, bg = c.base00 })
hi("IncSearch", { fg = c.base01, bg = c.base09 })
hi("Substitute", { fg = c.base01, bg = c.base0A })
hi("LineNr", { fg = c.base03, bg = c.base00 })
hi("CursorLineNr", { fg = c.base0A, bg = c.base01, bold = true })
hi("MatchParen", { fg = c.base0A, bg = c.base02, bold = true })
hi("ModeMsg", { fg = c.base0B })
hi("MoreMsg", { fg = c.base0B })
hi("NonText", { fg = c.base03 })
hi("Pmenu", { fg = c.base05, bg = c.base01 })
hi("PmenuSel", { fg = c.base00, bg = c.base0D })
hi("PmenuSbar", { bg = c.base02 })
hi("PmenuThumb", { bg = c.base04 })
hi("Question", { fg = c.base0D })
hi("QuickFixLine", { fg = c.base00, bg = c.base0A })
hi("Search", { fg = c.base01, bg = c.base0A })
hi("SpecialKey", { fg = c.base03 })
hi("SpellBad", { sp = c.base08, undercurl = true })
hi("SpellCap", { sp = c.base0D, undercurl = true })
hi("SpellLocal", { sp = c.base0C, undercurl = true })
hi("SpellRare", { sp = c.base0E, undercurl = true })
hi("StatusLine", { fg = c.base05, bg = c.base02 })
hi("StatusLineNC", { fg = c.base04, bg = c.base01 })
hi("TabLine", { fg = c.base04, bg = c.base01 })
hi("TabLineFill", { fg = c.base03, bg = c.base01 })
hi("TabLineSel", { fg = c.base0A, bg = c.base00, bold = true })
hi("Title", { fg = c.base0D, bold = true })
hi("Visual", { bg = c.base02 })
hi("VisualNOS", { bg = c.base02 })
hi("WarningMsg", { fg = c.base09 })
hi("Whitespace", { fg = c.base02 })
hi("WildMenu", { fg = c.base00, bg = c.base0D })

hi("Comment", { fg = c.base03, italic = true })
hi("Constant", { fg = c.base09 })
hi("String", { fg = c.base0B })
hi("Character", { fg = c.base0B })
hi("Number", { fg = c.base09 })
hi("Boolean", { fg = c.base09 })
hi("Float", { fg = c.base09 })
hi("Identifier", { fg = c.base08 })
hi("Function", { fg = c.base0D })
hi("Statement", { fg = c.base0E })
hi("Conditional", { fg = c.base0E })
hi("Repeat", { fg = c.base0E })
hi("Label", { fg = c.base0E })
hi("Operator", { fg = c.base05 })
hi("Keyword", { fg = c.base0E })
hi("Exception", { fg = c.base08 })
hi("PreProc", { fg = c.base0A })
hi("Include", { fg = c.base0D })
hi("Define", { fg = c.base0E })
hi("Macro", { fg = c.base08 })
hi("PreCondit", { fg = c.base0A })
hi("Type", { fg = c.base0A })
hi("StorageClass", { fg = c.base0A })
hi("Structure", { fg = c.base0E })
hi("Typedef", { fg = c.base0A })
hi("Special", { fg = c.base0C })
hi("SpecialChar", { fg = c.base0F })
hi("Tag", { fg = c.base0A })
hi("Delimiter", { fg = c.base04 })
hi("SpecialComment", { fg = c.base03, italic = true })
hi("Debug", { fg = c.base08 })
hi("Underlined", { fg = c.base0D, underline = true })
hi("Ignore", { fg = c.base03 })
hi("Error", { fg = c.base08, bg = none })
hi("Todo", { fg = c.base0A, bg = c.base01, bold = true })

hi("DiagnosticError", { fg = c.base08 })
hi("DiagnosticWarn", { fg = c.base09 })
hi("DiagnosticInfo", { fg = c.base0D })
hi("DiagnosticHint", { fg = c.base0C })
hi("DiagnosticOk", { fg = c.base0B })
hi("DiagnosticUnderlineError", { sp = c.base08, undercurl = true })
hi("DiagnosticUnderlineWarn", { sp = c.base09, undercurl = true })
hi("DiagnosticUnderlineInfo", { sp = c.base0D, undercurl = true })
hi("DiagnosticUnderlineHint", { sp = c.base0C, undercurl = true })
hi("DiagnosticVirtualTextError", { fg = c.base08, bg = c.base01 })
hi("DiagnosticVirtualTextWarn", { fg = c.base09, bg = c.base01 })
hi("DiagnosticVirtualTextInfo", { fg = c.base0D, bg = c.base01 })
hi("DiagnosticVirtualTextHint", { fg = c.base0C, bg = c.base01 })
hi("DiagnosticSignError", { fg = c.base08, bg = c.base00 })
hi("DiagnosticSignWarn", { fg = c.base09, bg = c.base00 })
hi("DiagnosticSignInfo", { fg = c.base0D, bg = c.base00 })
hi("DiagnosticSignHint", { fg = c.base0C, bg = c.base00 })

hi("DiffAdd", { fg = c.base0B, bg = c.base01 })
hi("DiffChange", { fg = c.base0A, bg = c.base01 })
hi("DiffDelete", { fg = c.base08, bg = c.base01 })
hi("DiffText", { fg = c.base0D, bg = c.base02 })
hi("Added", { fg = c.base0B })
hi("Changed", { fg = c.base0A })
hi("Removed", { fg = c.base08 })

hi("@annotation", { fg = c.base0A })
hi("@attribute", { fg = c.base0A })
hi("@boolean", { fg = c.base09 })
hi("@character", { fg = c.base0B })
hi("@character.special", { fg = c.base0F })
hi("@comment", { fg = c.base03, italic = true })
hi("@conditional", { fg = c.base0E })
hi("@constant", { fg = c.base09 })
hi("@constant.builtin", { fg = c.base09 })
hi("@constant.macro", { fg = c.base08 })
hi("@constructor", { fg = c.base0D })
hi("@diff.delta", { fg = c.base0A })
hi("@diff.minus", { fg = c.base08 })
hi("@diff.plus", { fg = c.base0B })
hi("@function", { fg = c.base0D })
hi("@function.builtin", { fg = c.base0D })
hi("@function.call", { fg = c.base0D })
hi("@function.macro", { fg = c.base08 })
hi("@include", { fg = c.base0D })
hi("@keyword", { fg = c.base0E })
hi("@keyword.conditional", { fg = c.base0E })
hi("@keyword.exception", { fg = c.base08 })
hi("@keyword.function", { fg = c.base0E })
hi("@keyword.import", { fg = c.base0D })
hi("@keyword.operator", { fg = c.base0E })
hi("@keyword.repeat", { fg = c.base0E })
hi("@label", { fg = c.base0E })
hi("@markup.heading", { fg = c.base0D, bold = true })
hi("@markup.italic", { italic = true })
hi("@markup.link", { fg = c.base0D, underline = true })
hi("@markup.list", { fg = c.base08 })
hi("@markup.raw", { fg = c.base0B })
hi("@markup.strong", { bold = true })
hi("@markup.underline", { underline = true })
hi("@number", { fg = c.base09 })
hi("@number.float", { fg = c.base09 })
hi("@operator", { fg = c.base05 })
hi("@parameter", { fg = c.base05 })
hi("@property", { fg = c.base08 })
hi("@punctuation.bracket", { fg = c.base04 })
hi("@punctuation.delimiter", { fg = c.base04 })
hi("@punctuation.special", { fg = c.base0F })
hi("@repeat", { fg = c.base0E })
hi("@string", { fg = c.base0B })
hi("@string.escape", { fg = c.base0C })
hi("@string.regex", { fg = c.base0C })
hi("@string.special", { fg = c.base0C })
hi("@tag", { fg = c.base08 })
hi("@tag.attribute", { fg = c.base0A })
hi("@tag.delimiter", { fg = c.base04 })
hi("@type", { fg = c.base0A })
hi("@type.builtin", { fg = c.base0A })
hi("@variable", { fg = c.base05 })
hi("@variable.builtin", { fg = c.base08 })
hi("@variable.member", { fg = c.base08 })
hi("@variable.parameter", { fg = c.base05 })

hi("LspReferenceText", { bg = c.base01 })
hi("LspReferenceRead", { bg = c.base01 })
hi("LspReferenceWrite", { bg = c.base01 })
hi("LspInlayHint", { fg = c.base03, bg = c.base01 })

hi("CmpItemAbbr", { fg = c.base05 })
hi("CmpItemAbbrDeprecated", { fg = c.base03, strikethrough = true })
hi("CmpItemAbbrMatch", { fg = c.base0D, bold = true })
hi("CmpItemAbbrMatchFuzzy", { fg = c.base0D, bold = true })
hi("CmpItemKind", { fg = c.base0E })
hi("CmpItemMenu", { fg = c.base03 })

hi("TelescopeNormal", { fg = c.base05, bg = c.base00 })
hi("TelescopeBorder", { fg = c.base02, bg = c.base00 })
hi("TelescopePromptNormal", { fg = c.base05, bg = c.base01 })
hi("TelescopePromptBorder", { fg = c.base02, bg = c.base01 })
hi("TelescopePromptTitle", { fg = c.base00, bg = c.base0D })
hi("TelescopePreviewTitle", { fg = c.base00, bg = c.base0B })
hi("TelescopeResultsTitle", { fg = c.base00, bg = c.base0A })
hi("TelescopeSelection", { bg = c.base01 })
hi("TelescopeMatching", { fg = c.base0A, bold = true })

hi("WhichKey", { fg = c.base0D })
hi("WhichKeyDesc", { fg = c.base0E })
hi("WhichKeyGroup", { fg = c.base0A })
hi("WhichKeySeparator", { fg = c.base03 })
hi("WhichKeyValue", { fg = c.base03 })

hi("LazyNormal", { fg = c.base05, bg = c.base00 })
hi("LazyButton", { fg = c.base05, bg = c.base01 })
hi("LazyButtonActive", { fg = c.base00, bg = c.base0D, bold = true })
hi("LazyH1", { fg = c.base00, bg = c.base0D, bold = true })
hi("LazyH2", { fg = c.base0D, bold = true })
hi("LazyProgressDone", { fg = c.base0B })
hi("LazyProgressTodo", { fg = c.base03 })

hi("SnacksDashboardHeader", { fg = c.base0D })
hi("SnacksDashboardDesc", { fg = c.base05 })
hi("SnacksDashboardIcon", { fg = c.base0A })
hi("SnacksDashboardKey", { fg = c.base0C })
hi("SnacksDashboardFooter", { fg = c.base03 })
hi("SnacksPicker", { fg = c.base05, bg = c.base00 })
hi("SnacksPickerBorder", { fg = c.base02, bg = c.base00 })
hi("SnacksPickerMatch", { fg = c.base0A, bold = true })
hi("SnacksPickerSelected", { fg = c.base0C })

hi("MiniIconsAzure", { fg = c.base0D })
hi("MiniIconsBlue", { fg = c.base0D })
hi("MiniIconsCyan", { fg = c.base0C })
hi("MiniIconsGreen", { fg = c.base0B })
hi("MiniIconsGrey", { fg = c.base04 })
hi("MiniIconsOrange", { fg = c.base09 })
hi("MiniIconsPurple", { fg = c.base0E })
hi("MiniIconsRed", { fg = c.base08 })
hi("MiniIconsYellow", { fg = c.base0A })

hi("GitSignsAdd", { fg = c.base0B, bg = c.base00 })
hi("GitSignsChange", { fg = c.base0A, bg = c.base00 })
hi("GitSignsDelete", { fg = c.base08, bg = c.base00 })

hi("LualineNormal", { fg = c.base00, bg = c.base0D, bold = true })
hi("LualineInsert", { fg = c.base00, bg = c.base0B, bold = true })
hi("LualineVisual", { fg = c.base00, bg = c.base0E, bold = true })
hi("LualineReplace", { fg = c.base00, bg = c.base08, bold = true })
hi("LualineCommand", { fg = c.base00, bg = c.base0A, bold = true })
hi("LualineInactive", { fg = c.base04, bg = c.base01 })

hi("NormalSB", { fg = c.base05, bg = c.base01 })
hi("FoldColumnSB", { fg = c.base03, bg = c.base01 })
hi("SignColumnSB", { fg = c.base03, bg = c.base01 })
