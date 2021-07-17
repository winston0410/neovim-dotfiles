-- https://github.com/nvim-treesitter/nvim-treesitter-textobject
local function init(use)
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			-- vim.cmd(
			-- "TSInstall dart yaml vue tsx typescript toml teal svelte rust lua json jsonc javascript html go bash nix fennel c c_sharp cpp fish gomod erlang swift r wast wat ejs dockerfile hcl devicetree comment commonlisp bibtex beancount cuda elm gdscript glimmer graphql julia ocaml ql query ruby rst sparql turtle verilog ledger hjson"
			-- )
			vim.cmd("TSUpdate")
		end,
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			-- Install custom language parser
			-- https://github.com/nvim-treesitter/nvim-treesitter#adding-parsers
			parser_config.hjson = {
				install_info = {
                    branch = "master",
					url = "https://github.com/winston0410/tree-sitter-hjson",
					files = { "src/parser.c" },
				},
				filetype = "hjson"
			}
			parser_config.jsonc = {
				install_info = {
					branch = "main",
					files = { "src/parser.c" },
					generate_requires_npm = true,
					url = "https://gitlab.com/WhyNotHugo/tree-sitter-jsonc",
				},
				maintainers = { "@WhyNotHugo" },
				readme_name = "JSON with comments",
				filetype = "jsonc",
				used_by = { "jsonc" },
			}
			parser_config.wast = {
				install_info = {
					branch = "main",
					url = "https://github.com/wasm-lsp/tree-sitter-wasm",
					files = { "wast/src/parser.c" },
				},
				filetype = "wast",
				used_by = { "wast" },
			}
			parser_config.wat = {
				install_info = {
					branch = "main",
					url = "https://github.com/wasm-lsp/tree-sitter-wasm",
					files = { "wat/src/parser.c" },
				},
				filetype = "wat",
				used_by = { "wat" },
			}
			parser_config.ejs = {
				install_info = {
					branch = "master",
					url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
					files = { "src/parser.c" },
				},
				filetype = "ejs",
				used_by = { "erb" },
			}
			parser_config.make = {
				install_info = {
					branch = "main",
					url = "https://github.com/alemuller/tree-sitter-make",
					files = { "src/parser.c" },
				},
				filetype = "make",
				used_by = { "make" },
			}
			treesitter.setup({
				highlight = { enable = true },
				indent = { enable = true },
				context_commentstring = { enable = true, enable_autocmd = true },
			})
		end,
	})
	use({ "nvim-treesitter/playground" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
end

return { init = init }
