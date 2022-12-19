local M = {}
M.api = vim.api
M.auto = function(event, command)
    vim.api.nvim_create_autocmd(event, {command = command})
end
M.cmd = vim.cmd
M.fn = vim.fn
M.g = vim.g
M.key = vim.keymap.set
M.set = vim.opt
M.use = function(module)
    package.loaded[module] = nil
    return require(module)
end

return M
