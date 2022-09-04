Au = {}
local create = vim.api.nvim_create_autocmd

function Au.set()
  create('TextYankPost', {
    command = 'silent! lua vim.highlight.on_yank()'
  }) -- Highlight on yank.
  create('CursorHold', {
    command = 'wa'
  }) -- Autosave on no action.
end

return Au
