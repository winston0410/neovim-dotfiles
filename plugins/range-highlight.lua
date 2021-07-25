local function init(paq)
	paq({
		"winston0410/range-highlight.nvim",
		event = "CmdlineEnter",
		requires = { { "winston0410/cmd-parser.nvim", event = "CmdlineEnter" } },
		config = function()
			require("range-highlight").setup({})
		end,
	})
end

return {
	init = init,
}
