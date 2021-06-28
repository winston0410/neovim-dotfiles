local function yank_highlight()
    vim.api.nvim_exec([[ 
	augroup yank_highlight
	autocmd!
	au TextYankPost * silent! lua vim.highlight.on_yank { higroup='Visual', timeout=500 }
	augroup END
	]], true)
end

local setup = function()
    yank_highlight()
end

return {setup = setup}

