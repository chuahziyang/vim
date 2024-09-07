local options = {
  -- formatters_by_ft = {
  --   lua = { "stylua" },
  --   -- css = { "prettier" },
  --   -- html = { "prettier" },
  -- },
  formatters_by_ft = {
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
    json = { { "prettierd", "prettier" } },
    graphql = { { "prettierd", "prettier" } },
    markdown = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
    scss = { { "prettierd", "prettier" } },
  },
  formatters = {
    lua = {
      command = "./../../../../Local/nvim-data/mason/bin/stylua.cmd"
    }
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
