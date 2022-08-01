Keymaps = {}
local suggestion_show = function() return vim.fn.pumvisible == 1 end
local suggestion_selected = function() return vim.fn.empty('completion_selected') == 1 end
local set = vim.keymap.set

function Keymaps.set()
    set('i', 'jk', '<Esc>')
    set('i', 'kj', '<Esc>')
    set('i', '<C-J>', function() return suggestion_show() and '<C-J>' or '<C-N>' end, { expr = true })
    set('i', '<C-K>', function() return suggestion_show() and '<C-K>' or '<C-P>' end, { expr = true })
    set('n', '<Space>w', '<C-W>')
end

return Keymaps
