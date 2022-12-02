local M = {}
local key = vim.keymap.set
local fn = vim.fn
local pum_visible = function()
    return fn['coc#pum#visible']() == 1
end
local async = fn.CocActionAsync
local fn_async = function(action)
    return function() async(action) end
end
local refresh = fn['coc#refresh']
local create = function(event, command)
    vim.api.nvim_create_autocmd(event, {command = command})
end

function M.setup()
    key('n', '<Space>p', ':CocList commands<CR>')
    key('n', 'gd', fn_async('jumpDefinition'))
    key('n', 'gy', fn_async('jumpTypeDefinition'))
    key('n', 'gr', fn_async('jumpReferences'))
    key('n', '<F2>', fn_async('rename'))
    key('n', 'K', function()
        return fn.CocAction('hasProvider', 'hover') and async('doHover') or 'K'
    end)
    key('i', '<Tab>', function()
        return '<C-g>u' .. (pum_visible() and fn['coc#pum#confirm']() or '<Tab>')
    end, {expr = true})
    key('i', '<C-j>', function()
        return '<C-g>u' .. (pum_visible() and fn['coc#pum#next'](1) or refresh())
    end, {expr = true})
    key('i', '<C-k>', function()
        return '<C-g>u' .. (pum_visible() and fn['coc#pum#prev'](1) or refresh())
    end, {expr = true})
    create('CursorHold', "lua Coc.async('highlight')")
end

M.async = async

return M