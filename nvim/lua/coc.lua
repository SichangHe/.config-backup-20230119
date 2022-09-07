Coc = {}
local key = vim.keymap.set
local set = vim.opt
local cmd = vim.cmd
local fn = vim.fn
local pum_visible = fn['coc#pum#visible']
local async = fn.CocActionAsync
local fn_async = function(action)
    return function() async(action) end
end
Coc.path_len = #set.runtimepath:get()
local create = function(event, command)
    vim.api.nvim_create_autocmd(event, {command = command})
end

function Coc.new_file_open()
    local new_path_len = #set.runtimepath:get()
    if new_path_len ~= Coc.path_len then
        Coc.path_len = new_path_len
        cmd('silent! CocRestart')
    end
end

function Coc.setup()
    key('n', '<Space>p', ':CocList commands<CR>')
    key('n', 'gd', fn_async('jumpDefinition'))
    key('n', 'gy', fn_async('jumpTypeDefinition'))
    key('n', 'gr', fn_async('jumpReferences'))
    key('n', '<F2>', fn_async('rename'))
    key('n', 'K', function()
        return fn.CocAction('hasProvider', 'hover') and async('doHover') or 'K'
    end)
    key('i', '<Tab>', function()
        return pum_visible() and fn['coc#pum#confirm']() or '<Tab>'
    end)
    key('i', '<C-j>', function()
        return pum_visible() and fn['coc#pum#next'](1) or '<C-j>'
    end)
    key('i', '<C-k>', function()
        return pum_visible() and fn['coc#pum#prev'](1) or '<C-k>'
    end)
    create('BufAdd', 'lua Coc.new_file_open()') -- Auto reload Coc on new file type.
    create('CursorHold', "lua Coc.async('highlight')")
end

Coc.async = async

return Coc