local debugger_path = os.getenv("LUNARVIM_RUNTIME_DIR") .. "/site/pack/lazy/opt/vscode-js-debug"

require("dap-vscode-js").setup({
	node_path = "node",
	debugger_path = debugger_path,
	-- debugger_cmd = { "js-debug-adapter" },
	adapters = {
		"pwa-node",
		"pwa-chrome",
		"pwa-msedge",
		"node-terminal",
		"pwa-extensionHost",
		"pwa-node-ts",
	}, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript" }) do
	require("dap").configurations[language] = {
		-- inspiration from
		-- https://github.com/anasrar/.dotfiles/blob/48ba127aee8d5791de091a7e1757d681ca748b07/neovim/.config/nvim/lua/rin/DAP/languages/typescript.lua#L127-L137
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch Program (pwa-node with ts-node)",
			cwd = vim.fn.getcwd(),
			-- runtimeArgs = { "--loader", "ts-node/esm" },
			-- runtimeExecutable = "node",
			runtimeArgs = { "--esm" },
			runtimeExecutable = "ts-node",
			args = { "${file}" },
			sourceMaps = true,
			protocol = "inspector",
			skipFiles = { "<node_internals>/**", "node_modules/**" },
			resolveSourceMapLocations = {
				"${workspaceFolder}/**",
				"!**/node_modules/**",
			},
		},
	}
end

for _, language in ipairs({ "javascript" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Jest Tests",
			-- trace = true, -- include debugger info
			runtimeExecutable = "node",
			runtimeArgs = {
				"./node_modules/jest/bin/jest.js",
				"--runInBand",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
	}
end

for _, language in ipairs({ "typescriptreact", "javascriptreact" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-chrome",
			name = "Attach - Remote Debugging",
			request = "attach",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			port = 9222,
			webRoot = "${workspaceFolder}",
		},
		{
			type = "pwa-chrome",
			name = "Launch Chrome",
			request = "launch",
			url = "http://localhost:3000",
		},
	}
end
