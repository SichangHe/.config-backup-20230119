Keymaps = {}
local fn = vim.fn
local set = vim.opt
local cmd = vim.cmd
local suggestion_show = function() return fn.pumvisible == 1 end
local suggestion_selected = function() return fn.empty('completion_selected') == 1 end
local key = vim.keymap.set

function Keymaps.format()
    if set.filetype:get() == 'markdown' then
        cmd('CocCommand markdownlint.fixAll')
    else
        cmd('CocCommand editor.action.formatDocument')
    end
end

function Keymaps.set()
    key('i', 'jk', '<Esc>')
    key('i', 'kj', '<Esc>')
    key('i', '<C-J>', function() return suggestion_show() and '<C-J>' or '<C-N>' end, { expr = true })
    key('i', '<C-K>', function() return suggestion_show() and '<C-K>' or '<C-P>' end, { expr = true })
    key('n', '<Space>w', '<C-W>')
    key('n', '<Space>f', ':lua Keymaps.format()<CR>')
    key('n', '<Space>s', ':lua Keymaps.format()<CR>:w<CR>')
end

return Keymaps
