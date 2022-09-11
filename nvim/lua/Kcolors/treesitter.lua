local hl = require("utils.hl")
local colors = require("utils.colors.colors")
local gruvbox = require("utils.colors.gruvbox_material_palette")
local fg1 = gruvbox.fg1
-- local fg2 = gruvbox.fg2
-- local bg1 = gruvbox.bg1
-- local grey = gruvbox.grey

-- TreeSitter --
hl("BlueItalic", { fg = "#76946A", italic = true, underline = true })

hl("TSInclude", { fg = colors.gruvbox_dark4, italic = true })

-- hl("TSKeyword", { fg = fg1.red, italic = true })
hl("TSKeyword", { fg = fg1.purple, italic = true })
hl("TSConditional", { fg = fg1.red, italic = true })
hl("TSFunction", { fg = fg1.blue })
hl("TSConstructor", { fg = "#DCA561" })
hl("TSProperty", { fg = fg1.fg1 })

-- rust --
hl("rustTSKeyword", { fg = fg1.purple, italic = true })
-- hl("rustTSVariable", { fg = fg1.fg0   })
hl("rustTSFuncMacro", { fg = fg1.aqua, italic = true })
hl("rustTSKeywordFunction", { fg = fg1.purple })
hl("TSTypeBuiltin", { fg = fg1.orange })
hl("TSRepeat", { fg = fg1.purple })
-- hl("TSString", { fg = fg1.green })
hl("TSConstBuiltin", { fg = fg1.red })
hl("rustTSType", { fg = fg1.blue })
hl("TSVariableBuiltin", { fg = fg1.red })
-- hl("TSParameter", { fg = fg1.red })
--
-- hl("HintFloat",{fg='#EA6962'})
