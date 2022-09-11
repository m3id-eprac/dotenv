""vim-startify
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_custom_header =''

let g:startify_bookmarks = [
            \{'zz':'~/.zshrc'},
            \{'al':'~/.config/alacritty/alacritty.yml'},
            \{'ll':'~/.config/nvim/lua/basic/plugins.lua'},
            \{'ls':'~/.config/nvim/after/plugin/lsp.lua'},
            \{'st':'~/.config/nvim/after/plugin/startify.vim'},
            \{'in':'~/.config/nvim/init.lua'},
            \{'tt':'~/.tmux.conf'},
            \]
"            \{'al':'~/.config/alacritty/alacritty.yml'},

let s:bookmarks1 = [
            \ '~/.zshrc'
            \]
nnoremap <Leader>;; :Startify<CR>

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] ,'indices':[]     },
            \ { 'type': 'files',     'header': ['   Files']            },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
" \ { 'type': 'dir',       'header': ['    '. getcwd()] },
"     \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
"     \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
