GeneralKeymaps = {}
local set = vim.keymap.set

function GeneralKeymaps.set()
    set('n', '<Space>n', ':noh<CR>')
end

return GeneralKeymaps
