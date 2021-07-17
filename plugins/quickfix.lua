local function init(use)

    vim.api.nvim_exec("command! -nargs=+ -complete=dir -bar Rg lua require'plugins.rg'.asyncGrep(<q-args>)", true)
    
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
