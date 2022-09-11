local Remap = require("utils.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local nmap = Remap.nmap

vnoremap(",", "<C-c>")
vnoremap("oo", "O")

-- nnoremap("J", ":m .+1<CR>==")
-- nnoremap("K", ":m .-2<CR>==")
-- vnoremap("K", ":m '<-2<CR>gv=gv")
-- vnoremap("J", ":m '>+1<CR>gv=gv")

-- visaul remap
nmap("v", "<Nop>")
nmap("<C-v>", "<Nop>")
nmap("<S-v>", "<Nop>")

nnoremap("vv", "v")
nnoremap("vl", "<S-v>")
nnoremap("vb", "<C-v>")

nnoremap("viw", "viw")
nnoremap("vaw", "vaw")

nnoremap("vih", "vi<")
nnoremap("vij", "vi(")
nnoremap("vik", "vi{")
nnoremap("vil", "vi[")
nnoremap("vi;", "vi'")
nnoremap("vi'", 'vi"')

nnoremap("vah", "va<")
nnoremap("vaj", "va(")
nnoremap("vak", "va{")
nnoremap("val", "va[")
nnoremap("va;", "va'")
nnoremap("va'", 'va"')

nnoremap("dih", "di<")
nnoremap("dij", "di(")
nnoremap("dik", "di{")
nnoremap("dil", "di[")
nnoremap("di;", "di'")
nnoremap("di'", 'di"')

nnoremap("dah", "da<")
nnoremap("daj", "da(")
nnoremap("dak", "da{")
nnoremap("dal", "da[")
nnoremap("da;", "da'")
nnoremap("da'", 'da"')

nnoremap("cih", "ci<")
nnoremap("cij", "ci(")
nnoremap("cik", "ci{")
nnoremap("cil", "ci[")
nnoremap("ci;", "ci'")
nnoremap("ci'", 'ci"')

nnoremap("cah", "ca<")
nnoremap("caj", "ca(")
nnoremap("cak", "ca{")
nnoremap("cal", "ca[")
nnoremap("ca;", "ca'")
nnoremap("ca'", 'ca"')

