local M = {}
local set = vim.opt

function M.set()
    vim.cmd("lang en_US.UTF-8")
    set.clipboard = 'unnamed'
    set.mousemodel = 'extend'
    set.timeoutlen = 300
    set.undofile = true
    set.virtualedit = 'block'
end

return M
