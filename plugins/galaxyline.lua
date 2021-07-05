local function init(paq)
	paq({
		"glepnir/galaxyline.nvim",
		branch = "main",
		config = function()
			--require('spaceline')
			--require('plugins.siduck76')
			require("plugins.custom-statusbar")
		end,
	})
end

return {
	init = init,
}
