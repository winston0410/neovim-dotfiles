local function init(paq)
	-- paq{'phaazon/hop.nvim'}
	vim.api.nvim_set_keymap('n', '<leader>j', 'r<CR>', { silent = true, noremap = true})
end

return {
	init = init
}


