U = require('util')
local vscode_exists = U.fn.exists('g:vscode') == 1

function AllConfig()
    U = U.use('util')
    local use = U.use
    GeneralOptions = use('general_options')
    GeneralKeymaps = use('general_keymaps')
    GeneralOptions.set()
    GeneralKeymaps.set()

    if vscode_exists then
        -- Running inside vscode
    else
        Options = use('options')
        Keymaps = use('keymaps')
        Packer = use('package_manager')
        Au = use('autocmd')

        local plugins = use('plugins')
        local lazy_plugins = use('lazy_plugins')

        Options.set()
        Keymaps.set()
        Packer.startup(function(u)
            plugins(u)
            lazy_plugins(u)
        end)
        Au.set()
    end
end

AllConfig()
