--######################### LAZY.NVIM #######################
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
--###################################################
-----=====##### initialize lazy.nvim #####=====------
require("lazy").setup({
	install = {
		missing = true,
	},
	checker = {
		enabled = false,
		notify = false,
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},

	-----=====##### Color schemes, one of this: catppuccin, onedark. Check colors.lua
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = true,
		lazy = false,
		-- "joshdick/onedark.vim"
	},

	-----=====##### horizontal jumping
	{
		"phaazon/hop.nvim",
		lazy = true,
	},

	-----=====##### File manager Neotree
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = true,
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	-----=====##### Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		lazy = false,
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	{
		"folke/lazydev.nvim",
		-- "folke/neodev.nvim",
	},
	-----=====##### Mason
	{
		"williamboman/mason.nvim",
		optional = true,
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "codelldb" })
		end,
	},
	-----=====##### LSP ################################################################
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		lazy = false,
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
			},
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		lazy = false,
	},
	{
		"Saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		opts = {
			completion = {
				cmp = { enabled = true },
			},
		},
	},
	----------------- LSP old config
	-- {
	-- 	"VonHeikemen/lsp-zero.nvim",
	-- 	branch = "v2.x",
	-- 	lazy = false,
	-- 	dependencies = {
	-- 		-- LSP Support
	-- 		{ "neovim/nvim-lspconfig" }, -- Required
	-- 		{
	-- 			-- Optional
	-- 			"williamboman/mason.nvim",
	-- 		},
	-- 		-- Autocompletion
	-- 		{ "hrsh7th/nvim-cmp" }, -- Required
	-- 		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
	-- 		{ "L3MON4D3/LuaSnip" }, -- Required
	-- 	},
	-- },
	-- {
	-- 	"simrat39/inlay-hints.nvim",
	-- 	lazy = true,
	-- 	-- enabled = true,
	-- },
	-- {
	-- 	"simrat39/rust-tools.nvim",
	-- 	lazy = true,
	-- 	enabled = true,
	-- 	dependencies = {
	-- 		"catppuccin/nvim",
	-- 		"simrat39/inlay-hints.nvim",
	-- 	},
	-- },
	-- {
	-- 	"saecki/crates.nvim",
	-- 	lazy = true,
	-- 	tag = "stable",
	-- 	event = { "BufRead Cargo.toml" },
	-- 	config = function()
	-- 		require("crates").setup()
	-- 	end,
	-- },

	-----=====##### CMP plugins series
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "onsails/lspkind.nvim" },
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		},
		event = "InsertEnter",
	},
	-----=====##### Null-LS
	--TODO: Setup null-ls
	{
		"jose-elias-alvarez/null-ls.nvim",
		lazy = false,
	},
	-----=====##### Async
	{
		"nvim-neotest/nvim-nio",
	},
	-----=====##### DAP nvim-dap
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			-- fancy UI for the debugger
			"rcarriga/nvim-dap-ui",
			dependencies = { "nvim-neotest/nvim-nio" },
			-- virtual text for the debugger
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = "mason.nvim",
				cmd = { "DapInstall", "DapUninstall" },
				opts = {
					-- Makes a best effort to setup the various debuggers with
					-- reasonable debug configurations
					automatic_installation = true,

					-- You can provide additional configuration to the handlers,
					-- see mason-nvim-dap README for more information
					handlers = {},

					-- You'll need to check that you have the required things installed
					-- online, please don't ask me how to install them :)
					ensure_installed = {
						-- Update this to ensure that you have the debuggers for the langs you want
					},
				},
			},
			{
				"jbyuki/one-small-step-for-vimkind",
				config = function()
					local dap = require("dap")
					dap.adapters.nlua = function(callback, conf)
						local adapter = {
							type = "server",
							host = conf.host or "127.0.0.1",
							port = conf.port or 8086,
						}
						if conf.start_neovim then
							local dap_run = dap.run
							dap.run = function(c)
								adapter.port = c.port
								adapter.host = c.host
							end
							require("osv").run_this()
							dap.run = dap_run
						end
						callback(adapter)
					end
					dap.configurations.lua = {
						{
							type = "nlua",
							request = "attach",
							name = "Run this file",
							start_neovim = {},
						},
						{
							type = "nlua",
							request = "attach",
							name = "Attach to running Neovim instance (port = 8086)",
							port = 8086,
						},
					}
				end,
			},
		},
	},
	-----=====##### Trouble list
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		lazy = true,
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	-----=====##### Telescope
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		version = false,
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"jvgrootveld/telescope-zoxide",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
			"debugloop/telescope-undo.nvim",
			"nvim-telescope/telescope-dap.nvim",
		},
	},
	-----=====##### Navigator with TMUX
	{
		"numToStr/Navigator.nvim",
	},
	-----=====##### Comment lines&blocks
	{
		"numToStr/Comment.nvim",
	},
	-----=====##### Buffer line (indicators)
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	------=====##### Dashboard
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	------=====##### Git fugitive and flog(branch viewer)
	{
		"tpope/vim-fugitive",
		"rbong/vim-flog",
		lazy = true,
	},
	-------=====##### Gitsigns
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
	},
	-------=====##### Lazygit
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-------=====##### ToggleTerm - float terminal
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		version = "*",
		opts = {
			size = 20,
			open_mapping = [[<c-t>]],
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			persist_size = false,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		},
	},
	-----=====##### Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	-----=====##### Which key
	{
		"folke/which-key.nvim",
		lazy = true,
		config = function(_, opts)
			local which_key = require("which-key")
			which_key.setup(opts)
			which_key.register(require("core.which_key_defaults"), {
				mode = "n",
				prefix = "<leader>",
			})
			which_key.register(require("core.which_key_non_leader"))
		end,
	},
	-----=====##### Undotree
	{
		"mbbill/undotree",
	},
	-----=====##### LSP progress
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
	},
	-----=====##### Search & Replace text
	{
		"nvim-pack/nvim-spectre",
		lazy = true,
	},
	-----=====##### Pairs
	{
		"echasnovski/mini.pairs",
		lazy = true,
		config = function(_, opts)
			require("mini.pairs").setup(opts)
		end,
	},
	-----=====##### Surrounding pairs nvim-surround
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
	},
	-----=====##### Vertical static block lines indent-blackline
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl", --:help ibl.config
		opts = {
			indent = {
				char = "┊", -- ┊ │ ▏
			},
			scope = {
				enabled = false,
				show_start = false,
				show_end = false,
			},
			exclude = {
				filetypes = {},
				buftypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "terminal", "Glance" },
			},
		},
	},
	-----=====##### Vertical animated block lines
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			symbol = "│", -- ┊ │ ▏
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason", "Glance" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},
	-----=====##### Highlighting all words as under cursor
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = { delay = 200 },
		lazy = false,
		config = function(_, opts)
			require("illuminate").configure(opts)

			local function map(key, dir, buffer)
				vim.keymap.set("n", key, function()
					require("illuminate")["goto_" .. dir .. "_reference"](false)
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
			end

			map("]]", "next")
			map("[[", "prev")

			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					map("]]", "next", buffer)
					map("[[", "prev", buffer)
				end,
			})
		end,
		keys = {
			{ "]]", desc = "Next Reference" },
			{ "[[", desc = "Prev Reference" },
		},
	},
	-----=====##### TODO lists in telescope & trouble
	{
		"folke/todo-comments.nvim",
		lazy = true,
		enabled = true,
		dependencies = "nvim-lua/plenary.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost", "BufNewFile" },
	},
	-----=====##### Smooth scroll
	{
		"karb94/neoscroll.nvim",
		lazy = true,
	},
	-----=====##### Nvim sessions
	{
		"olimorris/persisted.nvim",
		config = true,
	},
	-----=====##### Glance - Useful reference window
	{
		"dnlhc/glance.nvim",
		lazy = true,
	},
	-----=====##### LF File manager
	{
		"lmburns/lf.nvim",
		lazy = true,
		cmd = "Lf",
		dependencies = {
			"akinsho/toggleterm.nvim",
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<C-f>", "<cmd>Lf<cr>", desc = "Lf" },
		},
	},
	-----=====##### Yazi File manager
	{
		"mikavilpas/yazi.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<C-y>",
				function()
					-- open file location:
					require("yazi").yazi()
					-- open pwd:
					-- require("yazi").yazi(nil, vim.fn.getcwd())
				end,
				desc = "Yazi",
			},
		},
	},
	-----=====##### Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
})
