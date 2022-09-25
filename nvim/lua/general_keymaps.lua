GeneralKeymaps = {}
local key = vim.keymap.set

function GeneralKeymaps.set()
    key('n', '<Space>n', ':noh<CR>')
    key('n', '<Space>h', ':History<CR>')
end

return GeneralKeymaps
