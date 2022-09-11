-- local U = {}

-- local highlight_under_cursor = function(client, bufnr)
-- lua =vim.lsp.get_active_clients()[1].server_capabilities
local U = function(client, bufnr)
    -- client.server_capabilities.documentFormattingProvider = false
    -- print(client.server_capabilities.importModuleSpecifierPreference)
    if client.server_capabilities.documentFormattingProvider then
        -- print((client.server_capabilities))
        -- vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]])
        vim.api.nvim_create_augroup("lsp_formatting_seq_sync", { clear = true })
        vim.api.nvim_create_autocmd({
            "BufWritePre",
        }, {
            group = "lsp_formatting_seq_sync",
            buffer = bufnr,
            -- callback = vim.lsp.buf.formatting_seq_sync,
            callback = function()
                -- vim.lsp.buf.formatting_seq_sync(nil, 2000)
                -- vim.lsp.buf.formatting_sync({ nil, 2000 })
                -- vim.lsp.buf.formatting_seq_sync(nil, 2000)
                vim.lsp.buf.formatting_seq_sync()
            end
        })
    end
end
-- U.highlight_under_cursor = highlight_under_cursor
return U
