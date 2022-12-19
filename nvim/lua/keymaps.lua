U = require('util')
local M = {}
local cmd = U.cmd
local set = U.set
local current_line = function() return U.api.nvim_win_get_cursor(0)[1] end
local i = function(...) U.key('i', ...) end
local n = function(...) U.key('n', ...) end

function M.format()
    if set.filetype:get() == 'markdown' then
        cmd('CocCommand markdownlint.fixAll')
    else
        cmd('CocCommand editor.action.formatDocument')
    end
end

function M.set()
    i('jk', '<Esc>')
    i('kj', '<Esc>')
    i('<Space>', '<C-g>u<Space>')
    i('<CR>', '<C-g>u<CR>')
    n('<Space>w', '<C-W>')
    n('<Space>s', ':lua Keymaps.format()<CR>:w<CR>')
    n('<Space><S-o>', ':FzfLua oldfiles<CR>')
    n('<Space>o', ':FzfLua files<CR>')
    n('<Space>;', ':FzfLua commands<CR>')
    n('<Space>.', '<Plug>(coc-codeaction-cursor)')
    n('<Space><Tab>', ':FzfLua buffers<CR>')
    i('<Space><Space>m', '$$<Left>')
    i('<Space><Space>mm', '$$<CR><CR>$$<Up>')
    n('<Space>f', ':FzfLua blines<CR>')
    n('<Space>ff', ':FzfLua grep<CR>')
    n('<Space>j', ':FzfLua jumps<CR>')
    n('<Space>co', function ()
        return ':!co . && co --goto %:' .. current_line() .. '<CR>'
    end, { expr = true })
end

return M