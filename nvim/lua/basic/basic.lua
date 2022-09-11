-- vim.g.mapleader = "\<Space>"basic
-- These wrappers also have more sophisticated `vim.opt*` variants that
-- provide convenient mechanisms for setting options in Lua. They're similar
-- to what you might be used to in your `init.vim`:
-- `vim.opt`: behaves like `:set`
-- `vim.opt_global`: behaves like `:setglobal`
-- `vim.opt_local`: behaves like `:setlocal`
local set = vim.opt

vim.g.mapleader = " "
-- tjdev
set.pumblend = 17
-- set.wildmode                          = "longest:full"
-- set.wildoptions                       = "pum"

set.showmode = false
-- set.showcmd                           = true
-- set.cmdheight                         = 1 -- Height of the command bar
set.incsearch = true -- Makes search act like search in modern browsers
set.showmatch = true -- show matching brackets when text indicator is over them
-- set.relativenumber                    = true -- Show line numbers
-- set.number                            = true -- But show the actual number for the line we're on
-- set.ignorecase                        = true -- Ignore case when searching...
-- set.smartcase                         = true -- ... unless there is a capital letter in the query
-- set.hidden                            = true -- I like having buffers stay around
-- set.equalalways                       = false -- I don't like my windows changing all the time
-- set.splitright                        = true -- Prefer windows splitting to the right
-- set.splitbelow                        = true -- Prefer windows splitting to the bottom
-- set.updatetime                        = 1000 -- Make updates happen faster
set.hlsearch = true -- I wouldn't use this without my DoNoHL function
-- set.scrolloff                         = 10 -- Make it so there are always ten lines below my cursor
-- set.termguicolors                     = true
-- set
-- syntax enable                         --  " Enables syntax highlighing
set.hidden = true --  " Required to keep multiple buffers open multiple buffers
-- "set nowrap                        --      " Display long lines as just one line
--default utf-8-- set.encoding           = "utf-8" --  " The encoding displayed
set.pumheight = 10 --  " Makes popup menu smaller
set.fileencoding = "utf-8" --  " The encoding written to file
set.ruler = true --  " Show the cursor position all the time
set.cmdheight = 2 --  " More space for displaying messages
-- set.iskeyword                        += -                      --  " treat dash separated words as a word text object"
-- ." "set mouse                         = a                    --        " Enable your mouse
set.splitbelow = true --  " Horizontal splits will automatically be below
set.splitright = true --  " Vertical splits will automatically be to the right
-- set.t_Co                              = "256" --  " Support 256 colors
set.conceallevel = 0 --  " So that I can see `` in markdown files
set.tabstop = 4 --  " Insert 2 spaces for a tab
set.shiftwidth = 4 --  " Change the number of space characters inserted for indentation
set.smarttab = true --  " Makes tabbing smarter will realize you have 2 vs 4
set.expandtab = true --  " Converts tabs to spaces
set.cindent = true
set.smartindent = true --  " Makes indenting smart
set.autoindent = true --  " Good auto indent
set.laststatus = 0 --  " Always display the status line
--
--
-- set.number = true --  " Line numbers
-- set.relativenumber = true
--
set.cursorline = true --  " Enable highlighting of the current line
-- neovim default dark-- set.background  = "dark" --  " tell vim what the background color looks like
set.showtabline = 4 --  " Always show tabs
-- set.nobackup                          = true --  " This is recommended by coc
-- set.nowritebackup                     = true --  " This is recommended by coc
set.updatetime = 250 --  " Faster completion
set.timeoutlen = 500 --  " By default timeoutlen is 1000 ms
-- set.formatoptions                    -= cro                --  " Stop newline continution of comments
set.clipboard = "unnamedplus" --  " Copy paste between vim and everything else

set.colorcolumn = "80"

set.autochdir = true -- " Your working directory will always be the same as your working directory

-- .""keep center whatever
set.scrolloff = 999

-- .""set completeopt                    = menu,menuone,noselect

set.signcolumn = "yes"

-- ."04/28/22 Thu 18:56
set.breakindent = true
set.linebreak = true
set.ignorecase = true
set.smartcase = true

-- setlocal foldmethod                   = indent
-- setlocal foldmethod                   = expr
-- set.foldexpr                          = nvim_treesitter#foldexpr()
-- set.foldmethod                        = expr
-- set.foldexpr                          = nvim_treesitter#foldexpr()
-- set.nofoldenable
-- " set foldlevel                       = 99
-- set.foldlevel = 20

-- wild ignore
set.wildignore = { "*/node_modules/**", "package-lock.json" }

-- viewoptions
-- set.rtp
vim.cmd([[
" set viewoptions=folds,cursor,curdir,localoptions
""set fillchars=fold:\ "The backslash escapes a space
""set foldtext=CustomFoldText()
""
""function! CustomFoldText()
""  let indentation = indent(v:foldstart - 1)
""  let foldSize = 1 + v:foldend - v:foldstart
""  let foldSizeStr = " " . foldSize . " lines "
""  let foldLevelStr = repeat("+--", v:foldlevel)
""  let expansionString = repeat(" ", indentation)
""
""  return expansionString . foldLevelStr . foldSizeStr
""endfunction

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %

if (has('termguicolors'))
    set termguicolors
endif

" augroup restore_pos | au!
"     au BufWinEnter *
"                 \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
"                 \ |   exe 'normal! g`"zz'
"                 \ | endif
" augroup end
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

]])
