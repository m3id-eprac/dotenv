-- local M = {}
local hl = function(thing, opts)
	vim.api.nvim_set_hl(0, thing, opts)
end

-- function bind()
-- 	return function(thing, opts)
-- 		vim.api.nvim_set_hl(0, thing, opts)
-- 	end
-- end
-- M.hl = bind()

return hl
