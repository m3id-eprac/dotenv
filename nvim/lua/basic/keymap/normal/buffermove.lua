local Remap = require("utils.keymap")
local nnoremap = Remap.nnoremap

local opts = { silent = true }

nnoremap("m,", ":bprevious<CR>", opts)
nnoremap("m.", ":bnext<CR>", opts)
