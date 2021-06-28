local function toggle_and_refresh()
  vim.cmd(':NvimTreeRefresh')
  vim.cmd(':NvimTreeToggle')
end

local function toggle_ignored_files()
  vim.g.nvim_tree_gitignore = 1 - vim.g.nvim_tree_gitignore  
  vim.cmd(':NvimTreeRefresh')
end

local function init(paq)
  paq{'kyazdani42/nvim-tree.lua'}

  vim.g.nvim_tree_gitignore = 1
  vim.g.nvim_tree_disable_keybindings = 0
  vim.g.nvim_tree_lsp_diagnostics = 1
  vim.g.nvim_tree_ignore = { '.git', 'node_modules' } 

  vim.api.nvim_set_keymap('n', '<leader><Bslash>', [[ :lua require('plugins.nvim-tree').toggle_and_refresh()<CR>]], {silent = true, noremap = true})
end

return {
  init = init,
  toggle_and_refresh = toggle_and_refresh
}

