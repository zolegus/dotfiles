local cmp = require 'cmp'
local lspkind = require('lspkind')
local icons = require('core.icons')
local luasnip = require('luasnip')
local cmp_mapping = require('cmp.config.mapping')
local cmp_types = require('cmp.types.cmp')
local utils = require('core.utils')

cmp.setup({
    -----=====###### SETTINGS
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    completion = {
        completeopt = "menuone,noselect", -- no select item in complete list
    },
    preselect = cmp.PreselectMode.None, -- item, none - drop cursor position, don't select item
    -- behavior = cmp.ConfirmBehavior -- Insert, Replace
    -- cmp.ContextReason 'auto' | 'manual' | 'triggerOnly' | 'none'
    -- cmp.TriggerEvent 'InsertEnter' | 'TextChanged'
    -- cmp.ItemField 'abbr' | 'kind' | 'menu'
    -----======##### FORMATING
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local max_width = 0
            if max_width ~= 0 and #vim_item.abbr > max_width then
                vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
            end
            vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind

            if entry.source.name == "crates" then
                vim_item.kind = icons.misc.Package
                vim_item.kind_hl_group = "CmpItemKindCrate"
            end

            if entry.source.name == "emoji" then
                vim_item.kind = icons.misc.Smiley
                vim_item.kind_hl_group = "CmpItemKindEmoji"
            end
            vim_item.menu = ({
                nvim_lsp = "(LSP)",
                emoji = "(Emoji)",
                path = "(Path)",
                calc = "(Calc)",
                vsnip = "(Snippet)",
                luasnip = "(Snippet)",
                buffer = "(Buffer)",
                tmux = "(TMUX)",
                treesitter = "(TreeSitter)",
            })[entry.source.name]
            vim_item.dup = ({
                buffer = 1,
                path = 1,
                nvim_lsp = 0,
                luasnip = 1,
            })[entry.source.name] or 0
            return vim_item
        end,
    },
    -----======##### SNIPPET
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    -----======##### WINDOW
    window = {
        completion = require('cmp.config.window').bordered(),
        documentation = require('cmp.config.window').bordered(),
    },
    -----======##### MAPPING
    mapping = cmp.mapping.preset.insert {
        -- ["<C-k>"] = cmp_mapping(cmp_mapping.select_prev_item(), { "i", "c" }),
        -- ["<C-j>"] = cmp_mapping(cmp_mapping.select_next_item(), { "i", "c" }),
        ["<Down>"] = cmp_mapping(cmp_mapping.select_next_item { behavior = cmp_types.SelectBehavior.Select }, { "i" }),
        ["<Up>"] = cmp_mapping(cmp_mapping.select_prev_item { behavior = cmp_types.SelectBehavior.Select }, { "i" }),
        ["<C-d>"] = cmp_mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp_mapping {
            i = cmp_mapping.confirm { behavior = cmp_types.ConfirmBehavior.Replace, select = false },
            c = function(fallback)
                if cmp.visible() then
                    cmp.confirm { behavior = cmp_types.ConfirmBehavior.Replace, select = false }
                else
                    fallback()
                end
            end,
        },
        ["<CR>"] = cmp.mapping.confirm({select = true}),
        -- ["<CR>"] = cmp_mapping(function(fallback)
        --     if cmp.visible() then
        --         local confirm_opts = vim.deepcopy({
        --             behavior = cmp_types.ConfirmBehavior.Replace,
        --             select = false,
        --         })               -- avoid mutating the original opts below
        --         local is_insert_mode = function()
        --             return vim.api.nvim_get_mode().mode:sub(1, 1) == "i"
        --         end
        --         if is_insert_mode() then               -- prevent overwriting brackets
        --             confirm_opts.behavior = cmp_types.ConfirmBehavior.Insert
        --         end
        --         local entry = cmp.get_selected_entry()
        --         local is_copilot = entry and entry.source.name == "copilot"
        --         if is_copilot then
        --             confirm_opts.behavior = cmp_types.ConfirmBehavior.Replace
        --             confirm_opts.select = true
        --         end
        --         if cmp.confirm(confirm_opts) then
        --             return                 -- success, exit early
        --         end
        --     end
        --     fallback()             -- if not exited early, always fallback
        -- end),
        --
        ["<Tab>"] = cmp_mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            elseif utils.jumpable(1) then
                luasnip.jump(1)
            elseif utils.has_words_before() then
                cmp.complete()
                -- fallback()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp_mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    -----=====##### SOURCES
    sources = {
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip", priority = 750 },
          { name = "buffer", priority = 500 },
          { name = "path", priority = 250 },

        -- {
        --     name = "nvim_lsp",
        --     -- entry_filter = function(entry, ctx)
        --     --     local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
        --     --     if kind == "Snippet" and ctx.prev_context.filetype == "java" then
        --     --         return false
        --     --     end
        --     --     if kind == "Text" then
        --     --         return false
        --     --     end
        --     --     return true
        --     -- end,
        -- },
        { name = "nvim_lua" },
        -- { name = "path" },
        -- { name = "buffer" },
        { name = "calc" },
        { name = "emoji" },
        { name = "treesitter" },
        { name = "crates" },
        { name = "tmux" },
        { name = 'nvim_lsp_signature_help'},
    }
})

--TODO: check these settings

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        {name = 'cmp_git'} -- You can specify the `cmp_git` source if you were installed it.
    }, {{name = 'buffer'}})
})
-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({'/', '?'}, {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {{name = 'buffer'}}
-- })
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
-- })
vim.api.nvim_create_autocmd("BufRead", {
    group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
    pattern = "Cargo.toml",
    callback = function()
        cmp.setup.buffer({ sources = { { name = "crates" } } })
    end,
})
