NvimConfigPath = debug.getinfo(1).source:match("@?(.*/)")
HomeDir = os.getenv('HOME')
local vscode_exists = vim.fn.exists('g:vscode') == 1
local source = function(path) vim.cmd("source " .. NvimConfigPath .. path) end

local function use(module)
    package.loaded[module] = nil
    return require(module)
end

function LoadAllConfig()
    use('general_options')
    use('general_keymaps')
    GeneralOptions.set()
    GeneralKeymaps.set()

    if vscode_exists then
        -- Running inside vscode
    else
        use('options')
        use('keymaps')
        use('dein')

        Options.set()
        Keymaps.set()

        source("one_half_light.vim")
        Dein.activate()
    end
end

LoadAllConfig()
