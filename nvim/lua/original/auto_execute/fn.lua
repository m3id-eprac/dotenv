--/ 08/25/22 Thu 17:04
local A = {}


local bottom = vim.fn.line("$")
local buf, win
-- vim.g.self_made = nil
local api = vim.api
local ts_node_job = function(bufnr, current_file)
    api.nvim_buf_set_lines(buf, 0, -1, false, { "outout: ts-node: " })
    -- api.nvim_buf_set_lines(buf, 1, -1, false, { vim.fn.expand('%:p:~') })
    api.nvim_buf_set_lines(buf, 1, -1, false, {current_file})
    api.nvim_buf_set_lines(buf, 2, -1, false, { vim.fn.expand('=>') })
    vim.fn.jobstart({ "ts-node", current_file }, {
        stdout_buffered = true,
        on_stdout = function(_, data)
            if data then
                api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
            end
        end,
        on_stderr = function(_, data)
            if data then
                api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
            end
        end,
    })

end
function A.auto_execute()

    local current_file = api.nvim_buf_get_name(0)
    local get_filetype = api.nvim_buf_get_option(0, 'filetype')
    local win_height = api.nvim_win_get_height(0)
-- print(current_file)
    print(get_filetype)
    if get_filetype ~= 'typescript' then
        print('Only work TYPESCRIPT')
        return
    end
    if vim.g.self_made then
        -- print('if exist')
        -- print(vim.g.self_made)
        -- print(api.nvim_buf_get_name(0))
        -- api.nvim_buf_set_lines(vim.g.self_made, 1, -1, false, { "hello", "world", "2" })
        ts_node_job(buf, current_file)
        -- api.nvim_buf_set_lines(buf, 0, -1, false, { "outout: ts-node" })
        -- vim.fn.jobstart({ "ts-node", current_file }, {
        --     stdout_buffered = true,
        --     on_stdout = function(_, data)
        --         if data then
        --             api.nvim_buf_set_lines(buf, -1, -1, false, data)
        --             -- api.nvim_buf_set_lines(buf, -2, -1, false, data)
        --         end
        --     end,
        --     on_stderr = function(_, data)
        --         if data then
        --             api.nvim_buf_set_lines(buf, -1, -1, false, data)
        --             -- api.nvim_buf_set_lines(buf, -2, -1, false, data)
        --         end
        --     end,
        -- })
    else
        -- print('if Not exist')
        -- print(vim.g.self_made)
        -- local asdf = api.nvim_get_option_info('filetype').shortname
        -- print(vim.bo.filetype)
        -- print(api.nvim_buf_get_option(0, 'filetype'))
        win = api.nvim_get_current_win()
        buf = api.nvim_create_buf(true, true)
        api.nvim_buf_set_name(buf, 'Self made')
        -- vim.cmd("botright sp")
        vim.cmd("rightbelow sp")
        api.nvim_win_set_buf(win, buf)
        vim.g.self_made = buf
        vim.cmd('wincmd p')
        -- api.nvim_buf_set_lines(buf, 0, -1, false, { "outout: ts-node" })

        ts_node_job(buf, current_file)
        -- vim.fn.jobstart({ "ts-node", current_file }, {
        --     stdout_buffered = true,
        --     on_stdout = function(_, data)
        --         if data then
        --             -- api.nvim_buf_set_lines(buf, -1, -1, false, data)
        --             api.nvim_buf_set_lines(buf, -1, -1, false, data)
        --         end
        --     end,
        --     on_stderr = function(_, data)
        --         if data then
        --             -- api.nvim_buf_set_lines(buf, -1, -1, false, data)
        --             api.nvim_buf_set_lines(buf, -1, -1, false, data)
        --         end
        --     end,
        -- })
        --
        -- api.nvim_buf_set_name(buf, 'Self made')
        -- print(api.nvim_buf_get_name(buf))
        -- api.nvim_buf_set_option(buf, 'modifiable', false)
        -- vim.keymap.set('n', 'qq', ':bdelete<CR>', { buffer = buf })
        vim.keymap.set("n", "qq", function()
            vim.g.self_made = nil
            api.nvim_buf_delete(buf, { force = true })
        end, { buffer = buf })
    end
    -- win = api.nvim_get_current_win()
    -- buf = api.nvim_create_buf(true, true)
    -- vim.cmd('botright vs')
    -- api.nvim_win_set_buf(win, buf)
    -- vim.g.self_made = buf
    -- api.nvim_buf_set_lines(buf, bottom, -1, false, { 'hello', 'world' })
    --
    -- -- api.nvim_buf_set_name(buf, 'Self made')
    -- -- print(api.nvim_buf_get_name(buf))
    -- api.nvim_buf_set_option(buf, 'modifiable', false)
    -- vim.keymap.set('n', 'qq', ':bdelete<CR>', { buffer = buf })
end

-- A.auto_execute()
return A
