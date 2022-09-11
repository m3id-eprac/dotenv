local hl = require("utils.hl")
local colors = require("utils.colors.colors")
local gruvbox = require("utils.colors.gruvbox_material_palette")
local fg1 = gruvbox.fg1
local fg2 = gruvbox.fg2
local bg1 = gruvbox.bg1
local grey = gruvbox.grey

-- vim.cmd([[
--     hi FocusedSymbol guifg=#fabd2f guibg=#3c3836 gui=bold
-- ]])

-- hl("FocusedSymbol", { link = 'ErrorMsg' })
-- remove ~ blank lines
hl("EndOfBuffer", { fg = "bg" })

-- matchup
-- hl("MatchParen", { reverse = true })
hl("MatchParen", { fg = '#ffffff', reverse = false })

hl("MyUfoFoldSign", { fg = fg1.aqua, bg = bg1.bg_diff_green, reverse = true })
hl("CursorLine", { bg = bg1.bg_statusline2 })
-- hl("MyFocuse", { fg = fg1.aqua, bg = bg1.bg_diff_green, reverse = true })

-- Custom Highlight --
hl("Search", { fg = bg1.bg0, bg = fg1.bright_yellow })
-- hl('IncSearch',{fg=bg1.bg0,bg=fg1.bright_red})
hl("IncSearch", { reverse = true })
-- hl("ErrorMsg", { fg = fg1.red, bold = false, underline = false })
hl("ErrorMsg", { fg = fg1.red, bold = false })
hl("PmenuSel", { fg = fg1.orange, bg = bg1.bg0 })

hl("TabLineSel", { fg = fg1.yellow })
hl("rainbowcol1", { fg = fg1.yellow })

-- telescope
--
-- vim.api.nvim_set_hl(0, "lspReferenceRead", { bg = "#B8BB26" })
-- vim.api.nvim_set_hl(0, "lspReferenceText", { bg = "#B8BB26" })
-- vim.api.nvim_set_hl(0, "lspReferenceWrite", { bg = "#B8BB26" })
-- vim.api.nvim_set_hl(0, "lspReference", { bg = "#B8BB26" })

hl("CmpItemAbbrMatch", { fg = fg1.bright_yellow })
