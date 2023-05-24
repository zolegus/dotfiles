require'window-picker'.setup({
    autoselect_one = false,
    include_current = false,
    filter_rules = {
        bo = {
            filetype = {'neo-tree', "neo-tree-popup", "notify"},
            buftype = {'terminal', "quickfix"}
        }
    },
    other_win_hl_color = '#e35e4f'
})
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "DiagnosticSignHint"})


-- TODO from nvim-go
-- references:
-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes
require("neo-tree").setup({
    close_if_last_window = true,
    popup_border_style = "single",
    enable_git_status = true,
    enable_modified_markers = true,
    enable_diagnostics = false,
    sort_case_insensitive = true,
    default_component_configs = {
        indent = {
            with_markers = false,
            with_expanders = true,
        },
        modified = {
            symbol = " ",
            highlight = "NeoTreeModified",
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            folder_empty_open = "",
        },
        git_status = {
            symbols = {
                -- Change type
                added = "",
                deleted = "",
                modified = "",
                renamed = "",
                -- Status type
                untracked = "",
                ignored = "",
                unstaged = "",
                staged = "",
                conflict = "",
            },
        },
    },
    window = {
        position = "left",
        width = 35,
    },
    filesystem = {
        use_libuv_file_watcher = true,
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
                "node_modules",
            },
            never_show = {
                ".DS_Store",
                "thumbs.db",
            },
        },
    },
    event_handlers = {
        {
            event = "file_opened",
            handler = function()
                --auto close
                require("neo-tree").close_all()
            end,
        },
        {
            event = "neo_tree_window_after_open",
            handler = function(args)
                if args.position == "left" or args.position == "right" then
                    vim.cmd("wincmd =")
                end
            end,
        },
        {
            event = "neo_tree_window_after_close",
            handler = function(args)
                if args.position == "left" or args.position == "right" then
                    vim.cmd("wincmd =")
                end
            end,
        },
    },
})
