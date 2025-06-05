local options = {
  formatters = {
    lua = {
      command = "./../../../../Local/nvim-data/mason/bin/stylua.cmd"
    },
    javascript = {
      command = "./../../../../Local/nvim-data/mason/bin/prettierd.cmd"
    },
    typescript = {
      command = "./../../../../Local/nvim-data/mason/bin/prettierd.cmd"
    },
    javascriptreact = {
      command = "./../../../../Local/nvim-data/mason/bin/prettierd.cmd"
    },
    typescriptreact = {
      command = "./../../../../Local/nvim-data/mason/bin/prettierd.cmd"
    },
    html = {
      command = "prettierd"
    },
  },
  -- formatters_by_ft = {
  --   -- lua = { "stylua" },
  --   javascript = { "prettierd", "prettier", stop_after_first = true },
  --   typescript = { "prettierd", "prettier", stop_after_first = true },
  --   javascriptreact = { "prettierd", "prettier", stop_after_first = true },
  --   typescriptreact = { "prettierd", "prettier", stop_after_first = true },
  --   json = { "prettierd", "prettier", stop_after_first = true },
  --   graphql = { "prettierd", "prettier", stop_after_first = true },
  --   markdown = { "prettierd", "prettier", stop_after_first = true },
  --   css = { "prettierd", "prettier", stop_after_first = true },
  --   scss = { "prettierd", "prettier", stop_after_first = true },
  -- },


  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 100,
    lsp_fallback = true,
  },
}
require("conform").setup(options)
