NvimConfigPath = debug.getinfo(1).source:match("@?(.*/)")
local vscode_exists = vim.fn.exists('g:vscode') == 1
local source = function(path) vim.cmd(string.format("source %s/%s", NvimConfigPath, path)) end

function LoadAllConfig()
    require('custom.general_options')
    require('custom.general_keymaps')
    SetGeneralOptions()
    SetGeneralKeymaps()

    if vscode_exists then
        -- Running inside vscode
    else
        require('custom.options')
        require('custom.keymaps')
        require('dein')

        SetOptions()
        SetKeymaps()

        source("one_half_light.vim")
        ActivateDein()
    end
end

LoadAllConfig()
