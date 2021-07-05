-- https://github.com/nvim-treesitter/nvim-treesitter-textobject
local function init(use)
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			-- vim.cmd(
				-- "TSInstall dart yaml vue tsx typescript toml teal svelte rust lua json javascript html go bash nix fennel c c_sharp cpp fish gomod erlang swift r"
			-- )
			vim.cmd("TSUpdate")
		end,
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup({
				highlight = { enable = true },
				indent = { enable = true },
				-- context_commentstring = { enable = true, enable_autocmd = true },
			})
		end,
	})
	use({ "nvim-treesitter/playground" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
end

return { init = init }
