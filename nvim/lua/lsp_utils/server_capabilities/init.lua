local M = {}
local highlight_under_cursor = require("lsp_utils.server_capabilities.document_highlight")
local document_formatting_provider = require("lsp_utils.server_capabilities.document_formatting_provider")

M.highlight_under_cursor = highlight_under_cursor
M.document_formatting_provider = document_formatting_provider

return M
