U = require('util')
local M = {}
local cmd = U.cmd
local set = U.set
local current_line = function() return U.api.nvim_win_get_cursor(0)[1] end
local i = function(...) U.key('i', ...) end
local n = function(...) U.key('n', ...) end
local r = function(key) i(key, '<C-g>u' .. key) end
local l = function(key, ...) n('<Space>' .. key, ...) end

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
    r('<Space>')
    r('<CR>')
    l('w', '<C-W>')
    l('s', ':lua Keymaps.format()<CR>:w<CR>')
    l('<S-o>', ':FzfLua oldfiles<CR>')
    l('o', ':FzfLua files<CR>')
    l(';', ':FzfLua commands<CR>')
    l('.', '<Plug>(coc-codeaction-cursor)')
    l('<Tab>', ':FzfLua buffers<CR>')
    i('<Space><Space>m', '$$<Left>')
    i('<Space><Space>mm', '$$<CR>$$<Esc><S-o>')
    l('f', ':FzfLua blines<CR>')
    l('ff', ':FzfLua grep<CR>')
    l('j', ':FzfLua jumps<CR>')
    l('co', function ()
        return ':!co . && co --goto %:' .. current_line() .. '<CR>'
    end, { expr = true })
end

return M