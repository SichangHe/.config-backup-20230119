Keymaps = {}
local suggestion_show = function() return vim.fn.pumvisible == 1 end
local suggestion_selected = function() return vim.fn.empty('completion_selected') == 1 end
local key = vim.keymap.set

function Keymaps.format()
    vim.lsp.buf.formatting()
end

function Keymaps.set()
    key('i', 'jk', '<Esc>')
    key('i', 'kj', '<Esc>')
    key('i', '<C-J>', function() return suggestion_show() and '<C-J>' or '<C-N>' end, { expr = true })
    key('i', '<C-K>', function() return suggestion_show() and '<C-K>' or '<C-P>' end, { expr = true })
    key('n', '<Space>w', '<C-W>')
    key('n', '<Space>f', ':lua Keymaps.format()<CR>')
    key('n', '<Space>s', ':w<CR>:lua Keymaps.format()<CR>')
end

return Keymaps
