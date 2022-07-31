function set_general_options()
    vim.cmd("lang en_US.UTF-8")

    local set = vim.opt
    set.clipboard = 'unnamed'
    set.virtualedit = 'block'
end
