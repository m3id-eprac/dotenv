local Remap = require("utils.keymap")
local nnoremap = Remap.nnoremap

local nmap = Remap.nmap

local opts = { silent = true }
nnoremap("<Up>", "<Nop>")
nnoremap("<Down>", "<Nop>")
nnoremap("<Left>", "<Nop>")
nnoremap("<Right>", "<Nop>")
nnoremap("<Space>", "<Nop>")

nmap("q", "<Nop>", opts)

nmap("<C-w>", "<Nop>")

