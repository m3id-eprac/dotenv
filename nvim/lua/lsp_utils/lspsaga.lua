local saga = require("lspsaga")

local config = {
    border_style = "single",
    code_action_lightbulb = {
        enable = false,
    },
    rename_in_select = false,
}
saga.init_lsp_saga(config)
