Coc = {}
local key = vim.keymap.set

function Coc.setup()
    key('n', '<Space>p', ':CocList commands<CR>')
    key('n', 'gd', ":call CocActionAsync('jumpDefinition')<CR>")
end

return Coc
