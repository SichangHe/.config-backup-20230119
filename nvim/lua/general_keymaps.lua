GeneralKeymaps = {}
local key = vim.keymap.set

function GeneralKeymaps.set()
    key('n', '<Space>n', ':noh<CR>')
end

return GeneralKeymaps
