local Remap = require("utils.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap

local nmap = Remap.nmap
require("basic.keymap.nop")
require("basic.keymap.normal")
-- require("basic.keymap.visual")
require("basic.keymap.insert")
require("basic.keymap.visual")
-- vnoremap("oi", "I")
-- vnoremap("oo", "o")
-- nnoremap("za", "za | :mkview<CR>")

-- nnoremap("<Up>", "<Nop>")
-- nnoremap("<Down>", "<Nop>")
-- nnoremap("<Left>", "<Nop>")
-- nnoremap("<Right>", "<Nop>")
-- nnoremap("<Space>", "<Nop>")

-- inoremap("'", "'")
-- inoremap("jk", "<Esc>")

-- inoremap("<C-k>", "<Up>")
-- inoremap("<C-j>", "<Down>")
-- inoremap("<C-l>", "<Right>")
-- inoremap("<C-h>", "<Left>")

-- nnoremap("Y", "yg$")
-- nnoremap("n", "nzzzv")
-- nnoremap("N", "Nzzzv")

-- nnoremap("J", "mzJ`z")

-- nnoremap("<C-k>", "<C-u>zzzv")
-- nnoremap("<C-j>", "<C-d>zzzv")

-- nnoremap("<C-W>=", ":resize +5<CR>")
-- nnoremap("<C-W>-", ":resize -5<CR>")
-- nnoremap('<C-W>>' ,' :vertical resize +5<CR>')
-- nnoremap( '<C-W><',' :vertical resize -5<CR>')

-- nnoremap("+","<C-W>=")
vim.cmd([[
"
"
" nnoremap <Up> <Nop>
" nnoremap <Down> <Nop>
" nnoremap <Left> <Nop>
" nnoremap <Right> <Nop>
" nnoremap <Space> <Nop>

" inoremap <C-k> <Up>
" inoremap <C-j> <Down>
" inoremap <C-l> <Right>
" inoremap <C-h> <Left>

" nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
" nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')


"" map dd <Nop>
"" nnoremap D dd
"" nnoremap dd 0D

""inoremap ~ &
""inoremap & ~
""inoremap 4 $
""inoremap $ 4
""inoremap 7 &
""inoremap & 7
""inoremap 8 *
""inoremap * 8
""inoremap - _
""inoremap _ -

" vnoremap oi I

" nnoremap ' :
"cnoremap , <C-c>

"C-w remap
" map <C-w> <Nop>
"  nnoremap , <C-w>
"  nnoremap ,, <C-w><C-w>

" nnoremap ,0 :resize +10<CR>
" nnoremap ,9 :resize -10<CR>
" nnoremap ,] :vertical resize +10<CR>
" nnoremap ,[ :vertical resize -10<CR>

""Move buffer
"" nnoremap <silent> m1 :bprevious<CR>
"" nnoremap <silent> m2 :bnext<CR>
""nnoremap <Leader>bb :bd<CR>
""
" nnoremap ( g^
" nnoremap ) g$

""linux version
""nnoremap <A-j> :m .+1<CR>==
""nnoremap <A-k> :m .-2<CR>=
""inoremap <A-j> <Esc>:m .+1<CR>==gi
""inoremap <A-k> <Esc>:m .-2<CR>==gi
""vnoremap <A-j> :m '>+1<CR>gv=gv
""vnoremap <A-k> :m '<-2<CR>gv=gv

" nnoremap J :m .+1<CR>==
" nnoremap K :m .-2<CR>==
" nnoremap <S-l> :m .+1<CR>==
" nnoremap <S-k> :m .-2<CR>==
"nnoremap <M-Down> :m .+1<CR>==
"nnoremap <M-UP> :m .-2<CR>==
"nnoremap <M-UP> :m .-2<CR>==
"nnoremap <M-Down> :m .+1<CR>==
"inoremap <C-l> <Esc>:m .+1<CR>==gi
"inoremap <C-k> <Esc>:m .-2<CR>==gi

" vnoremap <S-l> :m '>+1<CR>gv=gv
" vnoremap <S-k> :m '<-2<CR>gv=gv

""Alternate way to save
" nnoremap ff :w<CR>

"""alternate way to exit
" map q <Nop>
" inoremap jk <Esc>
"""inoremap kj <Esc>



"vnoremap , <C-c>
"nnoremap qq :q<CR>
"nnoremap qw :bd<CR>
""nnoremap <Leader>x :x<CR>
"nnoremap qa :qa<CR>

nnoremap qh q:

""visual remap
" map v <Nop>
" map <C-v> <Nop>
" map <S-v> <Nop>
" nnoremap vv v
" nnoremap vl <s-v>
" nnoremap vb <C-v>

" nnoremap viw viw
" nnoremap vaw vaw

" nnoremap vij vi(
" nnoremap vik vi{
" nnoremap vil vi[

" nnoremap vaj va(
" nnoremap vak va{
" nnoremap val va[

" nnoremap daj da(
" nnoremap dak da{
" nnoremap dal da[

" nnoremap dij di(
" nnoremap dik di{
" nnoremap dil di[

" nnoremap caj ca(
" nnoremap cak ca{
" nnoremap cal ca[

" nnoremap cij ci(
" nnoremap cik ci{
" nnoremap cil ci[

"default number change
"inoremap 7 &
"inoremap & 7
"jnoremap 8 *
"inoremap * 8

"https://unix.stackexchange.com/questions/156707/how-to-toggle-mouse-support-in-vim
" function! ToggleMouse()
"     " check if mouse is enabled
"     if &mouse == 'a'
"         " disable mouse
"         set mouse=
"         echom "Mouse Off"
"     else
"         " enable mouse everywhere
"         set mouse=a
"         echom "Mouse On"
"     endif
" endfunc

" noremap <leader>m :call ToggleMouse()<CR>
"Quuckly newline without insert
" nnoremap <Leader>o o<Esc>
" nnoremap <Leader>O O<Esc>
"insert new line
" inoremap <C-o> <esc>o

"ctags toggle

"nnoremap <silent> <Leader>t :TagbarToggle<CR>

" nnoremap <C-k> <C-u>zzzv
" nnoremap <C-j> <C-d>zzzv

" nnoremap Y y$

" nnoremap n nzzzv
" nnoremap N Nzzzv
"
" nnoremap J mzJ`z

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u

" <C-e> : insert mode :: insert the character below line
" inoremap <CR> <C-\><C-O><C-E><CR>
" inoremap <BS> <BS><C-O>zz
]])

-- inoremap("<CR>", "<C-><C-O><C-E><CR>")
-- inoremap("<BS>", "<BS><C-O>zz")
-- nnoremap("o", "<C-E>o")

-- require("keymap.pluginKeymap")
