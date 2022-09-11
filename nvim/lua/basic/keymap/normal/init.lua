local Remap = require("utils.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local nmap = Remap.nmap

local opts = { silent = true }

nnoremap("ff", ":w<CR>")
nnoremap("zc", "zc | :mkview<CR>")

require("basic.keymap.normal.quit")
require("basic.keymap.normal.buffermove")
require("basic.keymap.normal.select")

nnoremap("k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
nnoremap("j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- nnoremap("'", ":")

nnoremap("J", ":m .+1<CR>==")
nnoremap("K", ":m .-2<CR>==")
vnoremap("K", ":m '<-2<CR>gv=gv")
vnoremap("J", ":m '>+1<CR>gv=gv")

nnoremap(",", "<C-w>")
nnoremap(",,", "<C-w><C-w>")

nnoremap("(", "g^")
nnoremap(")", "g$")

-- nnoremap("'", ":")

nnoremap("<leader>o", "o<Esc>")
nnoremap("<leader>O", "O<Esc>")
-- local ToggleMouse = function()
-- 	print(vim.api.nvim_get_option("mouse"))
-- 	local curret_mouse_state = vim.api.nvim_get_option("mouse")
-- 	if curret_mouse_state == "a" then
-- 		vim.opt.mouse = ""
-- 		print("Mouse Off")
-- 	else
-- 		vim.opt.mouse = "a"
-- 		print("Mouse On")
-- 	end
-- end
vim.keymap.set("n", "<leader>mm", function()
    -- print(vim.api.nvim_get_option("mouse"))
    local curret_mouse_state = vim.api.nvim_get_option("mouse")
    if curret_mouse_state == "a" then
        vim.opt.mouse = ""
        print("Mouse Off")
    else
        vim.opt.mouse = "a"
        print("Mouse On")
    end
end)

nnoremap("Y", "yg$")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

nnoremap("<C-k>", "<C-u>zzzv")
nnoremap("<C-j>", "<C-d>zzzv")
