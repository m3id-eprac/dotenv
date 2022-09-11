local hl = require("utils.hl")

local gruvbox = require("utils.colors.gruvbox_material_palette")
local fg1 = gruvbox.fg1
local fg2 = gruvbox.fg2
local bg1 = gruvbox.bg1
local grey = gruvbox.grey

hl("TelescopeSelection", { fg = fg1.fg1, bg = bg1.bg_visual_blue })
hl("TelescopeMatching", { fg = fg1.bright_yellow })
-- hl("TelescopeMatching", { fg = fg1.bright_orange ,bg=bg1.bg0})
-- hl("TelescopeMatching", {   bg=bg1.bg_diff_blue})
hl("TelescopeNormal", { fg = fg2.green })
