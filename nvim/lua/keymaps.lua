local M = {}
local set = vim.opt
local cmd = vim.cmd
local key = vim.keymap.set
local current_line = function() return vim.api.nvim_win_get_cursor(0)[1] end

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
    key('n', '<Space>w', '<C-W>')
    key('n', '<Space>s', ':lua Keymaps.format()<CR>:w<CR>')
    key('n', '<Space><S-o>', ':FzfLua oldfiles<CR>')
    key('n', '<Space>o', ':FzfLua files<CR>')
    key('n', '<Space>;', ':FzfLua commands<CR>')
    key('n', '<Space>.', '<Plug>(coc-codeaction-cursor)')
    key('n', '<Space><Tab>', ':FzfLua buffers<CR>')
    key('i', '<Space><Space>m', '$$<Left>')
    key('i', '<Space><Space>mm', '$$<CR><CR>$$<Up>')
    key('n', '<Space>f', ':FzfLua blines<CR>')
    key('n', '<Space>ff', ':FzfLua grep<CR>')
    key('n', '<Space>j', ':FzfLua jumps<CR>')
    key('n', '<Space>co', function ()
        return ':!co . && co --goto %:' .. current_line() .. '<CR>'
    end, { expr = true })
end

return M