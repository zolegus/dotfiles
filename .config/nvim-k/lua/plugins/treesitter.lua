return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, _)
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()


    -- https://github.com/nvim-treesitter/nvim-treesitter/tree/master#adding-parsers
    parser_config.hurl = {
      install_info = {
        url = "~/git/github.com/kjuulh/tree-sitter-hurl",
        files = { "src/parser.c" },
        branch = "main",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
      filetype = "hurl",
    }


    vim.treesitter.language.register('xml', 'html')
    vim.filetype.add({
      extension = {
        xml = "html"
      }
    })

    -- https://neovim.io/doc/user/lua.html#vim.filetype.add()
    -- Search for vim.filetype.add
    vim.filetype.add({
      extension = {
        hurl = "hurl"
      }
    })
  end
}
