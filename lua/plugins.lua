local packer = require("packer")

packer.startup({
	function(use)
		-- Packer 可以管理自己本身
		use("wbthomason/packer.nvim")
		--------------------- colorschemes --------------------
		-- tokyonight
		use("folke/tokyonight.nvim")
		-- nord
		use("shaunsingh/nord.nvim")
		-- github copilot
		--use("github/copilot.vim")
		-- gruvbox
		use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
		-- nvim-tree (新增)
		use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
		-- lualine (新增)
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use("arkav/lualine-lsp-progress")
		-- telescope （新增）
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		-- treesitter （新增）
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    -- copilot
    use("github/copilot.vim")
		-- dashboard-nvim (新增)
		use({
			"glepnir/dashboard-nvim",
			event = "VimEnter",
			config = function()
				require("dashboard").setup({
					-- config
					theme = "doom",
					config = {
						header = {
							[[                                   ]],
							[[                                   ]],
							[[                                   ]],
							[[                                   ]],
							[[          ▀████▀▄▄              ▄█ ]],
							[[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
							[[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
							[[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
							[[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
							[[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
							[[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
							[[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
							[[   █   █  █      ▄▄           ▄▀   ]],
							[[   █   █  █      ▄▄           ▄▀   ]],
							[[   █   █  █      ▄▄           ▄▀   ]],
							[[   █   █  █      ▄▄           ▄▀   ]],
							[[                                   ]],
							[[                                   ]],
							[[                                   ]],
							[[                                   ]],
						},
						center = {
							{
								icon = "  ",
								desc = "Projects                            ",
								action = "Telescope projects",
								key = "b",
							},
							{
								icon = "  ",
								desc = "Recently files                      ",
								action = "Telescope oldfiles",
								key = "f",
							},
							{
								icon = "  ",
								desc = "Edit keybindings                    ",
								action = "edit ~/.config/nvim/lua/keybindings.lua",
								key = "d",
							},
						},
						footer = {
							"",
							"",
							"https://github.com/nshen/learn-neovim-lua",
						},
					},
				})
			end,
			requires = { "nvim-tree/nvim-web-devicons" },
		})
		-- project
		use("ahmedkhalf/project.nvim")
		-------------------- LSP -------------------
		use({ "williamboman/mason.nvim" })
		use({ "williamboman/mason-lspconfig.nvim" })
		use({ "neovim/nvim-lspconfig" })
		-- 补全引擎
		use("hrsh7th/nvim-cmp")
		-- snippet 引擎
		use("hrsh7th/vim-vsnip")
		-- 补全源
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

		-- 常见编程语言代码段
		use("rafamadriz/friendly-snippets")
		-- ui (新增)
		use("onsails/lspkind-nvim")
		use("tami5/lspsaga.nvim")
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
     -- surround
    use("ur4ltz/surround.nvim")
		-- Comment
		use("numToStr/Comment.nvim")
		-- nvim-autopairs
		use("windwp/nvim-autopairs")
	end,
	config = {
		-- 并发数限制
		max_jobs = 16,
		-- 自定义源
		git = {
			-- default_url_format = "https://hub.fastgit.xyz/%s",
			-- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
			-- default_url_format = "https://gitcode.net/mirrors/%s",
			-- default_url_format = "https://gitclone.com/github.com/%s",
		},
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
	vim.cmd,
	[[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
