local function init(use)
	-- use({
		-- "stevearc/qf_helper.nvim",
		-- config = function()
			-- require("qf_helper").setup({
				-- prefer_loclist = true,
				-- sort_lsp_diagnostics = true,
				-- quickfix = {
					-- autoclose = true,
					-- default_bindings = false,
					-- default_options = true,
					-- max_height = 10,
					-- min_height = 1,
					-- track_location = true,
				-- },
				-- loclist = {
					-- autoclose = true,
					-- default_bindings = false,
					-- default_options = true,
					-- max_height = 10,
					-- min_height = 1,
					-- track_location = true,
				-- },
			-- })
		-- end,
	-- })
end

return {
	init = init,
}
