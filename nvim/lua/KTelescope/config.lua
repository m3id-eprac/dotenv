local telescope = require("telescope")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local action_state = require("telescope.actions.state")

local Remap = require("utils.keymap")
local nnoremap = Remap.nnoremap

telescope.setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        winblend = 10,
        sorting_strategy = "ascending",
        prompt_prefix = " ",
        results_title = false,
        -- previewer = true,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- border = false,
        layout_config = {
            prompt_position = "top",
            height = 0.6,
        },
        -- path_display = { shorten = { len = 2, exclude = { -1 } } },
        path_display = { "smart" },
        -- file_ignore_patterns = { "node_modules", "package-lock.json" },
        -- 		color_devicons = true,
        -- 		vimgrep_arguments = {
        -- 			"rg",
        -- 			"--color=never",
        -- 			"--no-heading",
        -- 			"--with-filename",
        -- 			"--line-number",
        -- 			"--column",
        -- 			"--smart-case",
        -- 			"--trim", -- add this value
        -- },
        mappings = {
            i = {
                -- 				["<M-p>"] = action_layout.toggle_preview,
                -- 				["<C-h>"] = "which_key",
                ["<esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-u>"] = false,
                ["<C-d>"] = false,
                -- 				["<M-q>"] = actions.close,
                -- 				[",s"] = actions.select_horizontal,
                -- 				[",v"] = actions.select_vertical,
            },
            n = {
                -- 				["<M-p>"] = action_layout.toggle_preview,
                -- 				["<C-h>"] = "which_key",
                -- 				["<C-c>"] = actions.close,
                ["o"] = actions.select_default,
                ["qq"] = actions.close,
                -- 				[",s"] = actions.select_horizontal,
                -- 				[",v"] = actions.select_vertical,
            },
        },
    },
    pickers = {
        find_files = {
            -- 	-- 	-- theme = "dropdown",
            -- 	-- 	-- preview = {
            -- 	-- 	-- 	hide_on_startup = true,
            -- 	-- 	-- },
            -- 	-- find_command = { "rg", "--files", "--hidden" },
            -- find_command = { "rg", "--files", "--type"k },
            -- )
            -- find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
            file_ignore_patterns = { "node_modules", "package-lock.json" },
            ---()
            -- 	-- 	-- cwd = vim.fn.expand("%:p:h"),
            -- 	-- 	-- 			--find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
            -- 	mappings = {
            -- 		n = {
            -- 			["cd"] = function(prompt_bufnr)
            -- 				local selection = require("telescope.actions.state").get_selected_entry()
            -- 				local dir = vim.fn.fnamemodify(selection.path, ":p:h")
            -- 				require("telescope.actions").close(prompt_bufnr)
            -- 				-- Depending on what you want put `cd`, `lcd`, `tcd`
            -- 				vim.cmd(string.format("silent lcd %s", dir))
            -- 			end,
            -- 		},
            -- 	},
        },
        live_grep = {
            file_ignore_patterns = { "node_modules", "package-lock.json" },
            --
            -- 	-- layout_config = {
            -- 	find_command = { "rg", "--files", "--hidden" },
            -- 	-- 	prompt_position = "top",
            -- 	-- },
            -- 	-- theme = "ivy",
            -- mappings = {
            -- 	i = {
            -- 		["<CR>"] = actions.send_to_qflist + actions.open_qflist,
            -- 	},
            -- },
            -- },
            -- buffers = {
            -- 	-- theme = "ivy",
        },
        current_buffer_fuzzy_find = {
            mappings = {
                i = {
                    ["<CR>"] = actions.send_to_qflist + actions.open_qflist,
                },
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        -- project = {
        -- 	theme = "dropdown",
        -- },
        file_browser = {
            -- theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
    },
})
-- require("telescope.builtin").current_buffer_fuzzy_find(no_preview())
telescope.load_extension("fzf")
-- telescope.load_extension("project")
-- telescope.load_extension("frecency")
telescope.load_extension("file_browser")
telescope.load_extension("harpoon")

nnoremap(
    "<leader>fu",
    function()
        require("KTelescope.config").reload_modules()
        print("Reload Modules")
    end
-- ':lua require("KTelescope.config").reload_modules()<CR>'
)

local M = {}
function M.reload_modules()
    -- Because TJ gave it to me.  Makes me happpy.  Put it next to his other
    -- awesome things.
    local lua_dirs = vim.fn.glob("./lua/*", 0, 1)
    for _, dir in ipairs(lua_dirs) do
        dir = string.gsub(dir, "./lua/", "")
        require("plenary.reload").reload_module(dir)
    end
end

return M
