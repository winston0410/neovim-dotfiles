local function init(paq)
		paq{'winston0410/return-limelight.nvim'}
		require'return-limelight'.setup{}
end

return {
	init = init
}

