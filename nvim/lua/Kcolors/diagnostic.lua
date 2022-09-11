local hl = require("utils.hl")
local colors = require("utils.colors.colors")
local gruvbox = require("utils.colors.gruvbox_material_palette")
local fg1 = gruvbox.fg1
local fg2 = gruvbox.fg2
local bg1 = gruvbox.bg1
local grey = gruvbox.grey

-- hl("WarningFloat", { fg = fg1.green })
hl("InfoFloat", { fg = fg2.purple })
hl("HintFloat", { fg = grey.grey1 })

hl("DiagnosticError", { fg = fg1.red })
hl("DiagnosticWarn", { fg = fg1.green })
hl("DiagnosticInfo", { fg = fg2.purple })
hl("DiagnosticHint", { fg = grey.grey1 })

hl("DiagnosticVirtualTextError", { fg = fg1.red })
hl("DiagnosticVirtualTextWarn", { fg = fg1.green })
hl("DiagnosticVirtualTextInfo", { fg = fg2.purple })
hl("DiagnosticVirtualTextHint", { fg = grey.grey1 })
