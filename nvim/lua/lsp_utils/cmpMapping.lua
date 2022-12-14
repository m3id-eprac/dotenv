local cmp     = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmpKeyMap = {
	["<C-p>"]     = cmp.mapping.select_prev_item(),
	["<C-n>"]     = cmp.mapping.select_next_item(),
	["<C-d>"]     = cmp.mapping.scroll_docs(-4),
	["<C-f>"]     = cmp.mapping.scroll_docs(4),
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-e>"]     = cmp.mapping({
		i = cmp.mapping.abort(),
		c = cmp.mapping.close(),
	}),
	-- ["<Space>"] = cmp.mapping({
	-- 	i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
	-- 	c = function(fallback)
	-- 		if cmp.visible() then
	-- 			cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
	-- 		else
	-- 			fallback()
	-- 		end
	-- 	end,
	-- }),
	-- ["<CR>"] = cmp.mapping.confirm({ select =false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	["<CR>"] = cmp.mapping.confirm({ select =false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	-- ["<CR>"] = cmp.mapping({
	-- 	i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
	-- 	c = function(fallback)
	-- 		if cmp.visible() then
	-- 			cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
	-- 		else
	-- 			fallback()
	-- 		end
	-- 	end,
	-- }),
	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
			-- elseif luasnip.expand_or_locally_jumpable() then
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		elseif has_words_before() then
			cmp.complete()
		else
			fallback()
		end
	end, { "i", "s" }),
	["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }),
}

return cmpKeyMap
