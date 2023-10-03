-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
	--"sumneko_lua",
	-- "json",
}
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)
-- added on 2023/09/22 to fix `css: @unknown rule` in css files
-- https://www.reddit.com/r/lunarvim/comments/w50jfk/need_help_with_fixing_unknown_at_rules_in_css/https://www.reddit.com/r/lunarvim/comments/w50jfk/need_help_with_fixing_unknown_at_rules_in_css/
require("lvim.lsp.manager").setup("cssls", {
	settings = {
		css = { validate = true, lint = {
			unknownAtRules = "ignore",
		} },
		scss = { validate = true, lint = {
			unknownAtRules = "ignore",
		} },
		less = { validate = true, lint = {
			unknownAtRules = "ignore",
		} },
	},
})
-- end of addition of 2023/09/22

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "black", filetypes = { "python" } },
	--   { command = "isort", filetypes = { "python" } },
	{
		command = "eslint_d",
		sources = { formatters.eslint_d }, -- added 20230216
	},
	{
		--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
		command = "prettierd", -- changed from 'prettier' to 'prettierd' on 20230924
		--     ---@usage arguments to pass to the formatter
		--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
		--     extra_args = { "--print-with", "100" },
		--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }, -- uncommented on 20230628
		-- disabled_filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }, -- commented on 20230628
	},
	{ command = "stylua", filetypes = { "lua" } },
	{ command = "phpcsfixer", filetypes = { "php" } }, -- added on 20230521
})

-- added on 2022/08/26 to remove info on JS files about CommonJS
require("lspconfig").tsserver.setup({
	on_attach = function(client, bufnr)
		require("nvim-lsp-ts-utils").setup({
			filter_out_diagnostics_by_code = { 80001, 6133 },
		})
		-- the 3 lines below (commented out) have been added 20230216 - if not used, delete them
		client.server_capabilities.document_formatting = false
		local settings = { format = { enable = false } }
		settings.format.enable = false
		require("nvim-lsp-ts-utils").setup_client(client)
	end,
	-- only use tsserver for typescript files
	-- filetypes = { "typescript", "typescriptreact", "typescript.tsx" }, -- uncommented 20230628
})

-- added on 2022/08/26 - disable all hints in typescript
-- require('lspconfig').tsserver.setup({
--   init_options = {
--     preferences = {
--       disableSuggestions = true,
--     }
--   },
-- })

-- -- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "flake8", filetypes = { "python" } },
	--   {
	--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
	--     command = "shellcheck",
	--     ---@usage arguments to pass to the formatter
	--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
	--     extra_args = { "--severity", "warning" },
	--   },
	--   {
	--     command = "codespell",
	--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
	--     filetypes = { "javascript", "python" },
	--   },
	{ command = "eslint_d", sources = { linters.eslint_d } },
	{ command = "php", filetypes = { "php" } }, -- added on 20230521
})

-- -- set additional code actions
local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
	{
		command = "eslint_d",
		-- exe = "eslint_d",
		sources = { code_actions.eslint_d }, -- added 20230128
		-- filetypes = { "javascript", "javascriptreact" } -- added 20230128
	},
})

-- Example using a list of specs with the default options
--vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

-- require("lazy").setup({
--	"folke/which-key.nvim",
--	{ "folke/neoconf.nvim", cmd = "Neoconf" },
--	"folke/neodev.nvim",
-- })
