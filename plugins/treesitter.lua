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
		requires = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "nvim-treesitter/playground" },
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
		},
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
				filetype = "hjson",
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

			for _, mode in ipairs({ "n", "v" }) do
				-- Unmap x
				vim.api.nvim_set_keymap(mode, "x", "<nop>", { silent = true, noremap = true })
			end

			treesitter.setup({
				highlight = { enable = true },
				indent = { enable = true },
				context_commentstring = { enable = true, enable_autocmd = true },
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ai"] = "@conditional.outer",
							["ii"] = "@conditional.inner",
							["ac"] = "@call.inner",
							["ic"] = "@call.outer",
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["xf"] = "@function.outer",
							["xc"] = "@call.outer",
							["xs"] = "@parameter.inner",
							["xz"] = "@conditional.outer",
							["xv"] = "@class.outer",
						},
						-- goto_next_end = {
						-- ["]M"] = "@function.outer",
						-- ["]["] = "@class.outer",
						-- },
						goto_previous_start = {
							["Xf"] = "@function.outer",
							["Xc"] = "@call.outer",
							["Xs"] = "@parameter.inner",
							["Xz"] = "@conditional.outer",
							["Xv"] = "@class.outer",
						},
						-- goto_previous_end = {
						-- ["[M"] = "@function.outer",
						-- ["[]"] = "@class.outer",
						-- },
					},
				},
			})
		end,
	})
end

return { init = init }
