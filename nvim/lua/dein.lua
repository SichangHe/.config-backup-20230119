local set = vim.opt
local fn = vim.fn
local add = fn['dein#add']
local begin = fn['dein#begin']
local check_install = fn['dein#check_install']
local install = fn['dein#install']
local end_ = fn['dein#end']

function activate_dein(path)
    -- Required:
    -- Add the dein installation directory into runtimepath
    local dein_path = string.format("%s/dein", path)
    set.runtimepath:append(dein_path)

    -- Required:
    local cache_path = string.format("%s/../../.local/share/dein", path)
    begin(cache_path)

    -- Let dein manage dein
    add(dein_path)

    -- Required:
    end_()

    -- If you want to install not installed plugins on startup.
    if check_install() == 1 then install() end
end
