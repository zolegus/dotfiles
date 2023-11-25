require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = false,
	show_end_of_buffer = false, -- show the '~' characters after the end of buffers
	term_colors = false,
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = 0.1,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	no_underline = false, -- Force no underline
	styles = {
		comments = { "italic" },
		-- conditionals = { "italic" },
		conditionals = {},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	-- ORIGINAL COLORS
	-- Name	Latte	Frappe	Macchiato	Mocha	Usage
	-- rosewater	#dc8a78	#F2D5CF	#F4DBD6	#F5E0DC	Winbar
	-- flamingo	#DD7878	#EEBEBE	#F0C6C6	#F2CDCD	Target word
	-- pink	#ea76cb	#F4B8E4	#F5BDE6	#F5C2E7	Just pink
	-- mauve	#8839EF	#CA9EE6	#C6A0F6	#CBA6F7	Tag
	-- red	#D20F39	#E78284	#ED8796	#F38BA8	Error
	-- maroon	#E64553	#EA999C	#EE99A0	#EBA0AC	Lighter red
	-- peach	#FE640B	#EF9F76	#F5A97F	#FAB387	Number
	-- yellow	#df8e1d	#E5C890	#EED49F	#F9E2AF	Warning
	-- green	#40A02B	#A6D189	#A6DA95	#A6E3A1	Diff add
	-- teal	#179299	#81C8BE	#8BD5CA	#94E2D5	Hint
	-- sky	#04A5E5	#99D1DB	#91D7E3	#89DCEB	Operator
	-- sapphire	#209FB5	#85C1DC	#7DC4E4	#74C7EC	Constructor
	-- blue	#1e66f5	#8CAAEE	#8AADF4	#89B4FA	Diff changed
	-- lavender	#7287FD	#BABBF1	#B7BDF8	#B4BEFE	CursorLine Nr
	-- text	#4C4F69	#c6d0f5	#CAD3F5	#CDD6F4	Default fg
	-- subtext1	#5C5F77	#b5bfe2	#B8C0E0	#BAC2DE	Indicator
	-- subtext0	#6C6F85	#a5adce	#A5ADCB	#A6ADC8	Float title
	-- overlay2	#7C7F93	#949cbb	#939AB7	#9399B2	Popup fg
	-- overlay1	#8C8FA1	#838ba7	#8087A2	#7F849C	Conceal color
	-- overlay0	#9CA0B0	#737994	#6E738D	#6C7086	Fold color
	-- surface2	#ACB0BE	#626880	#5B6078	#585B70	Default comment
	-- surface1	#BCC0CC	#51576d	#494D64	#45475A	Darker comment
	-- surface0	#CCD0DA	#414559	#363A4F	#313244	Darkest comment
	-- base	#EFF1F5	#303446	#24273A	#1E1E2E	Default bg
	-- mantle	#E6E9EF	#292C3C	#1E2030	#181825	Darker bg
	-- crust	#DCE0E8	#232634	#181926	#11111B	Darkest bg
	-- color_overrides = {
	--     mocha = {
	--         rosewater = "#EA6962",
	--         flamingo = "#EA6962",
	--         pink = "#D3869B",
	--         mauve = "#D3869B",
	--         red = "#EA6962",
	--         maroon = "#EA6962",
	--         peach = "#BD6F3E",
	--         yellow = "#D8A657",
	--         green = "#A9B665",
	--         teal = "#89B482",
	--         sky = "#89B482",
	--         sapphire = "#89B482",
	--         blue = "#7DAEA3",
	--         lavender = "#7DAEA3",
	--         text = "#D4BE98",
	--         subtext1 = "#BDAE8B",
	--         subtext0 = "#A69372",
	--         overlay2 = "#8C7A58",
	--         overlay1 = "#735F3F",
	--         overlay0 = "#958272",
	--         surface2 = "#4B4F51",
	--         surface1 = "#2A2D2E",
	--         surface0 = "#232728",
	--         base = "#1D2021",
	--         mantle = "#191C1D",
	--         crust = "#151819",
	--     },
	--     latte = {
	--         rosewater = "#c14a4a",
	--         flamingo = "#c14a4a",
	--         pink = "#945e80",
	--         mauve = "#945e80",
	--         red = "#c14a4a",
	--         maroon = "#c14a4a",
	--         peach = "#c35e0a",
	--         yellow = "#a96b2c",
	--         green = "#6c782e",
	--         teal = "#4c7a5d",
	--         sky = "#4c7a5d",
	--         sapphire = "#4c7a5d",
	--         blue = "#45707a",
	--         lavender = "#45707a",
	--         text = "#654735",
	--         subtext1 = "#7b5d44",
	--         subtext0 = "#8f6f56",
	--         overlay2 = "#a28368",
	--         overlay1 = "#b6977a",
	--         overlay0 = "#c9aa8c",
	--         surface2 = "#A79C86",
	--         surface1 = "#C9C19F",
	--         surface0 = "#DFD6B1",
	--         base = "#fbf1c7",
	--         mantle = "#F3EAC1",
	--         crust = "#E7DEB7",
	--     },
	-- },
	custom_highlights = function(colors)
		local dark_grey = "#20222c"
		return {
			NormalFloat = { bg = colors.crust },
			FloatBorder = { bg = colors.base, fg = "white" },
			VertSplit = { bg = colors.base, fg = colors.surface0 },
			CursorLineNr = { fg = colors.mauve },
			Pmenu = { bg = colors.crust, fg = "" },
			PmenuSel = { bg = colors.surface0, fg = "" },
			TelescopeSelection = { bg = colors.surface0 },
			TelescopePromptCounter = { fg = colors.mauve },
			TelescopePromptPrefix = { bg = colors.surface0 },
			TelescopePromptNormal = { bg = colors.surface0 },
			TelescopePreviewNormal = { bg = colors.crust },
			TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
			TelescopeResultsBorder = { bg = dark_grey, fg = dark_grey },
			TelescopeResultsNormal = { bg = dark_grey },
			TelescopeResultsTitle = { fg = dark_grey, bg = dark_grey },
			TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
			TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
			TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
			IndentBlanklineChar = { fg = colors.surface0 },
			IndentBlanklineContextChar = { fg = colors.surface2 },
			GitSignsChange = { fg = colors.peach },
			NvimTreeIndentMarker = { link = "IndentBlanklineChar" },
			NvimTreeExecFile = { fg = colors.text },
			DapBreakpoint = { fg = "red" },
			DapLogPoint = { fg = "blue" },
			DapStopped = { fg = "green" },
			InlayHints = { fg = colors.surface0 },
		}
	end,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		neotree = true,
		telescope = true,
		notify = false,
		mini = false,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- setup must be called before loading vim.cmd.colorscheme "catppuccin"
vim.api.nvim_command("colorscheme catppuccin")
