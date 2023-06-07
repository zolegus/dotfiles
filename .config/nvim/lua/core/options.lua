-- local options = {
vim.opt.incsearch = true -- make search act like search in modern browsers
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = "menuone,noselect" -- Options for insert mode completion
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
-- vim.opt.fileencoding = "utf-8"               -- !PROBLEM startup with Lazy! the encoding written to a file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 100 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.breakindent = true -- wrap lines with indent
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 8 -- Makes sure there are always eight lines of context
vim.opt.sidescrolloff = 8 -- Makes sure there are always eight lines of context
vim.opt.laststatus = 3 -- Always display the status line
vim.opt.showcmd = false -- Don't show the command in the last line
vim.opt.ruler = false -- Don't show the ruler
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.virtualedit = "block"
vim.opt.shell = "/bin/zsh"
vim.opt.mousefocus = true
vim.opt.softtabstop = 4
-- }
vim.g.rustfmt_autosave = 1 -- enable rustfmt
vim.g.highlighturl_enabled = true -- highlight URLs by default
vim.g.mapleader = " " -- set leader key
vim.g.autoformat_enabled = true -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
vim.g.codelens_enabled = true -- enable or disable automatic codelens refreshing for lsp that support it
vim.g.lsp_handlers_enabled = true -- enable or disable default vim.lsp.handlers (hover and signatureHelp)
vim.g.cmp_enabled = true -- enable completion at start
vim.g.autopairs_enabled = true -- enable autopairs at start
vim.g.diagnostics_mode = 3 -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
vim.g.icons_enabled = true -- disable icons in the UI (disable if no nerd font is available)
vim.g.ui_notifications_enabled = true -- disable notifications when toggling UI elements

-- for k, v in pairs(options) do
--     vim.opt[k] = v
-- end

-- vim.g.did_load_filetypes = 1
-- vim.g.formatoptions = "qrn1"
-- vim.wo.signcolumn = "yes"
-- vim.wo.linebreak = true
-- vim.wo.number = true
-- vim.wo.relativenumber = true
-- vim.opt.shortmess:append("c")                   -- Shorter messages

-- Fillchars
-- vim.opt.fillchars = {
--     vert = "│",
--     fold = "⠀",
--     eob = " ", -- suppress ~ at EndOfBuffer
--     -- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
--     msgsep = "‾",
--     foldopen = "▾",
--     foldsep = "│",
--     foldclose = "▸"
-- }
-- vim.cmd([[highlight clear LineNr]])
-- vim.cmd([[highlight clear SignColumn]])
