require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Delete Keymaps
vim.keymap.del('n', '<leader>ma')
vim.keymap.del('n', '<leader>n')
vim.keymap.del('n', '<leader>th')

-- Code Navigations
map('n', '<leader>{', '$va{V', { noremap = true })
map('n', '<leader>[', '$va[V', { noremap = true })
map('n', '<leader>p', '"0p', { noremap = true })
map('n', '<leader>d', '"_d', { noremap = true })
map('n', '<C-d>', '<C-d>zz', { noremap = true })
map('n', '<C-u>', '<C-u>zz', { noremap = true })

-- Git Integrations
map('n', '<leader>gs', ':!git add -u<CR><CR>', { noremap = true })
map('n', '<leader>gc', ':Git commit<CR>', { noremap = true })


-- Buffer Navigations
map('n', '<leader>w', ':w<CR>', { noremap = true })
map('n', '<leader>q', ':x<CR>', { noremap = true })

-- Terminal
-- map('t', '<C-x>', '<C-\\><C-n>', { noremap = true })

map({'n', 't'}, '<C-t>', function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term" })

map({'n', 't'}, '<leader>tf', function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term" })

-- AutoCommands
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ higroup = 'StatusLineNC', timeout = 200 })
    end,
    group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
})

