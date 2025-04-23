require("nvchad.autocmds")
-- AutoCommands
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'StatusLineNC', timeout = 200 })
  end,
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
})

vim.api.nvim_create_autocmd("BufDelete", {
  callback = function()
    local bufs = vim.t.bufs
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
    end
  end,
})
