require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
    },
    -- indent = {
    -- 	enable = false,
    -- 	disable = {},
    -- },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection    = "gnn",
            node_incremental  = "grn",
            scope_incremental = "grc",
            node_decremental  = "grm",
        },
    },
    -- plugin
    rainbow = {
        enable         = true,
        extended_mode  = true,
        max_file_lines = nil,
    },
    matchup = {
        enable = true,
    },
    -- html tag
    autotag = {
        enable = true,
    },

    --  JoosepAlviste/nvim-ts-context-commentstring
    context_commentstring = {
        enable         = true,
        enable_autocmd = false,
        -- config = {
        -- 	typescript = { __default = "// %s", __multiline = "/* %s */" },
        -- },
    },
    textobjects = {
        select = {
            enable    = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps   = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        move = {
            enable              = true,
            set_jumps           = true, -- whether to set jumps in the jumplist
            goto_next_start     = {
                ["]]"] = "@function.outer",
                ["]m"] = "@class.outer",
            },
            goto_next_end       = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end   = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
    },
    --  playground = {
    --    enable = true,
    --    updatetime = 25,
    --    persist_queries = false, -- Whether the query persists across vim sessions
    --    keybindings = {
    --      toggle_query_editor = "o",
    --      toggle_hl_groups = "i",
    --      toggle_injected_languages = "t",
    --      toggle_anonymous_nodes = "a",
    --      toggle_language_display = "I",
    --      focus_language = "f",
    --      unfocus_language = "F",
    --      update = "R",
    --      goto_node = "<cr>",
    --      show_help = "?",
    --    },
    --  },
    ensure_installed = "all",
    -- ensure_installed = {
    -- 	"lua",
    -- 	"vim",
    -- 	"json",
    -- 	"markdown",
    -- 	"javascript",
    -- 	"typescript",
    -- 	"rust",
    -- 	"comment",
    -- 	"html",
    -- 	"css",
    -- 	"toml",
    -- 	"yaml",
    -- 	"graphql",
    -- },
})
-- vim.cmd([[hi rainbowcol1 guifg=#ddc7a1]])
vim.g.matchup_matchparen_offscreen = { method = 'popup', fullwidth = 1 }
