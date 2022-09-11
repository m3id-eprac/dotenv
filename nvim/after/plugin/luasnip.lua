local ls = require("luasnip")

local function prequire(...)
	local status, lib = pcall(require, ...)
	if status then
		return lib
	end
	return nil
end

local luasnip = prequire("luasnip")

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-n>")
	elseif luasnip and luasnip.expand_or_jumpable() then
		return t("<Plug>luasnip-expand-or-jump")
	elseif check_back_space() then
		return t("<Tab>")
	else
		return vim.fn["compe#complete"]()
	end
	return ""
end
_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-p>")
	elseif luasnip and luasnip.jumpable(-1) then
		return t("<Plug>luasnip-jump-prev")
	else
		return t("<S-Tab>")
	end
	return ""
end

vim.api.nvim_set_keymap("i", "<C->>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<C-<>", "v:lua.tab_complete()", { expr = true })

vim.api.nvim_set_keymap("i", "<C->>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<C-<>", "v:lua.s_tab_complete()", { expr = true })

-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

vim.cmd([[
"imap <silent><expr> m, luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : 'm,'
" For changing choices in choiceNodes (not strictly necessary for a basic setup).
"imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
"smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]])
vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
-- If you're reading this file for the first time, best skip to around line 190
-- where the actual snippet-definitions start.

-- Every unspecified option will be set to the default.
ls.config.set_config({
	history = true,
	-- Update more often, :h events for more info.
	updateevents = "TextChanged,TextChangedI",
	-- Snippets aren't automatically removed if their text is deleted.
	-- `delete_check_events` determines on which events (:h events) a check for
	-- deleted snippets is performed.
	-- This can be especially useful when `history` is enabled.
	delete_check_events = "TextChanged",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 300,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	enable_autosnippets = true,
	-- mapping for cutting selected text so it's usable as SELECT_DEDENT,
	-- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
	store_selection_keys = "<Tab>",
	-- luasnip uses this function to get the currently active filetype. This
	-- is the (rather uninteresting) default, but it's possible to use
	-- eg. treesitter for getting the current filetype by setting ft_func to
	-- require("luasnip.extras.filetype_functions").from_cursor (requires
	-- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
	-- the current filetype in eg. a markdown-code block or `vim.cmd()`.
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})

ls.add_snippets("all", {
	s(
		"cur",
		f(function()
			return os.date("%D %a %H:%M")
		end)
	),
	-- 06/13/22 Mon 06:26
	-- 06/13/22 Mon 06:26
	-- currtime
	-- 22/06/13 Mon 06:28
	s(
		"currtime",
		f(function()
			return os.date("%y/%m/%d %a %H:%M")
		end)
	),
	s(
		"todo",
		fmt(
			[[
    TODO:
    ]],
			{}
		)
	),
	s(
		"hack",
		fmt(
			[[
    HACK:
    ]],
			{}
		)
	),
	s(
		"warn",
		fmt(
			[[
    WARN:
    ]],
			{}
		)
	),
	s(
		"perf",
		fmt(
			[[
    PERF:
    ]],
			{}
		)
	),

	s(
		"note",
		fmt(
			[[
    NOTE:
    ]],
			{}
		)
	),
	s(
		"fix",
		fmt(
			[[
    FIX:
    ]],
			{}
		)
	),
	s(
		"gotcha",
		fmt(
			[[
    GOTCHA:
    ]],
			{}
		)
	),
})
ls.add_snippets("typescriptreact", {

	s("imr", fmt([[import React from 'react' ]], {})),
})
ls.add_snippets("typescript", {
	--comment
	-- s(
	-- 	"/",
	-- 	fmt(
	-- 		[[ /**
	-- *{}
	-- */]],
	-- 		{ i(0) }
	-- 	)
	-- ),
	-- declarations
	s(
		"c",
		fmt([[const {} = {} ]], {
			i(1, "name"),
			i(0, "value"),
		})
	),
	s(
		"l",
		fmt([[let {} = {} ]], {
			i(1, "name"),
			i(0, "value"),
		})
	),

	s(
		"cf",
		fmt([[const {} = ({}) =>{} ]], {
			i(1),
			i(2),
			i(0),
		})
	),
	s(
		"cfed",
		fmt(
			[[
    const {} = ({})=>{}

    


    export default {}
    ]],
			{
				i(1),
				i(2),
				i(0),
				rep(1),
			}
		)
	),
	s(
		"ced",
		fmt(
			[[
    const {} = {}


    export default {}
    ]],
			{
				i(1),
				i(0),
				rep(1),
			}
		)
	),
	s(
		"cl",
		fmt("console.log({})", {
			i(1),
		})
	),
	-- functions
	s(
		"fn",
		fmt(
			[[
                function {}({}) {{
                    {}
                }}
                ]],
			{
				i(1),
				i(2),
				i(0),
			}
		)
	),
	s(
		"gfn",
		fmt(
			[[
                function* {}({}){{
                    {}
                }}
                ]],
			{
				i(1),
				i(2),
				i(0),
			}
		)
	),
	s(
		"ef",
		fmt(
			[[export function {}(){{
            {}
        }}]],
			{
				i(1),
				i(0),
			}
		)
	),

	s(
		"edf",
		fmt(
			[[
        export default function {}({}){{
            {}
        }}
        ]],
			{
				i(1),
				i(2),
				i(0),
			}
		)
	),
	s(
		"ec",
		fmt(
			[[
    export const {} = {}
    ]],
			{
				i(1),
				i(0),
			}
		)
	),
	s(
		"ecf",
		fmt(
			[[
        export const {} = {} => {{
            {}
        }}
        ]],
			{
				i(1),
				i(2),
				i(0),
			}
		)
	),
	s(
		"edc",
		fmt(
			[[
        export default const {} = {} => {{
            {}
        }}
        ]],
			{
				i(1),
				i(2),
				i(0),
			}
		)
	),

	-- flow control
	s(
		"i",
		fmt(
			[[
                if ({}){{
                    {}
                }}
                ]],
			{
				i(1),
				i(0),
			}
		)
	),
	s(
		"el",
		fmt(
			[[
                else {{
                    {}
                }}
                ]],
			{
				i(0),
			}
		)
	),
	s(
		"ei",
		fmt(
			[[
                else if({}) {{
                    {}
                }}
                ]],
			{
				i(1),
				i(0),
			}
		)
	),
	s(
		"fo",
		fmt(
			[[
                for ( const {} of {} ){{
                    {}
                }}
                ]],
			{
				i(1),
				i(2),
				i(0),
			}
		)
	),
	s(
		"fod",
		fmt(
			[[
                for ( const [{},{}] of {} ){{
                    {}
                }}
                ]],
			{
				i(1, "k"),
				i(2, "v"),
				i(3),
				i(0),
			}
		)
	),
	s(
		"fi",
		fmt(
			[[
                for ( let {} in {} ){{
                    {}
                }}
                ]],
			{
				i(1),
				i(2),
				i(0),
			}
		)
	),
	s(
		"fl",
		fmt(
			[[
                for ( let {}={}; {} < {}; {}++) {{
                    {}
                }}
                ]],
			{
				i(1, "i"),
				i(2, "0"),
				rep(1),
				i(3),
				rep(1),
				i(0),
			}
		)
	),
	s(
		"wl",
		fmt(
			[[
                while ({}) {{
                    {}
                }}
                ]],
			{
				i(1, "condition"),
				i(0),
			}
		)
	),
	s(
		"do",
		fmt(
			[[
                do{{
                    {}
                }}while()
                ]],
			{
				i(0),
			}
		)
	),
	s(
		"te",
		fmt(
			[[
                {}? {} : {}
                ]],
			{
				i(1),
				i(2),
				i(0),
			}
		)
	),
	s(
		"map",
		fmt(
			[[
            {}.map(({})=>{})
        ]],
			{
				i(1, "iterable"),
				i(2, "item"),
				i(0, "iterable"),
			}
		)
	),
	s(
		"fe",
		fmt(
			[[
                {}.forEach(({})=>{})
                ]],
			{
				i(1, "iterable"),
				i(2, "item"),
				i(0, "iterable"),
			}
		)
	),
	s(
		"r",
		fmt([[ return ({}) ]], {
			i(0),
		})
	),
	s(
		"ro",
		fmt(
			[[
                return {{
                    {}
                }}
                ]],
			{
				i(0),
			}
		)
	),
	s(
		"ra",
		fmt(
			[[
                return [{}]
                ]],
			{
				i(0),
			}
		)
	),
	s(
		"rp",
		fmt(
			[[
                return new Promise((resolve, reject) =>}}
                    {}
                }})
                ]],
			{
				i(0),
			}
		)
	),
	s(
		"pt",
		fmt(
			[[
                {}.then(({})=>{})
                ]],
			{
				i(1, "promise"),
				i(2, "v"),
				i(0),
			}
		)
	),
	s(
		"nui",
		fmt(
			[[
                Number.parseInt({})
                ]],
			{
				i(0),
			}
		)
	),
	s(
		"im",
		fmt([[ import {} from '{}' ]], {
			i(0),
			i(1),
		})
	),
	s(
		"doc",
		fmt(
			[[
            /**
            * {}
            */
            ]],
			{
				i(0),
			}
		)
	),
	s(
		"param",
		fmt(
			[[
            @param {{{}}} {}  ]],
			{
				i(1),
				i(0),
			}
		)
	),
	s(
		"returns",
		fmt(
			[[
            @returns {{{}}} {}  ]],
			{
				i(1),
				i(0),
			}
		)
	),
	s(
		"cc",
		fmt(
			[[
        ({})=>{}
            ]],
			{
				i(1),
				i(0),
			}
		)
	),
	s(
		"trig",
		c(1, {
			t("Ugh boring, a text node"),
			t("ha H"),
			t("4 sd"),
		})
	),
})
ls.add_snippets("html", {
	s(
		"z",
		fmt(
			[[
    <!doctype html>
        <html>
            <head>
                <meta charset="utf-8" >
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>{}</title>
                <link rel="stylesheet" href="{}">
            </head>
            <body>
                {}
                <script src="{}"></script>
            </body>
        </html>
    </html>
    ]],
			{
				i(1, "title"),
				i(2, "styles.css"),
				i(0),
				i(3, "main.js"),
			}
		)
	),
})
ls.add_snippets("markdown", {
	s(
		"**",
		fmt(
			[[
    **{}**{}
    ]],
			{
				i(1),
				i(0),
			}
		)
	),
})
ls.filetype_extend("javascript", { "typescript" })
-- ls.filetype_extend("typescript", { "javascript" })
-- ls.filetype_extend("javascriptreact", { "javascript", "typescript" })
ls.filetype_extend("typescriptreact", { "typescript", "html" })

require("luasnip.loaders.from_vscode").lazy_load()
