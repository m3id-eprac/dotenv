local hl = require("utils.hl")

local gruvbox = require("utils.colors.gruvbox_material_palette")
local fg1 = gruvbox.fg1
local fg2 = gruvbox.fg2
local bg1 = gruvbox.bg1
local grey = gruvbox.grey

local Remap = require("utils.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

vim.api.nvim_create_user_command("Reload", function()
    return function()
        for name, _ in pairs(package.loaded) do
            if name:match("^cnull") then
                package.loaded[name] = nil
            end
        end

        dofile(vim.env.MYVIMRC)
    end
end, {})
-- gruvbox_material ------------------------------------------------------------
-- vim.g.gruvbox_material_background = "soft"
-- vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_enable_bold = 1
-- vim.g.gruvbox_material_visual = "green background"
-- vim.g.gruvbox_material_menu_selection_background = "red"

-- markdown-preview ------------------------------------------------------------
vim.g.mkdp_auto_start = 1
vim.g.mkdp_browser = "firefox"
vim.g.mkdp_filetypes = { "markdown" }

vim.g.mkdp_theme = "dark"

-- hlargs.nvim -----------------------------------------------------------------
-- require("hlargs").setup()
--

--neoformat --------------------------------------------------------------------
vim.g.neoformat_enabled_javascript = { "prettier" }
vim.g.neoformat_enabled_typescript = { "prettier" }
vim.g.neoformat_enabled_json = { "prettier" }
vim.g.neoformat_enabled_html = { "prettier" }
vim.g.neoformat_enabled_css = { "prettier" }
vim.g.neoformat_enabled_scss = { "prettier" }
vim.g.neoformat_enabled_yaml = { "prettier" }
vim.g.neoformat_enabled_lua = { "stylua" }
vim.g.neoformat_enabled_rust = { "rustfmt" }
vim.g.neoformat_enabled_toml = { "taplo" }
vim.g.neoformat_enabled_zsh = { "shfmt" }
-- vim.g.neoformat_enabled_swcrc = { "prettier" }
vim.g.shfmt_opt = "-ci"

vim.g.neoformat_only_msg_on_error = 1
vim.g.neoformat_try_node_exe = 1

-- nnoremap("fn", ":Neoformat<CR>| :w<CR>|:loadview<CR>")
nnoremap("fn", ":Neoformat<CR>|:w<CR>")
vim.api.nvim_create_user_command("BarePrettier", "%!prettier --stdin-filepath %", {})

-- nvim tree -------------------------------------------------------------------
local function custom_callback(callback_name)
    return string.format(":lua require('utils.treeutils').%s()<CR>", callback_name)
end

local function toggle_replace()
    local view = require("nvim-tree.view")
    if view.is_visible() then
        view.close()
    else
        require("nvim-tree").open_replacing_current_buffer()
    end
end

local config = {
    -- sync_root_with_cwd = false,
    -- respect_buf_cwd = false,
    -- update_focused_file = {
    --     enable = false,
    --     update_root = false
    -- },
    view = {
        mappings = {
            custom_only = false,
            list = {
                -- { key = "<CR>", action = "edit_in_place" },
                { key = { "o" }, action = "edit" },
                { key = { "l" }, action = "cd" },
                { key = "h", action = "dir_up" },
                { key = "I", action = "toggle_git_ignored" },
                { key = "H", action = "toggle_dotfiles" },
                -- { key = "a", action = "create" + "edit" },
                { key = "<c-f>", cb = custom_callback("launch_find_files") },
                { key = "<c-g>", cb = custom_callback("launch_live_grep") },
            },
        },
    },
    renderer = {
        highlight_opened_files = "all",
    },
    actions = {
        open_file = {
            quit_on_open = true,
            window_picker = {
                chars = "1234567890",
            },
        },
    },
    live_filter = {
        prefix = "[F]",
    },
    update_focused_file = {
        enable = true,
    }
}
-- vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", { silent = true, noremap = true })
nnoremap("<leader>n", "<cmd>NvimTreeToggle<CR>")
-- nnoremap("<leader>n", function()
--     toggle_replace()
-- end)
-- vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>NvimTreeFindFile<CR>", { silent = true, noremap = true })
require("nvim-tree").setup(config)
-- require("nvim-tree").setup()

-- trouble ---------------------------------------------------------------------
nnoremap("<leader>xx", "<cmd>TroubleToggle<cr>")
nnoremap("gR", ":TroubleToggle lsp_references<CR>")
nnoremap("<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
nnoremap("<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
nnoremap("<leader>xl", "<cmd>Trouble loclist<cr>")
nnoremap("<leader>xq", "<cmd>Trouble quickfix<cr>")
nnoremap("gR", "<cmd>Trouble lsp_references<cr>")

local silent = { silent = true }

-- vim-easy-align --------------------------------------------------------------
xnoremap("ga", "<Plug>(EasyAlign)")
nnoremap("ga", "<Plug>(EasyAlign)")

-- symbols outline -------------------------------------------------------------
-- hl("NormalFloat", { fg = "#fabd2f", bg = "#3C3836", italic = true })
hl("FocusedSymbol", { fg = "#fabd2f", italic = true })
-- vim.cmd([[
--     hi FocusedSymbol guifg=#fabd2f guibg=#3c3836 gui=bold
-- ]])
require("symbols-outline").setup({
    highlight_hovered_item = true,
    -- show_guides = false,
    autofold_depth = 2,
    -- auto_unfold_hover=false
    -- preview_bg_highlight = "myColor",
})
hl("FocusedSymbol", { fg = "#fabd2f", italic = true })
-- vim.cmd([[
--     " hi focusedsymbol links MyFocuse
--     hi MyFocuse guifg=#89b482 gui=bold
--     hi def link FocusedSymbol MyFocuse
-- ]])
-- hl("FocusedSymbol", { fg = "#fabd2f", bg = "#3C3836", italic = true })
-- hl("SymbolsOutlineConnector", { fg = "#fabd2f", bg = "#3C3836", italic = true })
-- hl("Comment", { fg = "#fabd2f", bg = "#3C3836", italic = true })
nnoremap("<leader>s", ":SymbolsOutline<CR>")

nnoremap("<leader>;", '<cmd>lua require("code_action_utils").code_action_listener()<CR>')

-- lightspeed ------------------------------------------------------------------
vim.g.lightspeed_no_default_keymaps = true
-- require('lightspeed').setup()
-- require('lightspeed').setup({
--     safe_labels = { 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', '1', '2', '3', '4', '5', '6' },
--     labels = {
--         'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'z', 'x', 'c', 'v', 'b', 'n', 'm', '7', '8'
--     },
-- })
nnoremap("ss", "<Plug>Lightspeed_omni_s")
nnoremap("<leader>gs", "<Plug>Lightspeed_omni_gs")

-- nvim_context_vt
-- require('nvim_context_vt').setup({})
-- lsp_lines.nvim
-- vim.diagnostic.config({
-- 	virtual_text = false,
-- })
-- vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

-- nkkim-ufo :fold -------------------------------------------------------------
-- vim.o.foldcolumn = "1"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "<leader>mv", ":mkview<CR>")
vim.keymap.set("n", "<leader>lv", ":loadview<CR>")

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set("n", "<leader>k", function()
    local winid = require("ufo").peekFoldedLinesUnderCursor()
    if not winid then
        -- choose one of them
        -- coc.nvim
        vim.fn.CocActionAsync("definitionHover")
        -- nvimlsp
        vim.lsp.buf.hover()
    end
end)

local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ("  %d "):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, { suffix, "MyUfoFoldSign" })
    return newVirtText
end

require("ufo").setup({
    fold_virt_text_handler = handler,
    provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
        -- return { "treesitter" }
    end,
})

-- undotree --------------------------------------------------------------------
nnoremap("<leader>u", ":UndotreeToggle<CR>")
-- " let g:undotree_windowlayout = 2
vim.g.undotree_WindowLayout = 4
vim.g.undotree_DiffpanelHeight = 13
vim.g.undotree_SetFocusWhenToggle = 1
-- " let g:undotree_RelativeTimestamp  =0
vim.g.undotree_ShortIndicators = 1
vim.cmd([[
" function g:Undotree_CustomMap()
function! g:Undotree_CustomMap()
    nmap <buffer> k <plug>UndotreeNextState
    nmap <buffer> j <plug>UndotreePreviousState
endfunc
]])

-- comment.nvim ----------------------------------------------------------------
require("Comment").setup({
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})

-- harpoon ---------------------------------------------------------------------
require("harpoon").setup({})
nnoremap("<leader>hj", require("harpoon.mark").add_file)
nnoremap("<leader>hu", require("harpoon.ui").toggle_quick_menu)
nnoremap("<leader>hk", require("harpoon.ui").nav_prev)
nnoremap("<leader>hl", require("harpoon.ui").nav_next)

-- marks -----------------------------------------------------------------------
require("marks").setup({
    default_mappings = false,
    bookmark_0 = {
        annotate = true,
    },
    mappings = {
        toggle = "mm",
        next = "mn",
        preview = "ma",
        delete_buf = "mx",
        set_bookmark = "m1",
        delete_bookmark = "dm1",
    },
})

-- nvim_autopairs
require("small.npairs")

-- project_nvim
require("project_nvim").setup({
    -- All the patterns used to detect root dir, when **"pattern"** is in
    -- detection_methods
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", 'tsconfig.json', '=nvim' },
    datapath = vim.fn.stdpath("data"),
})

-- local project_nvim = require("project_nvim")
-- local recent_projects = project_nvim.get_recent_projects()
--
-- print(vim.inspect(recent_projects))

-- chadtree
-- local chadtree_settings = {
--    ["keymap.primay"] = "o",
--    ["keymap.open_sys"] = ''
-- }

nnoremap("<leader>v", "<cmd>CHADopen<cr>")
-- nnoremap("<leader>l", "<cmd>call setqflist([])<cr>")

--vim.api.nvim_set_var('chadtree_settings', chadtree_settings)
