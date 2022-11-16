local M = {}
local fn = vim.fn
local set = vim.opt
local cmd = vim.cmd
local suggestion_show = function() return fn.pumvisible == 1 end
local suggestion_selected = function() return fn.empty('completion_selected') == 1 end
local key = vim.keymap.set

function M.format()
    if set.filetype:get() == 'markdown' then
        cmd('CocCommand markdownlint.fixAll')
    else
        cmd('CocCommand editor.action.formatDocument')
    end
end

function M.set()
    key('i', 'jk', '<Esc>')
    key('i', 'kj', '<Esc>')
    key('i', '<Space>', '<C-g>u<Space>')
    key('i', '<CR>', '<C-g>u<CR>')
    key('i', '<C-J>', function() return suggestion_show() and '<C-J>' or '<C-N>' end, { expr = true })
    key('i', '<C-K>', function() return suggestion_show() and '<C-K>' or '<C-P>' end, { expr = true })
    key('n', '<Space>w', '<C-W>')
    key('n', '<Space>f', ':lua Keymaps.format()<CR>')
    key('n', '<Space>s', ':lua Keymaps.format()<CR>:w<CR>')
    key('n', '<Space>h', ':History<CR>')
    key('n', '<Space>o', ':Files<CR>')
    key('n', '<Space>;', ':Commands<CR>')
    key('n', '<Space>.', '<Plug>(coc-codeaction-cursor)')
    key('n', '<Space><Tab>', ':Buffers<CR>')
    key('i', '<Space><Space>m', '$$<Left>')
    key('i', '<Space><Space>mm', '$$<CR><CR>$$<Up>')
    key('n', '<Space>f', ':Grepper -tool rg -buffer -query<CR>')
    key('n', '<Space>ff', ':Grepper -tool rg<CR>')
    key('n', '<Space>co', ':!co . && co %<CR>')
end

return M