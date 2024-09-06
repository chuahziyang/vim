require("nvchad.autocmds")
-- AutoCommands
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'StatusLineNC', timeout = 200 })
  end,
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
})
