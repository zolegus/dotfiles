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
    --TODO: lazy={true,false} for all plugins
	-----=====##### Color schemes, one of this: catppuccin, onedark. Check colors.lua
	{
        "catppuccin/nvim", name = "catppuccin", enabled = true, lazy = false,
	    -- "joshdick/onedark.vim" 
    },

	-----=====##### horizontal jumping
	{
        'phaazon/hop.nvim'
    },

	-----=====##### File manager Neotree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"s1n7ax/nvim-window-picker", -- if you want to use the commands with "_with_window_picker" suffix
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
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        lazy = false,
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },       -- Required
            {
                -- Optional
                "williamboman/mason.nvim",
                build = ":MasonUpdate",
            },
            { 'williamboman/mason-lspconfig.nvim' },       -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },           -- Required
            { 'hrsh7th/cmp-nvim-lsp' },       -- Required
            { 'L3MON4D3/LuaSnip' },           -- Required

            { 'onsails/lspkind.nvim' },
        },
	},
    {
        'simrat39/inlay-hints.nvim',
    },
    {
        "simrat39/rust-tools.nvim",
        lazy = false,
        enabled = true,
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
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	-----=====##### Null-LS
	{
		"jose-elias-alvarez/null-ls.nvim",
        lazy = false,
	},

	-----=====##### Telescope
	{
		"nvim-telescope/telescope.nvim",
        cmd = 'Telescope',
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
	-----=====##### Comment lines
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
			-- "linrongbin16/lsp-progress.nvim",
            -- "nvm-lua/lsp-status.nvim",
		},
	},
	-----=====##### Undotree
	{
		"mbbill/undotree",
	},

	-----=====##### LSP progress
	-- {
	-- 	"linrongbin16/lsp-progress.nvim",
    --        dependencies = { 
    --            'nvim-tree/nvim-web-devicons' 
    --        },
	-- },
	-----=====##### LSP progress
	{
        "j-hui/fidget.nvim"
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
           'nvim-pack/nvim-spectre'
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
})
