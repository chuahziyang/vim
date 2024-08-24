-- settings.lua

-- Function to manage editor size
--[[ local function manage_editor_size(count, direction)
    for _ = 1, (count or 1) do
        local action = direction == 'increase' and 'workbench.action.increaseViewSize' or 'workbench.action.decreaseViewSize'
        vim.fn['VSCodeNotify'](action)
    end
en ]]

-- Highlight yank
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ higroup = 'StatusLineNC', timeout = 100 })
    end,
    group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
})

--[[ -- Function for VSCode commentary
local function vscode_commentary(...)
    local args = { ... }
    local count = #args
    local line1, line2
    if count == 0 then
        vim.o.operatorfunc = vim.fn.matchstr(vim.fn.expand('<sfile>'), '[^. ]*$')
        return 'g@'
    elseif count > 1 then
        line1, line2 = args[1], args[2]
    else
        line1, line2 = vim.fn.line("'["), vim.fn.line("']")
    end
    vim.fn['VSCodeCallRange']("editor.action.commentLine", line1, line2, 0)
en ]]

-- Function to open VSCode commands in visual mode
local function open_vscode_commands_in_visual_mode()
    vim.cmd('normal! gv')
    local mode = vim.fn.visualmode()
    if mode == 'V' then
        local startLine = vim.fn.line('v')
        local endLine = vim.fn.line('.')
        vim.fn['VSCodeNotifyRange']("workbench.action.showCommands", startLine, endLine, 1)
    else
        local startPos = vim.fn.getpos('v')
        local endPos = vim.fn.getpos('.')
        vim.fn['VSCodeNotifyRangePos']("workbench.action.showCommands", startPos[1], endPos[1], startPos[2], endPos[2], 1)
    end
end

-- Function to open which key in visual mode
local function open_which_key_in_visual_mode()
    vim.cmd('normal! gv')
    local mode = vim.fn.visualmode()
    if mode == 'V' then
        local startLine = vim.fn.line('v')
        local endLine = vim.fn.line('.')
        vim.fn['VSCodeNotifyRange']("whichkey.show", startLine, endLine, 1)
    else
        local startPos = vim.fn.getpos('v')
        local endPos = vim.fn.getpos('.')
        vim.fn['VSCodeNotifyRangePos']("whichkey.show", startPos[1], endPos[1], startPos[2], endPos[2], 1)
    end
end

-- Key mappings
vim.keymap.set('n', '<C-j>', function() vim.fn['VSCodeNotify']('workbench.action.navigateDown') end, { noremap = true, silent = true })
vim.keymap.set('x', '<C-j>', function() vim.fn['VSCodeNotify']('workbench.action.navigateDown') end, { noremap = true, silent = true })

vim.keymap.set('n', '<C-k>', function() vim.fn['VSCodeNotify']('workbench.action.navigateUp') end, { noremap = true, silent = true })
vim.keymap.set('x', '<C-k>', function() vim.fn['VSCodeNotify']('workbench.action.navigateUp') end, { noremap = true, silent = true })

vim.keymap.set('n', '<C-h>', function() vim.fn['VSCodeNotify']('workbench.action.navigateLeft') end, { noremap = true, silent = true })
vim.keymap.set('x', '<C-h>', function() vim.fn['VSCodeNotify']('workbench.action.navigateLeft') end, { noremap = true, silent = true })

vim.keymap.set('n', '<C-l>', function() vim.fn['VSCodeNotify']('workbench.action.navigateRight') end, { noremap = true, silent = true })
vim.keymap.set('x', '<C-l>', function() vim.fn['VSCodeNotify']('workbench.action.navigateRight') end, { noremap = true, silent = true })

vim.keymap.set('n', 'gr', function() vim.fn['VSCodeNotify']('editor.action.goToReferences') end, { noremap = true })
vim.keymap.set('n', 'gt', function() vim.fn['VSCodeNotify']('editor.action.goToTypeDefinition') end, { noremap = true })

-- vim.keymap.set('x', '<C-/>', function() vscode_commentary() end, { expr = true, noremap = true })
-- vim.keymap.set('n', '<C-/>', function() vscode_commentary() end, { expr = true, noremap = true })

vim.keymap.set('n', '<C-w>_', function() vim.fn['VSCodeNotify']('workbench.action.toggleEditorWidths') end, { noremap = true, silent = true })
vim.keymap.set('n', '<Space>', function() vim.fn['VSCodeNotify']('whichkey.show') end, { noremap = true, silent = true })
vim.keymap.set('x', '<Space>', open_which_key_in_visual_mode, { noremap = true, silent = true })
vim.keymap.set('x', '<C-P>', open_vscode_commands_in_visual_mode, { noremap = true, silent = true })

vim.keymap.set('x', 'gc', '<Plug>VSCodeCommentary', { noremap = true })
vim.keymap.set('n', 'gc', '<Plug>VSCodeCommentary', { noremap = true })
vim.keymap.set('o', 'gc', '<Plug>VSCodeCommentary', { noremap = true })
vim.keymap.set('n', 'gcc', '<Plug>VSCodeCommentaryLine', { noremap = true })

vim.keymap.set('n', 'zM', function() vim.fn['VSCodeNotify']('editor.foldAll') end, { noremap = true, silent = true })
vim.keymap.set('n', 'zR', function() vim.fn['VSCodeNotify']('editor.unfoldAll') end, { noremap = true, silent = true })
vim.keymap.set('n', 'zc', function() vim.fn['VSCodeNotify']('editor.fold') end, { noremap = true, silent = true })
vim.keymap.set('n', 'zC', function() vim.fn['VSCodeNotify']('editor.foldRecursively') end, { noremap = true, silent = true })
vim.keymap.set('n', 'zo', function() vim.fn['VSCodeNotify']('editor.unfold') end, { noremap = true, silent = true })
vim.keymap.set('n', 'zO', function() vim.fn['VSCodeNotify']('editor.unfoldRecursively') end, { noremap = true, silent = true })
vim.keymap.set('n', 'za', function() vim.fn['VSCodeNotify']('editor.toggleFold') end, { noremap = true, silent = true })

-- Function to move cursor
local function move_cursor(direction)
    if vim.fn.reg_recording() == '' and vim.fn.reg_executing() == '' then
        return 'g' .. direction
    else
        return direction
    end
end

vim.keymap.set('n', 'j', function() return move_cursor('j') end, { expr = true })
vim.keymap.set('n', 'k', function() return move_cursor('k') end, { expr = true })

-- Tab behavior
vim.keymap.set('n', '<Tab>', ':Tabnext<CR>', { noremap = true })
vim.keymap.set('n', '<S-Tab>', ':Tabprev<CR>', { noremap = true })

-- Clipboard settings
vim.o.clipboard = 'unnamedplus'

-- Custom leader key mappings
vim.keymap.set('n', '<leader>{', '$va{V', { noremap = true })
vim.keymap.set('n', '<leader>[', '$va[V', { noremap = true })
vim.keymap.set('n', '<leader>p', '"0p', { noremap = true })
vim.keymap.set('n', '<leader>d', '"_d', { noremap = true })
