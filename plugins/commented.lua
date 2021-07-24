local function init(paq)
	paq({
		"winston0410/commented.nvim",
		config = function()
			require("commented").setup({})
		end,
	})
end

return {
	init = init,
}
