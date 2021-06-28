local function init(paq)
		paq{'nvim-treesitter/nvim-treesitter-textobjects'}
end

local select = {}
local swap = {}
local move = {}

return {
	init = init,
	select = select,
	swap = swap,
	move = move
}


