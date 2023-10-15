local null_ls = require("null-ls")
-- Don't show a section when vim has less than 80 columns
local hide_in_width = function()
	return vim.o.columns > 80
end
-- Don't show a section in ui filetypes
local show_lsp_section = function()
	local buf_ft = vim.bo.filetype
	local ui_filetypes = {
		"help",
		"undotree",
		"lspinfo",
		"mason",
		"null-ls-info",
		"NeogitStatus",
		"NeogitCommitMessage",
		"spectre_panel",
		"TelescopePrompt",
		"Trouble",
		"DressingSelect",
		"",
	}
	if vim.tbl_contains(ui_filetypes, buf_ft) then
		return false
	end
	return true
end
-----------------------------------------------------------------------------------------------------------
-- LSP and Formatters
-----------------------------------------------------------------------------------------------------------
-- Get the list of active lsp servers
local function lsp_list()
	local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
	local buf_client_names = {}

	for _, client in pairs(buf_clients) do
		if client.name ~= "null-ls" then
			table.insert(buf_client_names, client.name)
		end
	end

	return table.concat(buf_client_names, ", ")
end

-- Get the list of active formatters and linters
local function formatters_list()
	local buf_ft = vim.bo.filetype
	local nls_sources = require("null-ls.sources")
	local available_sources = nls_sources.get_available(buf_ft)
	local registered = {}
	for _, source in ipairs(available_sources) do
		for method in pairs(source.methods) do
			registered[method] = registered[method] or {}
			table.insert(registered[method], source.name)
		end
	end
	local formatter_names = {}
	local formatter = registered["NULL_LS_FORMATTING"]
	local linter = registered["NULL_LS_DIAGNOSTICS"]
	if formatter ~= nil then
		vim.list_extend(formatter_names, formatter)
	end
	if linter ~= nil then
		vim.list_extend(formatter_names, linter)
	end
	return table.concat(formatter_names, ", ")
end

local lsp_servers = {
	function()
		local lsp = lsp_list()
		local text = " LSP:"
		if lsp == "" then
			-- return " ∅"
			return "%#WinSeparator#  LSP %*"
		end
		return vim.fn.join({ text, lsp, "" }, " ")
	end,
	cond = function()
		return hide_in_width() and show_lsp_section()
	end,
	padding = { right = 0 },
	-- Alternate: dont show when empty
	-- draw_empty = false,
	component_separators = "",
}

local formatters = {
	function()
		local formatters = formatters_list()
		local text = ":"
		-- local text = "Format:"
		if formatters == "" then
			-- return " ∅"
			return "%#WinSeparator#  %*"
		end
		return vim.fn.join({ "", text, formatters }, " ")
	end,
	cond = function()
		return hide_in_width() and show_lsp_section()
	end,
	padding = { right = 0 },
}

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
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
		},
		lualine_x = {
			lsp_servers,
			formatters,
			-- {
			--     require("lsp-progress").progress,
			--     on_click = function() vim.cmd('LspInfo') end
			-- },
			-- "require('lsp-status').status()",
			{
				-- function()
				-- 	local msg = "No Active Lsp"
				-- 	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
				-- 	local clients = vim.lsp.get_active_clients()
				-- 	if next(clients) == nil then
				-- 		return msg
				-- 	end
				-- 	msg = ""
				-- 	for _, client in ipairs(clients) do
				-- 		local filetypes = client.config.filetypes
				-- 		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				-- 			if msg ~= "" then
				-- 				msg = msg .. ","
				-- 			end
				-- 			msg = msg .. client.name
				-- 			-- return client.name
				-- 			if client.name == "null-ls" then
				-- 				-- print(client.get_registered_names().formatter_names.name)
				-- 				-- for _, name in ipairs(formatter_names) do
				-- 				-- print(name)
				-- 				-- 		msg = msg .. name
				-- 				-- end
				-- 				-- null_ls.get_registered_names()
				-- 				client.config.filetypes.formatter_names()
				-- 				msg = msg .. "+"
				-- 			end
				-- 		end
				-- 	end
				-- 	return msg
				-- end,
				-- icon = " LSP:",
				-- -- color = { fg = "#ffffff", gui = "bold" },
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
				icon = "│", -- |
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
