local M = {}

local api = vim.api

-- local bottom = vim.fn.line('$')
-- local current_row, current_col = unpack(api.nvim_win_get_cursor(0))

function M.check_bottom()
local bottom = vim.fn.line('$')
local current_row, current_col = unpack(api.nvim_win_get_cursor(0))
    if current_row == bottom then
        api.nvim_buf_set_lines(0, -1, -1, false, { '', '', '', '', '' })
        -- api.nvim_win_set_cursor(0, { current_row, 0 })
    end
end

return M
