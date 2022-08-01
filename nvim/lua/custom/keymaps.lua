local pumvisible = function() return vim.fn.pumvisible == 1 end
local set = vim.keymap.set

function SetKeymaps()
    set('i', 'jk', '<Esc>')
    set('i', 'kj', '<Esc>')
    set('i', '<C-J>', function() return pumvisible() and '<C-J>' or '<C-N>' end, { expr = true })
    set('i', '<C-K>', function() return pumvisible() and '<C-K>' or '<C-P>' end, { expr = true })
end
