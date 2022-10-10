NvimConfigPath = debug.getinfo(1).source:match("@?(.*/)")
HomeDir = os.getenv('HOME')
local fn = vim.fn
local vscode_exists = fn.exists('g:vscode') == 1
local source = function(path) vim.cmd("source " .. NvimConfigPath .. path) end

local function use(module)
    package.loaded[module] = nil
    return require(module)
end

function AllConfig()
    GeneralOptions = use('general_options')
    GeneralKeymaps = use('general_keymaps')
    GeneralOptions.set()
    GeneralKeymaps.set()

    if vscode_exists then
        -- Running inside vscode
    else
        Options = use('options')
        Keymaps = use('keymaps')
        Dein = use('dein')
        Coc = use('coc')
        Au = use('autocmd')
        Plugins = use('plugins')

        Options.set()
        Keymaps.set()
        Dein.activate()
        Coc.setup()
        Au.set()
        Plugins.set()
    end
end

AllConfig()
