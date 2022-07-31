function set_options()
    local set = vim.opt
    set.cursorline = true
    set.breakindent = true
    set.confirm = true
    set.endofline = false
    set.expandtab = true
    set.fixendofline = false
    set.list = true
    set.listchars = { multispace = '╎   ', trail = '·' }
    set.mouse = 'a'
    set.number = true
    set.relativenumber = true
    set.scrolloff = 3
    set.shiftwidth = 4
    set.spell = true
    set.splitright = true
    set.tabstop = 4
end
