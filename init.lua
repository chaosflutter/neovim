require("basic")
require("keybindings")
require("plugins")
require("colorscheme")
require("autocmds")

-- Plugins Config
require("plugin-config.nvim-tree")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.nvim-autopairs")
require("plugin-config.comment")
require("plugin-config.surround")

-- LSP
require("lsp.cmp")
require("lsp.ui")
require("lsp.null-ls")
