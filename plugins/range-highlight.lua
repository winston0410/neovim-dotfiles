local function init(paq)
	paq{'winston0410/range-highlight.nvim', requires = { 'winston0410/cmd-parser.nvim' }, config = function ()

	require'range-highlight'.setup{}
    end}
end

return {
	init = init
}


