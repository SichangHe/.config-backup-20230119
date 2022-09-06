Coc = {}
local key = vim.keymap.set
local set = vim.opt
local cmd = vim.cmd
Coc.opened_file_types = {}
Coc.first_load = true

function Coc.new_file_open()
    local file_type = set.filetype:get()
    if Coc.opened_file_types[file_type] == nil then
        Coc.opened_file_types[file_type] = 1
        if Coc.first_load then
            Coc.first_load = false
        else
            cmd('silent! CocRestart')
        end
    end
end

function Coc.setup()
    key('n', '<Space>p', ':CocList commands<CR>')
    key('n', 'gd', ":call CocActionAsync('jumpDefinition')<CR>")
end

return Coc
