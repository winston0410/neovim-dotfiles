local function init(paq)
	paq {'folke/trouble.nvim', config = function ()

	require'trouble'.setup {
		position = "left",
		width = 30,
		use_lsp_diagnostic_signs = true,
		indent_lines = false,
		-- auto_open = true,
		-- auto_close = true
	}
    end }
end

return {init = init}

