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
            vim.api.nvim_set_keymap("n", "<c-g>c", ":edit ", { silent = false, noremap = true})
            vim.api.nvim_set_keymap("n", "<c-g>q", "<cmd>bdelete<cr>", { silent = true, noremap = true})
		end,
	})
end

return {
	init = init,
}
