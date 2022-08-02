Keymaps = {}
local suggestion_show = function() return vim.fn.pumvisible == 1 end
local suggestion_selected = function() return vim.fn.empty('completion_selected') == 1 end
local set = vim.keymap.set

function Keymaps.format()
    vim.cmd('CocCommand editor.action.formatDocument')
end

function Keymaps.set()
    set('i', 'jk', '<Esc>')
    set('i', 'kj', '<Esc>')
    set('i', '<C-J>', function() return suggestion_show() and '<C-J>' or '<C-N>' end, { expr = true })
    set('i', '<C-K>', function() return suggestion_show() and '<C-K>' or '<C-P>' end, { expr = true })
    set('n', '<Space>w', '<C-W>')
    set('n', '<Space>p', ':CocList commands<CR>')
    set('n', '<Space>f', ':lua Keymaps.format()<CR>')
    set('n', '<Space>s', ':w<CR>:lua Keymaps.format()<CR>')
end

return Keymaps
