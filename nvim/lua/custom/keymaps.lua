local pumvisible = function() return vim.fn.pumvisible == 1 end

function set_keymap()
    local set = vim.keymap.set
    set('i', 'jk', '<Esc>')
    set('i', 'kj', '<Esc>')
    set('i', '<C-J>', function() if pumvisible() then return '<C-J>' else return '<C-N>' end end, { expr = true })
    set('i', '<C-K>', function() if pumvisible() then return '<C-K>' else return '<C-P>' end end, { expr = true })
end
