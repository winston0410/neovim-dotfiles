local setup = function()
	vim.api.nvim_exec(
		[[ 
	augroup yank_highlight
	autocmd!
	au TextYankPost * silent! lua vim.highlight.on_yank { higroup='Visual', timeout=500 }
	augroup END
	]],
		true
	)
end

return { setup = setup }
