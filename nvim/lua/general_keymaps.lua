local M = {}
local key = vim.keymap.set

function M.set()
    key('n', '<Space>n', ':noh<CR>')
    key('n', '<Space>h', ':History<CR>')
end

return M
