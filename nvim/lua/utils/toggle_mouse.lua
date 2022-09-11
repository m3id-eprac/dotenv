local ToggleMouse = function()
	-- print(vim.api.nvim_get_option("mouse"))
	local curret_mouse_state = vim.api.nvim_get_option("mouse")
	if curret_mouse_state == "a" then
		vim.opt.mouse = ""
		print("Mouse Off")
	else
		vim.opt.mouse = "a"
		print("Mouse On")
	end
end
return ToggleMouse
