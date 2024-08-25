return {
  {
    "gbprod/substitute.nvim",
    opts = {
      highlight_substituted_text = {
        enabled = false,
      },
    },
    config = function()
      require('substitute').setup({})
      vim.keymap.set("n", "gs", require('substitute').operator, { noremap = true })
      vim.keymap.set("n", "gss", require('substitute').line, { noremap = true })
      vim.keymap.set("n", "gS", require('substitute').eol, { noremap = true })
      vim.keymap.set("x", "gx", require('substitute').visual, { noremap = true })
    end,
  },
}
