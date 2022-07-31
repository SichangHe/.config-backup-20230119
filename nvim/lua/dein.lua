local set = vim.opt
local fn = vim.fn
local call = fn.call
local add = function(target) call(fn['dein#add'], { target }) end
local begin = function(target) call(fn['dein#begin'], { target }) end
local check_install = function() call(fn['dein#check_install'], {}) end
local install = function() call(fn['dein#install'], {}) end
local end_ = function() call(fn['dein#end'], {}) end

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
