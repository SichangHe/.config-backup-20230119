GeneralOptions = {}
local set = vim.opt

function GeneralOptions.set()
    vim.cmd("lang en_US.UTF-8")
    set.clipboard = 'unnamed'
    set.timeoutlen = 300
    set.virtualedit = 'block'
end

return GeneralOptions
