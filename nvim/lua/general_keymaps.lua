local M = {}
local key = vim.keymap.set

function M.set()
    key('n', '<Space>n', ':noh<CR>')
    key('v', [[<Space>(]], [[c(<C-r>*)<Esc>]])
    key('v', [[<Space>[]], [[c[<C-r>*]<Esc>]])
    key('v', [[<Space>{]], [[c{<C-r>*}<Esc>]])
    key('v', [[<Space><]], [[c<<C-r>*><Esc>]])
    key('v', [[<Space>`]], [[c`<C-r>*`<Esc>]])
    key('v', [[<Space>']], [[c'<C-r>*'<Esc>]])
    key('v', [[<Space>"]], [[c"<C-r>*"<Esc>]])
    key('v', [[<Space>$]], [[c$<C-r>*$<Esc>]])
    key('v', [[<Space>*]], [[c*<C-r>**<Esc>]])
    key('v', [[<Space>**]], [[c**<C-r>***<Esc>]])
end

return M