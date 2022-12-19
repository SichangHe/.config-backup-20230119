NvimConfigPath = debug.getinfo(1).source:match("@?(.*/)")
HomeDir = os.getenv('HOME')
U = require('util')
local vscode_exists = U.fn.exists('g:vscode') == 1

function AllConfig()
    U = U.use('util')
    GeneralOptions = U.use('general_options')
    GeneralKeymaps = U.use('general_keymaps')
    GeneralOptions.set()
    GeneralKeymaps.set()

    if vscode_exists then
        -- Running inside vscode
    else
        Options = U.use('options')
        Keymaps = U.use('keymaps')
        Packer = U.use('package_manager')
        Coc = U.use('coc')
        Au = U.use('autocmd')
        Plugins = U.use('plugins')

        Options.set()
        Keymaps.set()
        Packer.startup(Plugins.startup)
        Coc.setup()
        Au.set()
    end
end

AllConfig()
