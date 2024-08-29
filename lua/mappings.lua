require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

local function toggle_floating_term()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end

-- Delete Keymaps
vim.keymap.del('n', '<leader>ma')
vim.keymap.del('n', '<leader>n')
vim.keymap.del('n', '<leader>th')
vim.keymap.del('n', '<leader>e')
vim.keymap.del('n', '<leader>ds')
vim.keymap.del('n', '<leader>wk')
vim.keymap.del('n', '<leader>wK')

-- Code Navigations
map('n', '<leader>{', '$va{V', { noremap = true })
map('n', '<leader>[', '$va[V', { noremap = true })
map('n', '<leader>p', '"0p', { noremap = true })
map('n', '<leader>d', '"_d', { noremap = true })
map('n', '<C-d>', '<C-d>zz', { noremap = true })
map('n', '<C-u>', '<C-u>zz', { noremap = true })

-- Git Integrations
map('n', '<leader>gs', ':!git add -A<CR><CR>', { noremap = true, desc = "Stage All Files" })
map('n', '<leader>gc', ':Git commit<CR>', { noremap = true, desc = "Commit Changes" })


-- Buffer Navigations
map('n', '<leader>w', ':w<CR>', { noremap = true })
map('n', '<leader>q', ':x<CR>', { noremap = true })
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { noremap = true })

-- Terminal Navigations
map('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
map({ 'n', 't' }, '<C-t>', toggle_floating_term, { desc = "Terminal Toggle Floating term" })
map({ 'n', 't' }, '<leader>tf', toggle_floating_term, { desc = "Terminal Toggle Floating term" })

-- AutoCommands
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'StatusLineNC', timeout = 200 })
  end,
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
})

local function opts(desc)
  return { buffer = bufnr, desc = "LSP " .. desc }
end

-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup('LspConfig', { clear = true }),
--
--
--   callback = function()
--     vim.keymap.del('n', '<leader>wk')
--     vim.keymap.del('n', '<leader>wK')
--     vim.keymap.del('n', '<leader>wa', opts "Add workspace folder")
--     vim.keymap.del('n', '<leader>wr', opts "Remove workspace folder")
--     vim.keymap.del('n', '<leader>wl', opts "List workspace folders")
--   end,
-- })
--



vim.keymap.del('n', '<C-h>')
vim.keymap.del('n', '<C-j>')
vim.keymap.del('n', '<C-k>')
vim.keymap.del('n', '<C-l>')
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
