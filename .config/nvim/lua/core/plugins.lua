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
		enabled = true,
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

	--TODO: lazy={true,false} for all plugins

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
	},

	-----=====##### File manager Neotree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		event = "VeryLazy",
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
				-- build = ":MasonUpdate",
			},
			-- { 'williamboman/mason-lspconfig.nvim' },       -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	},
	{
		"simrat39/inlay-hints.nvim",
		lazy = false,
		-- enabled = true,
	},
	{
		"simrat39/rust-tools.nvim",
		lazy = false,
		enabled = true,
		dependencies = {
			"catppuccin/nvim",
			"simrat39/inlay-hints.nvim",
		},
	},
	{
		"saecki/crates.nvim",
		version = "v0.3.0",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-----=====##### Mason
	-- {
	-- 	"williamboman/mason.nvim",
	-- 	build = ":MasonUpdate", -- :MasonUpdate updates registry contents
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
	-----=====##### DAP nvim-dap
	{
		"mfussenegger/nvim-dap",
		lazy = false,
		enabled = true,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-telescope/telescope-dap.nvim",
			-- "jay-babu/mason-nvim-dap.nvim",
			"folke/neodev.nvim",
		},
	},
	-----=====##### Trouble list
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		lazy = true,
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
	-----=====##### Buffer line
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	------=====##### Dashboard
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-------=====##### Gitsigns
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
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
		event = "VeryLazy",
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
	},
	-----=====##### Mini indentscope
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		--TODO
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},
	-----=====##### Search & Replace text
	{
		"nvim-pack/nvim-spectre",
	},
	-----=====##### Pairs
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.pairs").setup(opts)
		end,
	},
	-----=====##### Surrounding pairs nvim-surround
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
	},
	-----=====##### Vertical block lines indent-blackline
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		enabled = true,
		opts = {
			-- char = "▏",
			char = "│",
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
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
		enabled = true,
		dependencies = "nvim-lua/plenary.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost", "BufNewFile" },
	},
	-----=====##### Smooth scroll
	{
		"karb94/neoscroll.nvim",
	},
	-----=====##### Nvim sessions
	{
		"olimorris/persisted.nvim",
		config = true,
	},
})
