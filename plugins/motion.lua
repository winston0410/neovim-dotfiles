local function init(paq)
	paq{'winston0410/motion.nvim'}
	require'motion'.setup{}
end

return {
	init = init
}


