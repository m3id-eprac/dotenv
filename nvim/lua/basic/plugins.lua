-- use "junegunn/seoul256.vim"
-- use({ "konfekt/fastfold" })
-- use({ "mhartington/oceanic-next" })
--------------------------------------------------------------------------------
-- TODO: fully

vim.cmd([[packadd packer.nvim]])

return require("packer").startup({
    function(use)
        -- legit ---------------------------------------------------------------
        use({ "wbthomason/packer.nvim" })
        use({ "nvim-lua/plenary.nvim" })

        use({ "machakann/vim-sandwich" })
        use({ "sbdchd/neoformat" })

        use({
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons", -- optional, for file icon
            },
        })
        use({ 'ms-jpq/chadtree',
            branch = 'chad',
            run = 'python3 -m chadtree deps' })

        -- colorscheme ---------------------------------------------------------
        use({ "ellisonleao/gruvbox.nvim" })
        use({ "sainnhe/gruvbox-material" })
        use({ "rebelot/kanagawa.nvim" })
        use({ "marko-cerovac/material.nvim" })

        -- interface -----------------------------------------------------------
        use({ "mhinz/vim-startify" })
        use({
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons", opt = true },
        })
        -- use({
        -- 	"akinsho/bufferline.nvim",
        -- 	tag = "v2.*",
        -- 	requires = "kyazdani42/nvim-web-devicons",
        -- 	config = function()
        -- 		require("bufferline").setup({
        -- 			options = {
        -- 				diagnostics = "nvim_lsp",
        -- 				-- show_buffer_icons = false,
        -- 				show_buffer_close_icons = false,
        -- 				show_close_icon = false,
        -- 				-- separator_style = "padded_slant",
        -- 				separator_style = "",
        -- 				always_show_bufferline = false,
        -- 			},
        -- 			-- highlights = {
        -- 			-- 	separator = {
        -- 			-- 		guifg = "#504945",
        -- 			-- 		guibg = "#504945",
        -- 			-- 	},
        -- 			-- },
        -- 		})
        -- 	end,
        -- })

        -- comment -------------------------------------------------------------
        use({
            "JoosepAlviste/nvim-ts-context-commentstring",
            requires = {
                "numToStr/Comment.nvim",
                --"tpope/vim-commentary"
            },
        })
        -- use({ "tpope/vim-commentary" })
        -- use({
        -- 	"numToStr/Comment.nvim",
        --		config = function()
        --			require("Comment").setup()
        --		end,
        -- })
        -- use({ "tpope/vim-commentary" })

        -- misc ----------------------------------------------------------------
        use({
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup({
                    "*",
                    css = {
                        rgb_fn = true,
                        hsl_fn = true,
                        css = true,
                        css_fn = true,
                    },
                    "html",
                })
            end,
        })
        -- use({
        -- 	"sunjon/shade.nvim",
        -- 	config = function()
        -- 		require("shade").setup({})
        -- 	end,
        -- })
        use({
            "simrat39/symbols-outline.nvim",
        })
        use({
            "iamcco/markdown-preview.nvim",
            run = function()
                vim.fn["mkdp#util#install"]()
            end,
        })

        use({
            "j-hui/fidget.nvim",
            config = function()
                require("fidget").setup({
                    text = {
                        spinner = "dots",
                    },
                })
            end,
        })
        use("ThePrimeagen/harpoon")
        -- use({
        -- 	"ThePrimeagen/refactoring.nvim",
        -- 	requires = {
        -- 		{ "nvim-lua/plenary.nvim" },
        -- 		{ "nvim-treesitter/nvim-treesitter" },
        -- 	},
        -- })
        use({ "kevinhwang91/nvim-bqf" })
        use({ "junegunn/fzf" })
        use({ "mbbill/undotree" })

        use({ "windwp/nvim-spectre" })
        use("junegunn/vim-easy-align")
        use("ggandor/lightspeed.nvim")
        -- use({
        -- 	"akinsho/toggleterm.nvim",
        -- 	tag = "v2.*",
        -- config = function()
        -- 	require("toggleterm").setup()
        -- end,
        -- })
        use({ "chentoast/marks.nvim" })

        -- use({ 'airblade/vim-rooter' })
        use({ "ahmedkhalf/project.nvim" })

        -- telescope family  ---------------------------------------------------
        use({
            "nvim-telescope/telescope.nvim",
            branch = "0.1.x",
            requires = {
                { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
                { "nvim-telescope/telescope-project.nvim" },
                { "nvim-telescope/telescope-file-browser.nvim" },
            },
        })

        -- treesitter family ---------------------------------------------------
        use({
            "nvim-treesitter/nvim-treesitter",
            requires = {
                { "p00f/nvim-ts-rainbow" },
                { "andymass/vim-matchup" },
                { "windwp/nvim-ts-autotag" },
                { "nvim-treesitter/playground" },
                { "nvim-treesitter/nvim-treesitter-textobjects" },
            },
            run = ":TSUpdate",
        })
        use({
            "windwp/nvim-autopairs",
            -- config = function()
            --     require("nvim-autopairs").setup({
            --         --             enable_check_bracket_line = true,
            --         check_ts = true,
            --         ts_config = {
            --             javascript = { "template_string" },
            --         },
            --     })
            -- end,
        })
        --use "lukas-reineke/indent-blankline.nvim" })
        -- use("haringsrob/nvim_context_vt")
        use("jubnzv/virtual-types.nvim")
        -- lsp family ----------------------------------------------------------
        use("neovim/nvim-lspconfig")
        use("jose-elias-alvarez/typescript.nvim")

        use({ "hrsh7th/nvim-cmp", requires = { { "onsails/lspkind-nvim" } } })
        use("hrsh7th/cmp-nvim-lsp")
        use("hrsh7th/cmp-buffer")
        use("hrsh7th/cmp-path")
        use("hrsh7th/cmp-cmdline")
        -- prime pic
        -- use("tzachar/cmp-tabnine", { run = "./install.sh" })
        -- use({"nvim-lua/lsp_extensions.nvim",
        -- config = function ()

        -- end})
        --use("hrsh7th/cmp-nvim-lsp-signature-help")
        use({
            "ray-x/lsp_signature.nvim",
        })
        use({
            "rmagatti/goto-preview",
            config = function()
                require("goto-preview").setup({})
            end,
        })
        use({
            "m-demare/hlargs.nvim",
            requires = { "nvim-treesitter/nvim-treesitter" },
            config = function()
                require("hlargs").setup({
                    color = "#fac863",
                })
            end,
        })
        use({ "simrat39/rust-tools.nvim" })
        use({
            "glepnir/lspsaga.nvim",
            branch = "main",
            config = function()
                local saga = require("lspsaga")
                local config = {
                    border_style = "rounded",
                    code_action_icon = "",
                    code_action_lightbulb = {
                        enable = false,
                        sign = false,
                    },
                    code_action_keys = {
                        exec = "o",
                    },
                }

                saga.init_lsp_saga(config)
            end,
        })
        -- use({
        -- 	"jubnzv/virtual-types.nvim",
        -- })
        -- use({ "ray-x/navigator.lua", requires = { "ray-x/guihua.lua", run = "cd lua/fzy && make" } })
        -- use("nvim-lua/lsp_extensions.nvim")

        --snippetsa ------------------------------------------------------------
        use({ "L3MON4D3/luasnip" })
        use({ "saadparwaiz1/cmp_luasnip" })
        use({ "rafamadriz/friendly-snippets" })

        -- extends  ------------------------------------------------------------
        use("b0o/schemastore.nvim")
        use({
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("trouble").setup({
                    height = 7,
                    -- your configuration comes her
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                })
            end,
        })
        use({
            "folke/todo-comments.nvim",
            -- requires = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup({
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                })
            end,
        })
        -- use({ "jose-elias-alvarez/nvim-lsp-ts-utils" })
        -- use({
        -- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        -- 	config = function()
        -- 		require("lsp_lines").setup()
        -- 	end,
        -- })
        use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
        -- debug dap -----------------------------------------------------------
        use({ "mfussenegger/nvim-dap" })
        use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
        use({ "theHamsta/nvim-dap-virtual-text" })
        use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })
        use({
            "microsoft/vscode-js-debug",
            opt = true,
            run = "npm install --legacy-peer-deps && npm run compile",
        })
        --use({ "puremourning/vimspector" })
        use({ "vim-test/vim-test" })

        --------------------------------------------------------------------------
        --	use({ "mbbill/undotree" })

        --git
        --use("tpope/vim-fugitive")
        -- use({
        -- 	"TimUntersberger/neogit",
        -- 	requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
        -- })
        --diff
        -- use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
        --markdown
        --	use({ "preservim/vim-markdown", requires = "godlygeek/tabular" })
        -------------------
        --standalone ui for nvim-lsp progress

        --	use({ "rcarriga/vim-ultest", requires = { "vim-test/vim-test" }, run = ":UpdateRemotePlugins" })
        -- use({ "fladson/vim-kitty" })
        -- ---------------------------------------
        --	use({
        --		"folke/twilight.nvim",
        --		config = function()
        --			require("twilight").setup({
        --				-- your configuration comes here
        --				-- or leave it empty to use the default settings
        --				-- refer to the configuration section below
        --			})
        --		end,
        --	})
        --	use({
        --		"folke/zen-mode.nvim",
        --		requires = {
        --			{
        --				"folke/twilight.nvim",
        --				config = function()
        --					require("twilight").setup({
        --						context = 16,
        --					})
        --				end,
        --			},
        --		},
        --		config = function()
        --			require("zen-mode").setup({
        --				-- your configuration comes here
        --				-- or leave it empty to use the default settings
        --				-- refer to the configuration section below
        --				twilight = { enabled = true },
        --			})
        --		end,
        --	})
        --
        use({
            "Pocco81/true-zen.nvim",
            config = function()
                require("true-zen").setup({
                    modes = {
                        ataraxis = {
                            minimum_writing_area = {
                                width = 80,
                            },
                        },
                    },
                    integrations = {
                        twilight = true,
                        tmux = true,
                        lualine = true,
                    },
                    -- your config goes here
                    -- or just leave it empty :)
                })
            end,
        })
        use("fladson/vim-kitty")
    end,
    config = {
        display = {
            -- non_interactive = true,
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
            -- open_fn = nil,
            -- open_cmd = '1vnew'
        },
        autoremove = true,
    },
})
