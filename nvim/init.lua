local path_here = debug.getinfo(1).source:match("@?(.*/)")
local vscode_exists = vim.fn.exists('g:vscode') == 1
local source = function(path) vim.cmd(string.format("source %s/%s", path_here, path)) end

require('custom.general_options')
set_general_options()

if vscode_exists then
    -- Running inside vscode
else
    require('custom.options')
    require('custom.keymaps')
    require('dein')

    set_options()
    set_keymap()

    source("one_half_light.vim")
    activate_dein(path_here)
end
