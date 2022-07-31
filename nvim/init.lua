local path_here = debug.getinfo(1).source:match("@?(.*/)")

local function vscode_exists()
    return vim.fn.exists('g:vscode') == 1
end

local function source(path)
    vim.cmd(string.format("source %s/%s", path_here, path))
end

require('custom.general_options')
set_general_options()

if vscode_exists() then
    -- Running inside vscode
else
    require('custom.options')
    require('custom.keymaps')
    set_options()
    set_keymap()

    source("one_half_light.vim")
end
