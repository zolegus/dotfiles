return {
	mode = { "n", "v" },
	["/"] = "Comment",
	[";"] = { ":Alpha<CR>", "Dashboard" },
	w = { ":w!<CR>", "Save force" },
	W = { "<cmd>noautocmd w<cr>", "Save w/o formatting (noautocmd)" },
	e = { "File Explorer" },
	o = { "Git Explorer" },
	q = { ":confirm q<CR>", "Quit" },
	m = { "<cmd>MarkdownPreview<CR>", "Markdown Preview" },
	n = { ":enew<CR>", "New File" },
	x = { ":bd<CR>", "Close Buffer" },
	a = { "<cmd>%y+<CR>", "Copy All" },
	h = { ":nohlsearch<CR>", "No Highlight" },
	p = { "<cmd>Telescope treesitter<CR>", "List Symbols" },
	f = { "<cmd>lua require('core.utils').telescope_git_or_file()<CR>", "Find Files" },
	u = { "<cmd>UndotreeToggle<CR>", "UndoTree" },
	R = {
		name = "+Search&Replace",
		a = { "<cmd>lua require('spectre').open()<cr>", "any in workspace" },
		w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "word under cursor in workspace" },
		f = { "<cmd>lua require('spectre').open_file_search()<cr>", "some in current file" },
	},
	b = {
		name = "+Buffers",
		j = { "<cmd>BufferLinePick<cr>", "Jump" },
		f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
		b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
		n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
		e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close" },
		h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
		l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right" },
		D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
		L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language" },
		p = { "<cmd>BufferLineTogglePin<CR>", "Toggle pin" },
		P = { "<cmd>BufferLineGroupClose ungrouped<CR>", "Delete non-pinned buffers" },
	},
	g = {
		name = "+Git",
		j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff" },
		f = { "<cmd>Flogsplit<cr>", "Branch viewer" },
	},
	l = {
		name = "+LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		A = { "<cmd>lua vim.lsp.buf.range_code_action()<cr>", "Range Code Actions" },
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
		i = { "<cmd>Trouble lsp_implementations toggle<cr>", "Type Definition (Trouble)" },
		I = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
		o = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
		O = { "<cmd>Trouble lsp_type_definitions toggle<cr>", "Type Definition (Trouble)" },
		r = { "<cmd>Trouble lsp_references toggle<cr>", "References (Trouble)" },
		h = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Display Signature Information" },
		p = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols (TSCP)" },
		s = { "<cmd>Trouble symbols toggle<cr>", "Symbols (Trouble) " },
		R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format code" },
		K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
		k = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Diagnostic Float window" },
		l = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)" },
		L = { "<cmd>Trouble diagnostics toggle<cr>", "Workspace Diagnostics (Trouble)" },
		t = { [[ <Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>]], "Refactor" },
		-- m = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Document Diagnostics (Loclist old version)" },
		m = { "<cmd>Trouble loclist toggle<cr>", "Location list (Trouble)" },
		-- j = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Previous Diagnostic" },
		-- k = { "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Next Diagnostic" },
		q = { "<cmd>Trouble qflist toggle<cr>", "Quickfix (Trouble)" },
		Q = { "<cmd>Telescope quickfix<cr>", "Quickfix (TSCP)" },
		z = { "<cmd>LspRestart<cr>", "Restart LSP" },
	},
	s = {
		name = "+Search",
		-- ["*"] = { "<cmd>Telescope grep_string<cr>", "Grep String" },
		f = { "<cmd>Telescope find_files<cr>", "File" },
		H = { "<cmd>Telescope help_tags<cr>", "Help" },
		G = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope lsp_references<cr>", "References (TSCP)" },
		o = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
		u = { "<cmd>Telescope resume<cr>", "Resume last search" },
		x = { "<cmd>Telescope registers<cr>", "Registers" },
		t = { "<cmd>Telescope live_grep<cr>", "Text" },
		T = {
			function()
				require("telescope.builtin").live_grep({
					additional_args = function(args)
						return vim.list_extend(args, { "--hidden", "--no-ignore" })
					end,
				})
			end,
			"Hidden Text",
		},
		w = { "<cmd>Telescope grep_string<cr>", "Text under cursor" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps nvim" },
		C = { "<cmd>Telescope commands<cr>", "Commands nvim" },
		n = { "<cmd>Telescope notify<cr>", "Notification" }, --TODO: Notify?!
		l = { "<cmd>Telescope diagnostics<cr>", "Diagnostics (TSCP)" },
		c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
		b = { "<cmd>Telescope git_branches<cr>", "Git branches" },
		s = { "<cmd>Telescope git_status<cr>", "Git status" },
		S = { "<cmd>Telescope git_stash<cr>", "Git stash" },
		z = { "<cmd>Telescope zoxide list<cr>", "Zoxide" },
		h = { "<cmd>Telescope undo<cr>", "Undo history" },
		d = {
			name = "+DAP",
			c = { "<cmd>Telescope dap commands<cr>", "Dap Commands" },
			b = { "<cmd>Telescope dap list_breakpoints<cr>", "Dap Breakpoints" },
			g = { "<cmd>Telescope dap configurations<cr>", "Dap Configurations" },
			v = { "<cmd>Telescope dap variables<cr>", "Dap Variables" },
			f = { "<cmd>Telescope dap frames<cr>", "Dap Frames" },
		},
	},
	t = {
		name = "+Todo",
		t = { "<cmd>TodoTelescope<cr>", "Todo" },
		T = { "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", "Todo/Fix/Fixme" },
		x = { "<cmd>TodoTrouble<cr>", "Todo (Trouble)" },
		X = { "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr><cr>", "Todo/Fix/Fixme (Trouble)" },
	},
	d = {
		name = "+Debug",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
		l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
		O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
		u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
		U = {
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end,
			"Open debugging sidebar",
		},
		x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
	},
	r = {
		name = "+Rust",
		a = { "<cmd>RustHoverActions<Cr>", "Actions" },
		c = { "<cmd>RustOpenCargo<Cr>", "Open Cargo" },
		d = { "<cmd>RustDebuggables<Cr>", "Debuggables" },
		j = { "<cmd>lua require('rust-tools').join_lines.join_lines()<CR>", "Join Lines" },
		h = {
			"Inlay hits",
			s = { "<cmd>lua require('rust-tools').inlay_hints.set()<Cr>", "Set hits for buffer" },
			u = { "<cmd>lua require('rust-tools').inlay_hints.unset()<Cr>", "Unset hints for buffer" },
			e = { "<cmd>lua require('rust-tools').inlay_hints.enable()<Cr>", "Enable auto update hits for all" },
			d = { "<cmd>lua require('rust-tools').inlay_hints.disable()<Cr>", "Disable auto update hits for all" },
		},
		m = { "<cmd>RustExpandMacro<Cr>", "Expand Macro" },
		o = { "<cmd>RustOpenExternalDocs<Cr>", "Open External Docs" },
		p = { "<cmd>RustParentModule<Cr>", "Parent Module" },
		r = { "<cmd>RustRunnables<Cr>", "Runnables" },
		t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
		v = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" },
		z = {
			"<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
			"Reload Workspace",
		},
	},
	c = {
		name = "+Rust Crates",
		k = { "<cmd>lua require('crates').show_popup()<CR>", "Show popup" },
		r = { "<cmd>lua require('crates').reload()<CR>", "Reload" },
		v = { "<cmd>lua require('crates').show_versions_popup()<CR>", "Show Versions" },
		f = { "<cmd>lua require('crates').show_features_popup()<CR>", "Show Features" },
		d = { "<cmd>lua require('crates').show_dependencies_popup()<CR>", "Show Dependencies Popup" },
		u = { "<cmd>lua require('crates').update_crate()<CR>", "Update Crate" },
		a = { "<cmd>lua require('crates').update_all_crates()<CR>", "Update All Crates" },
		U = { "<cmd>lua require('crates').upgrade_crate<CR>", "Upgrade Crate" },
		A = { "<cmd>lua require('crates').upgrade_all_crates(true)<CR>", "Upgrade All Crates" },
		H = { "<cmd>lua require('crates').open_homepage()<CR>", "Open Homepage" },
		R = { "<cmd>lua require('crates').open_repository()<CR>", "Open Repository" },
		D = { "<cmd>lua require('crates').open_documentation()<CR>", "Open Documentation" },
		C = { "<cmd>lua require('crates').open_crates_io()<CR>", "Open Crates.io" },
	},
}
