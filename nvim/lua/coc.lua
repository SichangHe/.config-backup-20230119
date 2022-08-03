Coc = {}
local key = vim.keymap.set

function Coc.setup()
    Keymaps.format = function() vim.cmd('CocCommand editor.action.formatDocument') end
    key('n', '<Space>p', ':CocList commands<CR>')
    key('n', 'gd', ":call CocActionAsync('jumpDefinition')<CR>")
end

return Coc
