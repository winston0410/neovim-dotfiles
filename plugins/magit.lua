local function init(use)
	-- use({
	-- "tpope/vim-fugitive",
	-- config = function()
	-- end,
	-- })

	use({
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("neogit").setup({
				disable_signs = false,
				disable_context_highlighting = false,
				disable_commit_confirmation = true,
				mappings = {
					status = {
						-- ["B"] = "BranchPopup",
						-- ["s"] = "",
					},
				},
			})
		end,
	})
end

return {
	init = init,
}
