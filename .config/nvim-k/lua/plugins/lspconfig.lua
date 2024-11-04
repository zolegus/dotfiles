return {
  "neovim/nvim-lspconfig",
  opts = {
    ---@type lspconfig.options
    servers = {
      tailwindcss = {
        filetypes = {
          "css",
          "scss",
          "sass",
          "html",
          "javascriptreact",
          "typescriptreact",
          "rust",
          "svelte",
        },
        init_options = {
          userLanguages = {
            rust = "html"
          }
        },
        settings = {
          includeLanguages = {
            rust = "html",
          }
        },
        tailwindcss = {
          experimental = {
            classRegex = {
              [[class= "([^"]*)]],
              [[class: "([^"]*)]],
              '~H""".*class="([^"]*)".*"""',
              '~F""".*class="([^"]*)".*"""',
            },
          },
          validate = true
        }
      },
      jsonls = {
        on_new_config = function(new_config)
          new_config.settings.json.schemas = new_config.settings.json.schemas or {
          }
          vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
        end,
        settings = {
          json = {
            validate = { enable = true },
            schemas = {
              {
                description = "shuttle go plan",
                fileMatch = {
                  "shuttle.yaml"
                },
                name = "shuttle.yaml",
                url = "file:///Users/kah/git/github.com/lunarway/lw-shuttle-go-plan/.schemastore/schema.json"
              }
            }
          }
        }
      },
      yamlls = {
        on_new_config = function(new_config)
          new_config.settings.json.schemas = new_config.settings.json.schemas or {
          }
          vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
        end,
        settings = {
          yaml = {
            validate = true,
            schemas = {
              ["file:///Users/kah/git/github.com/lunarway/lw-shuttle-go-plan/.schemastore/schema.json"] = "shuttle.yaml"
              --{
              --  description = "shuttle go plan",
              --  fileMatch = {
              --    "shuttle.yaml"
              --  },
              --  name = "shuttle.yaml",
              --  url =
              --}
            }
          }
        }
      },
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              autopep8 = {
                enabled = false
              },
              yapf = {
                enabled = false
              },
              pylint = {
                enabled = true
              },
              flake8 = {
                enabled = true
              },
              ["pylsp-mypy"] = {
                enabled = true,
                livemode = true
              },
              ["pylsp-rope"] = {
                enabled = true
              },
              ["pyls-isort"] = {
                enabled = true
              },
              ["python-lsp-black"] = {
                enabled = true
              },
              ["pyls-memestra"] = {
                enabled = true
              },
            }
          }
        }
      }
    }
  }
}
