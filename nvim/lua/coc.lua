Coc = {}
local key = vim.keymap.set
local set = vim.opt
local cmd = vim.cmd
Coc.path_len = #set.runtimepath:get()

function Coc.new_file_open()
    local new_path_len = #set.runtimepath:get()
    if new_path_len ~= Coc.path_len then
        Coc.path_len = new_path_len
        cmd('silent! CocRestart')
    end
end

function Coc.setup()
    key('n', '<Space>p', ':CocList commands<CR>')
    key('n', 'gd', ":call CocActionAsync('jumpDefinition')<CR>")
end

return Coc
