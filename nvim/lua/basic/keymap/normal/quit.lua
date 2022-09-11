local Remap = require("utils.keymap")
local nnoremap = Remap.nnoremap

local opts = { silent = true }

nnoremap("qq", ":q<CR>", opts)
nnoremap("qw", ":bd<CR>", opts)
nnoremap("qa", ":qa<CR>", opts)

