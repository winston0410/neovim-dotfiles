local function init(paq)
	paq({
		"folke/tokyonight.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			vim.g.tokyonight_style = "night"
			vim.cmd("colorscheme tokyonight")
		end,
	})
end

return { init = init }
-- paq{'sainnhe/edge'}
-- vim.g.edge_transparent_background = 1
-- vim.g.edge_sign_column_background = 'none'
-- vim.g.edge_diagnostic_text_highlight = 1
-- vim.g.edge_diagnostic_line_highlight = 1
-- vim.g.edge_diagnostic_virtual_text = 'colored'
-- vim.g.edge_better_performance = 1
-- vim.cmd 'colorscheme edge'
