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
		end,
	})
end

return {
	init = init,
}
