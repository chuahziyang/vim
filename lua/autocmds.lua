require("nvchad.autocmds")
-- AutoCommands
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'StatusLineNC', timeout = 200 })
  end,
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
})

vim.api.nvim_create_autocmd('CursorHold', {
  pattern = '*',
  callback = function()
    vim.diagnostic.open_float()
  end,
  group = vim.api.nvim_create_augroup('HoverDiagnostic', { clear = true }),
})
