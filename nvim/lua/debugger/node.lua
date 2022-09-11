--https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim-lua-config/.config/nvim/lua/theprimeagen/debugger/node.lua
local home = os.getenv("HOME")
local dap = require("dap")

-- dap.adapters.node2 = {
-- 	type = "executable",
-- 	command = "node",
-- 	args = { home .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
-- }

require("dap-vscode-js").setup({
	-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
	-- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

dap.configurations.javascript = {
	{
		-- name = "Launch",
		-- type = "node2",
		-- request = "launch",
		-- program = "${file}",
		-- cwd = vim.fn.getcwd(),
		-- sourceMaps = true,
		-- protocol = "inspector",
		-- console = "integratedTerminal",
		--
		type = "pwa-node",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		-- sourceMaps = true,
		console = "integratedTerminal",
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		-- name = "Attach to process",
		-- type = "node2",
		-- request = "attach",
		-- processId = require("dap.utils").pick_process,
		--
		type = "pwa-node",
		request = "attach",
		name = "Attach",
		processId = require("dap.utils").pick_process,
		cwd = "${workspaceFolder}",
	},
	-- {
	-- 	name = "Main",
	-- 	type = "pwa-node",
	-- 	request = "launch",
	-- 	cwd = "${workspaceFolder}",
	-- 	runtimeExecutable = "${workspaceFolder}/node_modules/.bin/electron",
	-- 	windows = {
	-- 		runtimeExecutable = "${workspaceFolder}/node_modules/.bin/electron.cmd",
	-- 	},
	-- 	args = { ".", "--remote-debugging-port=9222" },
	-- 	outputCapture = "std",
	-- 	console = "integratedTerminal",
	-- },
}

dap.configurations.typescript = {
	{
		-- /Users/kimtewan/.nvm/versions/node/v16.15.0/lib/node_modules/ts-node/register/
		-- name = "ts-node (Node2 with ts-node)",
		-- type = "node2",
		-- request = "launch",
		-- cwd = vim.loop.cwd(),
		-- runtimeArgs = { "-r", "/Users/kimtewan/.nvm/versions/node/v16.15.0/lib/node_modules/ts-node/register/" },
		-- runtimeExecutable = "node",
		-- args = { "--inspect", "${file}" },
		-- sourceMaps = true,
		-- skipFiles = { "<node_internals>/**", "node_modules/**" },
		--
		--
		name = "ts-node (Node2 with ts-node)",
		type = "pwa-node",
		request = "launch",
		cwd = vim.loop.cwd(),
		runtimeArgs = { "-r", "/Users/kimtewan/.nvm/versions/node/v16.15.0/lib/node_modules/ts-node/register/" },
		-- runtimeArgs = { "-r", "ts-node/register" },
		runtimeExecutable = "node",
		args = { "--inspect", "${file}" },
		-- sourceMaps = false,
		skipFiles = { "<node_internals>/**", "node_modules/**" },
	},
	-- {
	-- 	name = "Jest (Node2 with ts-node)",
	-- 	type = "node2",
	-- 	request = "launch",
	-- 	cwd = vim.loop.cwd(),
	-- 	runtimeArgs = { "--inspect-brk", "${workspaceFolder}/node_modules/.bin/jest" },
	-- 	runtimeExecutable = "node",
	-- 	args = { "${file}", "--runInBand", "--coverage", "false" },
	-- 	sourceMaps = true,
	-- 	port = 9229,
	-- 	skipFiles = { "<node_internals>/**", "node_modules/**" },
	-- },
	--
	-- {
	-- 	name = "Main",
	-- 	type = "pwa-node",
	-- 	request = "launch",
	-- 	cwd = "${workspaceFolder}",
	-- 	runtimeExecutable = "${workspaceFolder}/node_modules/.bin/electron",
	-- 	windows = {
	-- 		runtimeExecutable = "${workspaceFolder}/node_modules/.bin/electron.cmd",
	-- 	},
	-- 	args = { ".", "--remote-debugging-port=9222" },
	-- 	outputCapture = "std",
	-- 	console = "integratedTerminal",
	-- },
}
