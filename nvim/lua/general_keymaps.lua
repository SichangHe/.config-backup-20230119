GeneralKeymaps = {}
local set = vim.keymap.set

function GeneralKeymaps.set()
    set('n', '<Space><Space>', ':noh<CR>')
end

return GeneralKeymaps
