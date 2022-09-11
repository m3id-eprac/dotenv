local dap = require("dap")
local dapui = require("dapui")
local daptext = require("nvim-dap-virtual-text")

local remap = require("utils.keymap")
local nnoremap = remap.nnoremap

daptext.setup()
dapui.setup({
	layouts = {
		-- {
		-- 	elements = {
		-- 		"console",
		-- 	},
		-- 	size = 7,
		-- 	position = "bottom",
		-- },
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				"repl",
				-- "console",
			},
			size = 10,
			position = "bottom",
		},
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

require("debugger.node")

nnoremap("<Home>", function()
	dap.continue()
end)

nnoremap("<End>", function()
	dap.disconnect()
end)
nnoremap("<leader>bb", function()
	dap.toggle_breakpoint()
end)

nnoremap("<leader>bc", function()
	dap.run_to_cursor()
end)

nnoremap("<leader>ds", function()
	-- dap.repl.toggle()
    dapui.toggle(1)
end)
nnoremap("<leader>dr", function()
	-- dap.repl.toggle()
    dapui.toggle(2)
end)

nnoremap("<leader>dl", function()
	dap.run_last()
end)

nnoremap("<leader>dc", function()
	dap.clear_breakpoints()
end)

nnoremap("<leader>bt", function()
	dap.terminate()
end)

nnoremap("<Down>", function()
	dap.step_over()
end)
nnoremap("<PageUp>", function()
	dap.step_into()
end)
nnoremap("<PageDown>", function()
	dap.step_out()
end)

-- nnoremap("<Home>", function()
-- 	dapui.toggle(1)
-- end)
-- nnoremap("<End>", function()
-- 	dapui.toggle(2)
-- end)
-- nnoremap("<leader>dc", function()
-- 	dap.close()
-- end)
-- nnoremap("<Up>", function()
-- 	dap.continue()
-- end)
-- nnoremap("<Down>", function()
-- 	dap.step_over()
-- end)
-- nnoremap("<Right>", function()
-- 	dap.step_into()
-- end)
-- nnoremap("<Left>", function()
-- 	dap.step_out()
-- end)
--
-- nnoremap("<leader>b", function()
-- 	dap.toggle_breakpoint()
-- end)
--
-- -- nnoremap('<leader>rc',function()dap.run_to_cursor()end)
-- nnoremap("<leader>ro", function()
-- 	dap.repl_open()
-- end)
