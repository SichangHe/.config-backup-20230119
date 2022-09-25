Coc = {}
local key = vim.keymap.set
local set = vim.opt
local cmd = vim.cmd
local fn = vim.fn
local pum_visible = function()
    return fn['coc#pum#visible']() == 1
end
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
        if pum_visible() then
            fn['coc#pum#confirm']()
        else
            return '<Tab>'
        end
    end, {expr = true})
    key('i', '<C-j>', function()
        if pum_visible() then
            fn['coc#pum#next'](1)
        else
            return '<C-j>'
        end
    end, {expr = true})
    key('i', '<C-k>', function()
        if pum_visible() then
            fn['coc#pum#prev'](1)
        else
            return '<C-k>'
        end
    end, {expr = true})
    create('DirChanged', 'lua Coc.new_file_open()') -- Auto reload Coc on changing directory.
    create('CursorHold', "lua Coc.async('highlight')")
    create('CmdLineEnter', 'lua Coc.path_len = #set.runtimepath:get()') -- Update `Coc.path_len` on any command.
end

Coc.async = async

return Coc