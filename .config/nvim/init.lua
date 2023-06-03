vim.opt.completeopt = "menuone,noselect"
--########## General modules ###########
require('core.plugins')
require('core.mappings')
require('core.colors')
require('core.options')
require('core.icons')
require('core.utils')
require('core.autocmds')

--########## Plugins ###################
require('plugins.neotree')
require('plugins.hop')
require('plugins.treesitter')
require('plugins.catppuccin')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.mason')
require('plugins.telescope')
require('plugins.nullls')
require('plugins.navigator')
require('plugins.comment')
require('plugins.bufferline')
require('plugins.dashboard')
require('plugins.gitsigns')
require('plugins.lualine')
require('plugins.fidget')
require('plugins.surround')
require('plugins.spectre')
require('plugins.dap')
require('plugins.illuminate')
require('plugins.trouble')
require('plugins.todo-comments')
require('plugins.which-key')

--########### Disabled #################
--require('plugins.lspprogress')

