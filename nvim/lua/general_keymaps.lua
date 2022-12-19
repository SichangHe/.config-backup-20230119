U = require('util')
local M = {}
local key = U.key

function M.set()
    key('n', '<Space>n', ':noh<CR>')
    key('v', [[<Space>(]], [[c(<C-r>*)<Esc>]])
    key('v', [[<Space>[]], [[c[<C-r>*]<Esc>]])
    key('v', [[<Space>{]], [[c{<C-r>*}<Esc>]])
    key('v', [[<Space><]], [[c<<C-r>*><Esc>]])
    key('v', [[<Space>`]], [[c`<C-r>*`<Esc>]])
    key('v', [[<Space>']], [[c'<C-r>*'<Esc>]])
    key('v', [[<Space>"]], [[c"<C-r>*"<Esc>]])
    key('v', [[<Space>"""]], [[c"""<C-r>*"""<Esc>]])
    key('v', [[<Space>$]], [[c$<C-r>*$<Esc>]])
    key('v', [[<Space>*]], [[c*<C-r>**<Esc>]])
    key('v', [[<Space>**]], [[c**<C-r>***<Esc>]])
end

return M
