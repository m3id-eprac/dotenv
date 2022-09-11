local Remap = require("utils.keymap")
local nnoremap = Remap.nnoremap
local opts = { noremap = true, silent = true }
-- local dropdown_theme = require("telescope.themes").get_dropdown({
-- 	results_height = 20,
-- 	winblend = 20,
-- 	width = 0.8,
-- 	prompt_title = "",
-- 	prompt_prefix = "Files>",
-- 	previewer = false,
-- 	borderchars = {
-- 		prompt = { "‚ñÄ", "‚ñê", "‚ñÑ", "‚ñå", "‚ñõ", "‚ñú", "‚ñü", "‚ñô" },
-- results = { " ", "‚ñê", "‚ñÑ", "‚ñå", "‚ñå", "‚ñê", "‚ñü", "‚ñô" },
-- 		preview = { "‚ñÄ", "‚ñê", "‚ñÑ", "‚ñå", "‚ñõ", "‚ñú", "‚ñü", "‚ñô" },
-- 	},
-- })

-- local no_preview = function()
-- 	return require("telescope.themes").get_dropdown({
-- 		borderchars = {
-- 			{ "‚îÄ", "‚îÇ", "‚îÄ", "‚îÇ", "‚îå", "‚îê", "‚îò", "‚îî" },
-- 			prompt = { "‚îÄ", "‚îÇ", " ", "‚îÇ", "‚îå", "‚îê", "‚îÇ", "‚îÇ" },
-- 			results = { "‚îÄ", "‚îÇ", "‚îÄ", "‚îÇ", "‚îú", "‚î§", "‚îò", "‚îî" },
-- 			preview = { "‚îÄ", "‚îÇ", "‚îÄ", "‚îÇ", "‚îå", "‚îê", "‚îò", "‚îî" },
-- 		},
-- 		width = 0.8,
-- 		previewer = false,
-- 		prompt_title = false,
-- 	})
-- end
nnoremap(
    "<leader>ff",
    function()
        require("telescope.builtin").find_files()
        -- print('Find_files')
    end
-- ":lua require('telescope.builtin').find_files()<cr>"
-- find git topdirecpt
-- ":lua require('telescope.builtin').find_files({cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1]} )<cr>",
)
nnoremap("<leader>fr", ":lua require('telescope.builtin').live_grep()<cr>", opts)

nnoremap("<leader><space>", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
----vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { noremap = true })

--project
nnoremap(
    "<leader>fd",
    -- ":lua require'telescope'.extensions.project.project(require('telescope.themes').get_dropdown({ winblend = 20,width=0.9,prompt_title=false }))<CR>",
    -- ":lua require'telescope'.extensions.project.project(require('telescope.themes').get_dropdown())<CR>",
    -- ":lua require'telescope'.extensions.project.project(require('telescope.themes').get_dropdown({ winblend = 10, prompt_title=false, layout_config={ width=0.8 }} ))<CR>",
    ":lua require'telescope'.extensions.project.project{}<CR>",
    opts
)

nnoremap("<leader>fg", "<cmd>lua require('telescope.builtin').grep_string()<cr>", opts)
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<Leader>fg",
-- 	":lua require('telescope.builtin').git_files({show_untracked=false})<CR>",
-- 	{ noremap = true, silent = true }
-- )

-- file browser
nnoremap("<space>fb", ":Telescope file_browser<CR>", opts)
nnoremap("<space>fv", ":Telescope current_buffer_fuzzy_find<CR>", opts)
