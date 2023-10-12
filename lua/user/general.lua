-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true -- false by default
lvim.colorscheme = "lunar"

local opts = {}
require("lvim.lsp.manager").setup("tailwindcss", opts)

-- lvim.builtin.cmp.formatting = {
-- 	format = require("tailwindcss-colorizer-cmp").formatter,
-- }
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
