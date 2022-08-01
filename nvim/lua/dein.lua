Dein = {}
local set = vim.opt
local fn = vim.fn
local add = fn['dein#add']
local begin = fn['dein#begin']
local check_install = fn['dein#check_install']
local install = fn['dein#install']
local load_toml = fn['dein#load_toml']
local end_ = fn['dein#end']

function Dein.activate()
    local dein_path = NvimConfigPath .. "/dein"
    set.runtimepath:append(dein_path)

    local cache_path = NvimConfigPath .. "/../../.local/share/dein"
    begin(cache_path)
    add(dein_path)
    local toml_path = NvimConfigPath .. "/dein.toml"
    load_toml(toml_path)
    local lazy_toml_path = NvimConfigPath .. "/dein_lazy.toml"
    load_toml(lazy_toml_path, { lazy = 1 })
    end_()

    if check_install() == 1 then install() end
end

return Dein
