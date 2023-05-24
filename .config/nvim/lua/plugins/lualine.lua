require("lualine").setup({
	options = {
		theme = "auto", --"gruvbox-material",
		icons_enabled = true,
		section_separators = "",
		component_separators = "",
		disabled_filetypes = {
			statusline = {
				"help",
				"startify",
				"dashboard",
				"neo-tree",
				"packer",
				"neogitstatus",
				"NvimTree",
				"Trouble",
				"alpha",
				"lir",
				"Outline",
				"spectre_panel",
				"toggleterm",
				"qf",
			},
			winbar = {},
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = {
			-- "filename",
			{
				"filetype",
				icon_only = true,
				separator = "",
				padding = {
					left = 1,
					right = 0,
				},
			},
			{
				"filename",
				path = 1,
				symbols = {
					modified = "  ",
					readonly = "",
					unnamed = "",
				},
			},
			{
				"diagnostics",
				sources = { "nvim_lsp" },
				symbols = { error = " ", warn = " ", info = " " },
			},
		},
		lualine_x = {
            -- {
            --     require("lsp-progress").progress,
            --     on_click = function() vim.cmd('LspInfo') end
            -- },
            -- "require('lsp-status').status()",
			{
				function()
					local msg = "No Active Lsp"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return client.name
						end
					end
					return msg
				end,
				icon = " LSP:",
				-- color = { fg = "#ffffff", gui = "bold" },
			},
		},
		lualine_y = {
			function()
				local current_directory = vim.fn.getcwd()
				local parent_directory = vim.fn.fnamemodify(current_directory, ":p:h:t")
				return parent_directory
			end,
		},
		lualine_z = {
			{
				"location",
				padding = 0,
			},
			{
				icon = "|",
				"progress",
				-- padding = 0
				-- function()
				--     return " " .. os.date("%R")
				-- end,
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = { "neo-tree", "lazy" },
})

-- refresh lualine
vim.cmd([[
augroup lualine_augroup
    autocmd!
    autocmd User LspProgressStatusUpdated lua require("lualine").refresh()
augroup END
]])
