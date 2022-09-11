local Remap = require("utils.keymap")
local nnoremap = Remap.nnoremap
local action = require("lspsaga.codeaction")

-- local UICustom = require("lsp_utils.UICustom")
-- local highlight_under_cursor = UICustom.highlight_under_cursor
-- local sync_format = require("lsp_utils.sync_format")
-- local sync_formatting = sync_format.sync_formatting

local server_capabilties = require("lsp_utils.server_capabilities")

local huc = server_capabilties.highlight_under_cursor
local dfp = server_capabilties.document_formatting_provider
local result
local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- require("lspconfig").ocamllsp.setup({ on_attach = require("virtualtypes").on_attach })
    --lsp_signature.nvim
    require("lsp_signature").on_attach({
        doc_lines = 10,
        floating_window = false,
        hint_enable = true,
        hint_prefix = "",
    })
    -- require("virtualtypes").on_attach(client, bufnr)
    -----------------------------------------------------
    -- highlight_under_cursor(client, bufnr)
    -- sync_formatting(client, bufnr)
    huc(client, bufnr)
    dfp(client, bufnr)
    -- if client.resolved_capabilities.document_formatting then
    --     print('resolved_capabilities')
    -- end
    -- if client.server_capabilities.documentFormattingProvider then
    --     print('server_capabilities')
    -- end
    -- if
    -- vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]])
    -- vim.api.nvim_create_augroup("lsp_formatting_seq_sync", { clear = true })
    -- vim.api.nvim_create_autocmd({
    --     "BufWritePre",
    -- }, {
    --     group = "lsp_formatting_seq_sync",
    --     buffer = bufnr,
    --     callback = vim.lsp.buf.formatting_seq_sync,
    -- })
    -- end

    -- print(_VERSION)
    -- vim.api.nvim_create_autocmd("CursorHold", {
    -- 	buffer = bufnr,
    -- 	callback = function()
    -- 		local Copts = {
    -- 			focusable = false,
    -- 			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    -- 			border = "rounded",
    -- 			source = "always",
    -- 			prefix = " ",
    -- 			scope = "cursor",
    -- 		}
    -- 		vim.diagnostic.open_float(nil, Copts)
    -- 	end,
    -- })

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

    nnoremap("gD", "<cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
    nnoremap("gd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", bufopts)

    --vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua PeekDefinition()<CR>", opts)
    nnoremap(";", "<cmd>lua vim.lsp.buf.hover()<CR>", bufopts)
    nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", bufopts)

    nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>", bufopts)
    nnoremap("gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", bufopts)

    --	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    nnoremap("<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", bufopts)
    nnoremap("<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", bufopts)
    nnoremap("<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", bufopts)
    nnoremap("<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", bufopts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    --vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua Rename.rename()<CR>", { silent = true })
    --vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua require('renamer').rename()<CR>", { silent = true })
    nnoremap("fg", "<cmd>lua vim.lsp.buf.formatting_sync(nill,2000)<CR>", bufopts)

    -- lspsaga keymap
    nnoremap("<leader>ca", "<cmd>Lspsaga lsp_action<CR>", { silent = true, noremap = true })
    nnoremap("gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true, noremap = true })
    nnoremap("<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true, noremap = true })
    -- nnoremap("gd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
    -- nnoremap("<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
    -- nnoremap("d,", function()
    --     require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
    -- end, { silent = true })
    -- nnoremap("d.", function()
    --     require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
    -- end, { silent = true })
    -- rust-tools
    vim.keymap.set("n", "<C-space>", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
    -- Code action groups
    vim.keymap.set("n", "<Leader>a", require("rust-tools").code_action_group.code_action_group, { buffer = bufnr })
end

return on_attach
