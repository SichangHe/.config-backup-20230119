Au = {}
local create = function(event, command)
    vim.api.nvim_create_autocmd(event, {command = command})
end

function Au.set()
    create('TextYankPost', 'silent! lua vim.highlight.on_yank()') -- Highlight on yank.
    create('CursorHold', 'wa') -- Autosave on no action.
end

return Au
