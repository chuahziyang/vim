require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local del = vim.keymap.del

local function toggle_floating_term(type)
  return function()
    require("nvchad.term").toggle { pos = type, id = type }
  end
end

-- Define a wrapper function that calls move_buf with an argument
local function move_buf(arg)
  return function()
    require("nvchad.tabufline").move_buf(arg)
  end
end

-- Delete Keymaps
del('n', '<leader>ma')
del('n', '<leader>n')
del('n', '<leader>th')
del('n', '<leader>e')
del('n', '<leader>ds')
del('n', '<leader>wk')
del('n', '<leader>wK')
del('n', '<leader>b')
del('n', '<leader>pt')
del('n', '<leader>rn')

-- Smart Splits
del('n', '<C-h>')
del('n', '<C-j>')
del('n', '<C-k>')
del('n', '<C-l>')
map('n', '<C-h>', require('smart-splits').move_cursor_left)
map('n', '<C-j>', require('smart-splits').move_cursor_down)
map('n', '<C-k>', require('smart-splits').move_cursor_up)
map('n', '<C-l>', require('smart-splits').move_cursor_right)
-- map('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
-- map('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
-- map('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
-- map('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
-- map('n', '<C-\\>', require('smart-splits').move_cursor_previous)

-- Code Navigations
map('n', '<leader>{', '$va{V', { noremap = true })
map('n', '<leader>[', '$va[V', { noremap = true })
map('n', '<leader>p', '"0p', { noremap = true })
map('n', '<leader>d', '"_d', { noremap = true })
map('n', '<C-d>', '<C-d>zz', { noremap = true })
map('n', '<C-u>', '<C-u>zz', { noremap = true })

-- Telescope Bindings
map("n", "<leader>ft", "<cmd>Telescope terms<CR>", { desc = "Telescope live grep" })
map("n", "<leader><leader>f", "<cmd>Telescope<CR>", { desc = "Telescope" })


-- Git Integrations
map('n', '<leader>gs', ':!git add -A<CR><CR>', { noremap = true, desc = "Stage All Files" })
map('n', '<leader>gc', ':Git commit<CR>', { noremap = true, desc = "Commit Changes" })


-- Buffer Navigations
map('n', '<leader>w', ':w<CR>', { noremap = true })
map('n', '<leader>q', ':x<CR>', { noremap = true })
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { noremap = true })

-- Terminal Navigations
map('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
map({ 'n', 't' }, '<C-t>', toggle_floating_term("float"), { desc = "Terminal Toggle Floating term" })

map("n", "<leader>j", "<cmd>bprev<CR>")
map("n", "<leader>k", "<cmd>bnext<CR>")
map("n", "<leader><leader>j", move_buf(-1))
map("n", "<leader><leader>k", move_buf(1))

map("n", "<leader>lr", function()
  require "nvchad.lsp.renamer" ()
end)
