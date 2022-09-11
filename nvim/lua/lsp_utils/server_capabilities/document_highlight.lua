-- local F = {}
-- local sync_formatting = function(client, bufnr)
local F = function(client, bufnr)
    if client.resolved_capabilities.document_highlight then
        -- if client.resolved_capabilities.documentHighlightProvider then
        vim.cmd([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#504945
      hi LspReferenceText cterm=bold ctermbg=red guibg=#504945
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#504945
  ]]     )
        vim.api.nvim_create_augroup("lsp_document_highlight", {
            clear = false,
        })
        vim.api.nvim_clear_autocmds({
            buffer = bufnr,
            group = "lsp_document_highlight",
        })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = "lsp_document_highlight",
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            group = "lsp_document_highlight",
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end
end
-- F.sync_formatting = sync_formatting

return F
