Options = {}
local set = vim.opt

function Options.set()
    set.cursorline = true
    set.breakindent = true
    set.confirm = true
    set.endofline = false
    set.expandtab = true
    set.fixendofline = false
    set.list = true
    set.listchars = {
        tab = '- ',
        multispace = '┊   ',
        trail = '·',
    }
    set.mouse = 'a'
    set.number = true
    set.relativenumber = true
    set.runtimepath:append('/opt/homebrew/opt/fzf')
    set.scrolloff = 3
    set.shiftwidth = 4
    set.spell = true
    set.splitright = true
    set.tabstop = 4
end

return Options
