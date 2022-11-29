local M = {}
local key = vim.keymap.set
local set = vim.opt
local cmd = vim.cmd
local fn = vim.fn
local async = fn.CocActionAsync
local fn_async = function(action)
    return function() async(action) end
end
M.path_len = #set.runtimepath:get()
local create = function(event, command)
    vim.api.nvim_create_autocmd(event, {command = command})
end

function M.new_file_open()
    local new_path_len = #set.runtimepath:get()
    if new_path_len ~= M.path_len then
        M.path_len = new_path_len
        cmd('silent! CocRestart')
    end
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
    key('i', '<Tab>', 'coc#pum#visible()? coc#pum#confirm(): "<TAB>"', {expr = true})
    key('i', '<C-j>', 'coc#pum#visible()? coc#pum#next(1): coc#refresh()', {expr = true})
    key('i', '<C-k>', 'coc#pum#visible()? coc#pum#prev(1): coc#refresh()', {expr = true})
    create('DirChanged', 'lua Coc.new_file_open()') -- Auto reload Coc on changing directory.
    create('CursorHold', "lua Coc.async('highlight')")
    create('CmdLineEnter', 'lua Coc.path_len = #vim.opt.runtimepath:get()') -- Update `Coc.path_len` on any command.
end

M.async = async

return M