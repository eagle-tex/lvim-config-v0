-- Additional Plugins
lvim.plugins = {
	{
		"aca/emmet-ls",
		config = function()
			local lspconfig = require("lspconfig")
			local configs = require("lspconfig/configs")

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities.textDocument.completion.completionItem.resolveSupport = {
				properties = {
					"documentation",
					"detail",
					"additionalTextEdits",
				},
			}

			if not lspconfig.emmet_ls then
				configs.emmet_ls = {
					default_config = {
						cmd = { "emmet-ls", "--stdio" },
						filetypes = {
							"html",
							"css",
							"javascript",
							"typescript",
							"eruby",
							"typescriptreact",
							"javascriptreact",
							"svelte",
							"vue",
						},
						root_dir = function(_) -- replaced fname with _
							return vim.loop.cwd()
						end,
						settings = {},
					},
				}
			end
			lspconfig.emmet_ls.setup({ capabilities = capabilities })
		end,
	},
	--{ "bluz71/vim-nightfly-colors" },
	--{ "bluz71/vim-moonfly-colors" },
	--{ "catppuccin/nvim" },
	--{ "ChristianChiarulli/nvcode-color-schemes.vim" },
	{ "cpea2506/one_monokai.nvim" },
	-- add vscode-es7-javascript-react-snippets - 20230212
	-- { "dsznajder/vscode-es7-javascript-react-snippets",
	--     run = "yarn install --frozen-lockfile && yarn compile"
	-- },
	{ "dracula/vim" },
	--{ "EdenEast/nightfox.nvim" },
	{
		"ethanholz/nvim-lastplace",
		event = "BufRead",
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = {
					"gitcommit",
					"gitrebase",
					"svn",
					"hgcommit",
				},
				lastplace_open_folds = true,
			})
		end,
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		--module = "persistence",
		config = function()
			require("persistence").setup({
				dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
				options = { "buffers", "curdir", "tabpages", "winsize" },
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{ "ggandor/lightspeed.nvim" },
	{ "glepnir/zephyr-nvim" },
	{ "gpanders/editorconfig.nvim" },
	{ "grvcoelho/vim-javascript-snippets" },

	{
		"jay-babu/mason-nvim-dap.nvim",
		-- overrides `require("mason-nvim-dap").setup(...)`
		opts = function(_, opts)
			-- add more things to the ensure_installed table protecting against community packs modifying it
			-- opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
			opts.ensure_installed = {
				"bash-debug-adapter",
				"chrome-debug-adapter",
				"cpptools",
				"java-debug-adapter",
				"js",
				"node-debug2-adapter",
				"python",
				"ts",
			}
		end,
	},

	{ "jim-at-jibba/ariake-vim-colors" },

	-- added on 2022/08/26 - required by tsserver
	{ "jose-elias-alvarez/nvim-lsp-ts-utils" },

	{ "justinmk/vim-sneak" },
	-- nvim-bqf -- added on 20230119
	{
		"kevinhwang91/nvim-bqf",
		event = { "BufRead", "BufNew" },
		config = function()
			require("bqf").setup({
				auto_enable = true,
				preview = {
					win_height = 12,
					win_vheight = 12,
					delay_syntax = 80,
					border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
				},
				func_map = {
					vsplit = "",
					ptogglemode = "z,",
					stoggleup = "",
				},
				filter = {
					fzf = {
						action_for = { ["ctrl-s"] = "split" },
						extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
					},
				},
			})
		end,
	},
	{ "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },
	-- indent-blankline (indentation guides for every line)
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		init = function()
			vim.g.indentLine_enabled = 1
			vim.g.indent_blankline_char = "▏"
			vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
			vim.g.indent_blankline_buftype_exclude = { "terminal" }
			vim.g.indent_blankline_show_trailing_blankline_indent = false
			vim.g.indent_blankline_show_first_indent_level = false
		end,
	},
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup({
				mapping = { "jk", "jj" }, -- a table with mappings to use
				timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
				clear_empty_lines = false, -- clear line after escaping if there is only whitespace
				keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
				-- example(recommended)
				-- keys = function()
				--   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
				-- end,
			})
		end,
	},
	-- codi.vim (interactive scratchpad for hackers)
	{
		"metakirby5/codi.vim",
		cmd = "Codi",
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "rcarriga/nvim-dap-ui" },
			{ "theHamsta/nvim-dap-virtual-text", config = true },
		},
	},
	-- { "mxsdev/nvim-dap-vscode-js" },
	{
		"microsoft/vscode-js-debug",
		lazy = true,
		build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	},
	{ "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } },
	{
		"oberblastmeister/neuron.nvim",
		config = function()
			require("neuron").setup({
				virtual_titles = true,
				mappings = true,
				run = nil, -- function to run when in neuron dir
				neuron_dir = "~/neuron", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
				leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
			})
		end,
	},
	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},
	-- nvim-colorizer (color highlighter)
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes,
				names = true, -- "Name" codes like Blue
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				-- Available modes: foreground, background
				mode = "background", -- Set the display mode
			})
		end,
	},

	{
		"oberblastmeister/neuron.nvim",
		config = function()
			require("neuron").setup({
				virtual_titles = true,
				mappings = true,
				run = nil, -- function to run when in neuron dir
				neuron_dir = "~/neuron", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
				leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
			})
		end,
	},
	{ "olimorris/onedarkpro.nvim" },
	{ "projekt0n/github-nvim-theme" },

	-- nvim-ts-rainbow (rainbow parentheses)
	{
		"p00f/nvim-ts-rainbow",
	},

	-- { 'rafamadriz/friendly-snippets' },
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").on_attach()
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	-- { "sainnhe/edge" },
	-- { "sainnhe/gruvbox-material" },
	{ "sainnhe/sonokai" },
	{ "tanvirtin/monokai.nvim" },
	{ "Th3Whit3Wolf/one-nvim" },
	-- vim-surround (mappings to delete, change and add surroundings)
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		-- config = function()
		-- end,
	},
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 25, -- Height of the floating window
				default_mappings = false, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				-- You can use "default_mappings = true" setup option
				-- Or explicitly set keybindings
				-- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
				-- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
				-- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
			})
		end,
	},
	-- diffview -- added on 20230119
	{
		"sindrets/diffview.nvim",
		event = "BufRead",
	},
	{
		"simrat39/symbols-outline.nvim",
		opts = {},
	},
	{
		"stevearc/dressing.nvim",
		opts = {
			input = { enabled = false },
		},
	},
	{
		"tpope/vim-surround",
		keys = { "c", "d", "y" },
		config = function()
			vim.cmd("nmap ds       <Plug>Dsurround")
			vim.cmd("nmap cs       <Plug>Csurround")
			vim.cmd("nmap cS       <Plug>CSurround")
			vim.cmd("nmap ys       <Plug>Ysurround")
			vim.cmd("nmap yS       <Plug>YSurround")
			vim.cmd("nmap yss      <Plug>Yssurround")
			vim.cmd("nmap ySs      <Plug>YSsurround")
			vim.cmd("nmap ySS      <Plug>YSsurround")
			vim.cmd("xmap gs       <Plug>VSurround")
			vim.cmd("xmap gS       <Plug>VgSurround")
		end,
		-- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
		init = function()
			vim.o.timeoutlen = 500 -- 1000
		end,
	},
	{
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			require("spectre").setup()
		end,
	},
	-- nvim-ts-autotag (autoclose and autorename html tags)
	{
		"windwp/nvim-ts-autotag",
		-- event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}
