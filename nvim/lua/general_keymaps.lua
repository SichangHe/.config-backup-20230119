local M = {}
local key = vim.keymap.set

function M.set()
    key('n', '<Space>n', ':noh<CR>')
end

return M
