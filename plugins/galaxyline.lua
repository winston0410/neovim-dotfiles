local function init(paq)
	paq({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({
				options = { theme = "tokyonight" },
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {},
					lualine_x = {
						{
							"diagnostics",
							sources = { "nvim_lsp" },
							symbols = { error = " ", warn = " ", info = " " },
							-- color_error = colors.red,
							-- color_warn = colors.yellow,
							-- color_info = colors.cyan,
						},
						{
                            -- Check if active LSP exist
							function ()
								local msg = ""
								local clients = vim.lsp.get_active_clients()
								if #clients < 1 then
									msg = "年"
                                    return msg
								end
                                return ""
							end,
						},
					},
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	})
end

return {
	init = init,
}
