return {
  {
    "gbprod/substitute.nvim",
    lazy = false,
    opts = {
      highlight_substituted_text = {
        enabled = false,
      },
    },
    config = function()
      require('substitute').setup({})
      vim.keymap.set("n", "gx", require('substitute').operator, { noremap = true })
      vim.keymap.set("n", "gxx", require('substitute').line, { noremap = true })
      vim.keymap.set("n", "gX", require('substitute').eol, { noremap = true })
      vim.keymap.set("x", "gx", require('substitute').visual, { noremap = true })
    end,
  },
}
