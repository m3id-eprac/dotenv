local lualine = require("lualine")
local colors = require("utils.colors.colors")

local gruvbox = require("utils.colors.gruvbox_material_palette")
local fg1 = gruvbox.fg1
local fg2 = gruvbox.fg2
local bg1 = gruvbox.bg1

local bubbles_theme = {
    normal = {
        a = { fg = fg1.fg2 },
        b = { fg = colors.white },
        c = { fg = colors.white },
    },
    insert = {
        -- a = { fg = colors.gruvbox_bright_blue, gui = "bold" },
        a = { fg = fg1.blue },
        b = { fg = colors.white },
        c = { fg = colors.white },
    },
    visual = {
        a = { fg = fg1.bright_orange },
        b = { fg = colors.white },
        c = { fg = colors.white },
    },
    replace = {
        a = { fg = colors.green, gui = "bold" },
        b = { fg = colors.white },
        c = { fg = colors.white },
    },
    command = {
        a = { fg = colors.orange, gui = "bold" },
        b = { fg = colors.white },
        c = { fg = colors.white },
    },
    inactive = {
        a = { fg = colors.gray, gui = "bold" },
        b = { fg = colors.white },
        c = { fg = colors.gruvbox_neural_green, bg = colors.gruvbox_dark1 },
    },
}
local function bar()
    return "▊"
end

-- local function lspCheck()
-- 	local msg = "No Active Lsp"
-- 	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
-- 	local clients = vim.lsp.get_active_clients()
-- 	if next(clients) == nil then
-- 		return msg
-- 	end
-- 	for _, client in ipairs(clients) do
-- 		local filetypes = client.config.filetypes
-- 		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
-- 			return client.name
-- 		end
-- 	end
-- 	return msg
-- end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = bubbles_theme,
        -- theme = "gruvbox-material",
        --
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
        always_divide_middle = true,
        fmt = string.lower,
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            {
                bar,
                color = { fg = bg1.bg3 },
                padding = { left = 0, right = 1 },
            },
            {
                "mode",
                padding = { left = 0, right = 0 },
                --fmt = function(str)
                --		--return str:sub(1, 2)
                --	return str.lower
                --	end,
            },
        },
        lualine_b = {
            --{ "filename", padding = { left = 1, right = 0 } },
            { "branch", color = { fg = fg1.aqua } },
            "diff",
        },
        lualine_c = {
            "%=",
            --{ lspCheck, color = { fg = colors.springGreen, gui = "italic,bold" } },
            { "filename", path = 1, color = { fg = fg1.orange }, fmt = string.upper },
        },
        lualine_x = {},
        lualine_y = {
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                sections = { "error", "warn", "info", "hint" },
                -- diagnostics_color = {

                -- 	-- Same values as the general color option can be used here.
                -- 	error = "#EA6962", -- Changes diagnostics' error color.
                -- 	warn = "#E78A4E", -- Changes diagnostics' warn color.
                -- 	info = "#89B482", -- Changes diagnostics' info color.
                -- 	hint = "#7DAEA3", -- Changes diagnostics' hint color.
                -- },
                -- sections = { "error", "warn" },
                symbols = { error = "", warn = "", info = "", hint = "" },
                colored = true,
                always_visible = true,
            },
        },
        lualine_z = {
            { "progress", padding = { left = 0, right = 0 } },
            { "location", padding = { left = 1, right = 0 } },
            {
                bar,
                color = { fg = bg1.bg3 },
                padding = { right = 0, left = 1 },
            },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "%=", "filename", "location" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
