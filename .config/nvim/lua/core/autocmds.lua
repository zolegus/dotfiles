local api = vim.api

-- Function to toggle cursorline
local function toggle_cursorline()
	if vim.fn.mode() == "n" then
		vim.wo.cursorline = true
	else
		vim.wo.cursorline = false
	end
end

-- Create an autogroup for your cursorline settings
vim.cmd([[
  augroup CursorLineToggle
    autocmd!
    autocmd ModeChanged *:n call v:lua.toggle_cursorline()
    autocmd ModeChanged n:* call v:lua.toggle_cursorline()
  augroup END
]])

-- Expose the toggle function to the global scope
_G.toggle_cursorline = toggle_cursorline

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

--- Remove all trailing whitespace on save
local TrimWhiteSpaceGrp = api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
	command = [[:%s/\s\+$//e]],
	group = TrimWhiteSpaceGrp,
})

-- wrap words "softly" (no carriage return) in mail buffer
api.nvim_create_autocmd("Filetype", {
	pattern = "mail",
	callback = function()
		vim.opt.textwidth = 0
		vim.opt.wrapmargin = 0
		vim.opt.wrap = true
		vim.opt.linebreak = true
		vim.opt.columns = 80
		vim.opt.colorcolumn = "80"
	end,
})

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- go to last loc when opening a buffer
api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

api.nvim_create_autocmd("FileType", {
	pattern = "man",
	command = [[nnoremap <buffer><silent> q :quit<CR>]],
})

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })

api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	pattern = "*",
	command = "set cursorline",
	group = cursorGrp,
})

api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
	pattern = "*",
	command = "set nocursorline",
	group = cursorGrp,
})

-- Enable spell checking for certain file types
api.nvim_create_autocmd(
	{ "BufRead", "BufNewFile" },
	-- { pattern = { "*.txt", "*.md", "*.tex" }, command = [[setlocal spell<cr> setlocal spelllang=en,de<cr>]] }
	{
		pattern = { "*.txt", "*.md", "*.tex" },
		callback = function()
			vim.opt.spell = true
			vim.opt.spelllang = "en"
		end,
	}
)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
-- 	callback = function(ev)
-- Enable completion triggered by <c-x><c-o>
-- vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
-- local opts = { buffer = ev.buf }
-- vim.keymap.set("n", "<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
-- vim.keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, opts)
-- vim.keymap
--     .set('n', '<Leader>sa', vim.lsp.buf.add_workspace_folder, opts)
-- vim.keymap.set('n', '<Leader>sr', vim.lsp.buf.remove_workspace_folder,
--                opts)
-- vim.keymap.set('n', '<Leader>sl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, opts)
-- vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
-- vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, opts)
-- vim.keymap.set({ "", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
-- vim.keymap.set("n", "<Leader>lf", function()
-- 	vim.lsp.buf.format({ async = true })
-- end, opts)
-- 	end,
-- })
