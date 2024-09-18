-- EXAMPLE
local del = vim.keymap.del;
local original_on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local function on_attach(client, bufnr)
  original_on_attach(client, bufnr)

  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end
  vim.diagnostic.config({
    virtual_text = {
      severity = {
        min = vim.diagnostic.severity.ERROR
      }
    }
  })

  del('n', '<leader>wa', opts "Add workspace folder")
  del('n', '<leader>wr', opts "Remove workspace folder")
  del('n', '<leader>wl', opts "List workspace folders")
end

local servers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
            vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
            vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
            "${3rd}/luv/library",
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    }
  },
  html = {},
  cssls = {},
  tsserver = {},
  tailwindcss = {},
  eslint = {},
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            enabled = false
          },
          -- pylint = {
          --   enabled = false
          -- }
        }
      }
    }
  },
  prismals = {},
  clangd = {},
}


-- lsps with default config
for name, opts in pairs(servers) do
  opts.on_init = on_init
  opts.on_attach = on_attach
  opts.capabilities = capabilities

  require("lspconfig")[name].setup(opts)
end
