local hl = require("utils.hl")

local gruvbox = require("utils.colors.gruvbox_material_palette")
local fg1 = gruvbox.fg1
-- local fg2 = gruvbox.fg2
local bg1 = gruvbox.bg1
-- local grey = gruvbox.grey

hl("LightspeedLabel", { fg = fg1.bright_yellow, bold = true, underline = true })
hl("LightspeedShortCut", { fg = bg1.bg0, bg = fg1.bright_yellow, bold = true })
-- hl("LightspeedUniqueChar",{fg=gruvbox_fg.fg0,bg=gruvbox_fg.bright_yellow,bold=true})
-- hl("LightspeedMaskedChar",{fg=gruvbox_fg.bright_yellow})
hl("LightspeedUnlabeledMatch", { fg = fg1.fg0 })
-- hl("LightspeedUniqueChar",{fg=gruvbox_fg.fg0})
-- hl("LightspeedShortCut",{fg=gruvbox_bg.bg0,bg=gruvbox_fg.bright_yellow})
-- hl("UfoFoldedBg", { bg = fg1.red })
