function vscode_exists()
    return vim.fn.exists('g:vscode') == 1
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
end

