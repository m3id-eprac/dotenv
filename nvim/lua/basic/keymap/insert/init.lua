local Remap = require("utils.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap

local nmap = Remap.nmap

-- insert new line
inoremap("<C-o>", "<Esc>o")

inoremap("'", "'")
inoremap('"', '"')
inoremap("}", "}")

inoremap("jk", "<Esc>")

inoremap("<C-k>", "<Up>")
inoremap("<C-j>", "<Down>")
inoremap("<C-l>", "<Right>")
inoremap("<C-h>", "<Left>")
