-- local autocmd = vim.api.nvim_create_autocmd

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup


local packer_user_config = augroup("packer_user_config", { clear = true })

-- autocmd("BufWritePost", {
-- 	pattern = "*.lua",
-- 	command = "source %",
-- })
-- autocmd("BufWritePost", {
-- 	pattern = "*/nvim/*.lua",
-- 	command = 'source %| lua print("Save")',
-- 	group = packer_user_config,
-- })
-- autocmd("BufWritePost", {
-- 	pattern = "plugins.lua",
-- 	command = "PackerSync",
-- 	group = packer_user_config,
-- })
autocmd("BufWritePost", {
    pattern = "plugins.lua",
    -- command = "source <afile> | PackerCompile",
    command = "source <afile> | PackerSync",
    group = packer_user_config,
})
-- vim.cmd([[
-- augroup fmt
--   autocmd!
--   au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
-- augroup END
-- ]])

-- local fmt = augroup("fmt", { clear = true })
-- autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	-- command = "undojoin | Neoformat",
-- 	command = "undojoin | Neoformat",

-- 	-- command = "try | undojoin | Neoformat | catch /^Vim%((\a+))=:E790/ | finally | silent Neoformat | endtry",
-- 	-- command = "try | undojoin | Neoformat | catch /^Vim%((\a+))=:E790/ | finally | silent Neoformat | endtry",
-- 	group = fmt,
-- 	desc = "Neoformat",
-- })

-- local remember_folds = augroup("remember_folds", {})
local remember_folds = augroup("remember_folds", { clear = true })
autocmd("BufWinLeave", {
    pattern = "*.*",
    command = "mkview",
    group = remember_folds,
})
autocmd("BufWinEnter", {
    pattern = "*.*",
    command = "silent! loadview",
    group = remember_folds,
})
-- autocmd("BufLeave", {
-- 	pattern = "*.*",
-- 	command = "mkview",
-- 	group = remember_folds,
-- })
-- autocmd("BufWritePost", {
-- 	pattern = "*.*",
-- 	command = "silent! loadview",
-- 	group = remember_folds,
-- })
-- autocmd("BufEnter", {
-- 	pattern = "*.*",
-- 	command = "silent! loadview",
-- 	-- 	command = "loadview",
-- 	group = remember_folds,
-- })

-- local save_loadview_group = augroup("save_loadview_group", { clear = true })
-- autocmd("BufWritePost", {
-- 	pattern = "*.*",
-- 	command = "silent! loadview",
-- 	group = save_loadview_group,
-- })

local highlight_group = augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 1000 })
    end,
    group = highlight_group,
    pattern = "*",
})

-- hl("Folded", { fg = "#d79921" })
-- Highlight on yank
-- local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
-- local highlight_group = augroup("YankHighlight", { clear = true })

-- vim.api.nvim_create_autocmd("TextYankPost", {
-- 	callback = function()
-- 		vim.highlight.on_yank({ timeout = 1000 })
-- 	end,
-- 	group = highlight_group,
-- 	pattern = "*",
-- })

-- local autoCenter = augroup("autoCenter", { clear = true })
-- autocmd({ "InsertCharPre", "InsertEnter" }, {
--     group = autoCenter,
--     pattern = "*",
--     command = "if (winline() * 3 >= (winheight(0) * 2)) | norm! zz | endif",
-- })
--
local if_bottom_add_empty_line = augroup("if_bottom_add_empty_line", { clear = true })
autocmd({ "InsertEnter" }, {
    group = if_bottom_add_empty_line,
    pattern = "*.*",
    callback = function()
        require("original.auto_add_last_line").check_bottom()
    end,
})
