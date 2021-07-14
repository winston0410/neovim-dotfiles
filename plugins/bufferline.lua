local function init(use)
	use({
		"akinsho/nvim-bufferline.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				diagnostics = "nvim_lsp",
				enforce_regular_tabs = true,
				show_buffer_close_icons = false,
				show_close_icon = false,
			})
			vim.api.nvim_set_keymap("n", "<c-g>c", ":edit ", { silent = false, noremap = true })
			vim.api.nvim_set_keymap("n", "<c-g>q", "<cmd>bdelete<cr>", { silent = true, noremap = true })
		end,
	})
	use({
		"winston0410/buf-num-nav.nvim",
		config = function()
			require("buf-num-nav").setup()
		end,
	})
end

return {
	init = init,
}
