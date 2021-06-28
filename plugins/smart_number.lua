local setup = function()
  vim.api.nvim_exec([[
  augroup SmartNumberGroup
  autocmd!
  autocmd CmdlineEnter : set norelativenumber | redraw
  autocmd CmdlineLeave : set relativenumber
  augroup END]], true)
end

return {
  setup = setup
}
