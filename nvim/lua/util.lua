local M = {}
M.api = vim.api
M.autocmd = M.api.nvim_create_autocmd
M.cmd = vim.cmd
M.fn = vim.fn
M.g = vim.g
M.set = vim.opt
M.use = function(module)
    package.loaded[module] = nil
    return require(module)
end

return M
