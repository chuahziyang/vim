require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
--
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--

vim.keymap.del('n', '<leader>ma')
vim.keymap.del('n', '<leader>n')
vim.keymap.del('n', '<leader>th')


map('n', '<leader>{', '$va{V', { noremap = true })
map('n', '<leader>[', '$va[V', { noremap = true })
map('n', '<leader>p', '"0p', { noremap = true })
map('n', '<leader>d', '"_d', { noremap = true })
-- map('n', '<leader>s', ':w<CR>', { noremap = true })
-- map('n', '<leader>q', ':x<CR>', { noremap = true })

vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ higroup = 'StatusLineNC', timeout = 100 })
    end,
    group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
})

