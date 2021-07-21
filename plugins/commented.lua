local function init(paq)
	paq({
		"winston0410/commented.nvim",
		keys = { { "n", "<Leader>c" }, { "n", "<Leader>cc" }, { "v", "<Leader>c" } },
		config = function()
			require("commented").setup({})
		end,
	})
end

return {
	init = init,
}
