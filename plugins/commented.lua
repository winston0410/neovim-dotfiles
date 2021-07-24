local function init(paq)
	paq({
		"winston0410/commented.nvim",
		config = function()
			require("commented").setup({
                --prefer_block_comment = false,
                --custom_cms = {
                    --cpp = {
                        --block = "#if 0%s#endif"
                    --}
                --}
            })
		end,
	})
end

return {
	init = init,
}
