require("basic")

require("debugger")

require("Kcolors")
require("Kui")

require("Ksyntax")
require("small.config")

vim.api.nvim_create_user_command('OriginalTs', function()
    require('original.auto_execute.fn').auto_execute()
end, {})
vim.keymap.set('n', '<leader>tr', function()
    require('original.auto_execute.fn').auto_execute()
end
)
