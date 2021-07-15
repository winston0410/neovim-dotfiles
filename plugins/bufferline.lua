local function init(use)
	use({
		"winston0410/nvim-bufferline.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					numbers = "ordinal",
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(count, level, errors)
						local icons = ""
                        -- https://github.com/akinsho/nvim-bufferline.lua/issues/144
						if level == "error" then
							icons = " "
						end
						return icons
					end,
					enforce_regular_tabs = false,
					show_buffer_close_icons = false,
					show_close_icon = false,
					mappings = false,
					left_mouse_command = "buffer! %d",
					middle_mouse_command = "buffer! %d",
					right_mouse_command = "buffer! %d",
					separator_style = "thin",
					always_show_bufferline = true,
					tab_size = 15,
				},
			})
			vim.api.nvim_set_keymap("n", "<c-g>c", ":edit ", { silent = false, noremap = true })
			vim.api.nvim_set_keymap("n", "<c-g>q", "<cmd>bwipeout<cr>", { silent = true, noremap = true })
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
