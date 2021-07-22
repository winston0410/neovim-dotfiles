package.path = package.path .. ";" .. vim.fn.getenv("HOME") .. "/.config/nvim/?.lua"

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ "git", "clone", "https://github.com/winston0410/packer.nvim.git", install_path })
	vim.api.nvim_command("packadd packer.nvim")
	vim.api.nvim_command("PackerInstall")
	vim.api.nvim_command("PackerSync")
end

vim.cmd([[ source $HOME/.config/nvim/keymap.vim ]])
vim.cmd([[ source $HOME/.config/nvim/command-alias.vim ]])
vim.cmd([[ source $HOME/.config/nvim/values.vim ]])
require("custom-filetypes")

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({ "kyazdani42/nvim-web-devicons" })
	require("plugins.trouble").init(use)
	require("plugins.treesitter").init(use)
	require("plugins.quickfix").init(use)
	require("plugins.magit").init(use)
	require("plugins.lspconfig").init(use)
	require("plugins.edge").init(use)
	require("plugins.hop").init(use)
	require("plugins.gitsigns").init(use)
	require("plugins.indent-blankline").init(use)
	-- require("plugins.telescope").init(use)
	require("plugins.galaxyline").init(use)
	require("plugins.formatter").init(use)
	require("plugins.colorizer").init(use)
	require("plugins.completion").init(use)
	-- require('plugins.numb').init(use)
	require("plugins.range-highlight").init(use)
	-- require("plugins.lightspeed").init(use)
	require("plugins.better-O").init(use)
	-- require('plugins.reverse-J').init(use)
	require("plugins.commented").init(use)
	require("plugins.bufferline").init(use)
	require("plugins.hardmode").init(use)
end)

require("plugins.smart_number").setup()
require("plugins.yank_highlight").setup()
-- require('plugins.nvim_context_vt').init(use)

vim.cmd([[ source $HOME/.config/nvim/highlight.vim ]])
