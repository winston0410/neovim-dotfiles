local function init(paq)
	paq({
		"winston0410/formatter.nvim",
		config = function()
			local function mix_format()
				return {
					exe = "mix",
					args = { "format", "--", vim.api.nvim_buf_get_name(0) },
					stdin = false,
				}
			end

			local function elm_format()
				-- Not working
				return {
					exe = "elm-format",
					args = { "--", vim.api.nvim_buf_get_name(0) },
					stdin = false,
				}
			end

			local function styler()
				return {
					exe = "",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end

			local function swift_format()
				return {
					exe = "swift-format",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end

			local function clang_format()
				return {
					exe = "clang-format",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end

			local function goimports()
				return {
					exe = "goimports",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end

			local function fnlfmt()
				return {
					exe = "fnlfmt",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end

			local function prettier()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end

			local function ktlint()
				return {
					exe = "ktlint",
					args = { "--format", vim.api.nvim_buf_get_name(0) },
					stdin = false,
				}
			end

			local function purty()
				return {
					exe = "purty",
					args = { "--", vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end

			local function dockfmt()
				return {
					exe = "dockfmt",
					args = { "--write", "--", vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end

			local function gofmt()
				return {
					exe = "gofmt",
					args = { "--", vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end

			local function dartfmt()
				return {
					exe = "dartfmt",
					args = { "--", vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end

			local function rustfmt()
				return {
					exe = "rustfmt",
					args = { "--emit=stdout" },
					stdin = true,
				}
			end

			local function luafmt()
				return {
					exe = "lua-format",
					args = { "--", vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end

			local function nixfmt()
				return {
					exe = "nixfmt",
					args = { "--", vim.api.nvim_buf_get_name(0) },
					stdin = false,
				}
			end

			local function shfmt()
				return {
					exe = "shfmt",
					-- args = {"-w", "--", vim.api.nvim_buf_get_name(0)},
					args = { "-s", "-w", "--", vim.api.nvim_buf_get_name(0) },
					stdin = false,
				}
			end

			local function stylua()
				return {
					exe = "stylua",
					-- args = {"-w", "--", vim.api.nvim_buf_get_name(0)},
					args = { "--", vim.api.nvim_buf_get_name(0) },
					stdin = false,
				}
			end

			local function black()
				return {
					exe = "black",
					-- args = {"-w", "--", vim.api.nvim_buf_get_name(0)},
					args = { "--fast", "--", vim.api.nvim_buf_get_name(0) },
					stdin = false,
				}
			end
			local function hindent()
				return {
					exe = "hindent",
					-- args = {"-w", "--", vim.api.nvim_buf_get_name(0)},
					args = { "--", vim.api.nvim_buf_get_name(0) },
					stdin = false,
				}
			end
			require("formatter").setup({
				logging = false,
				filetype = {
					html = { prettier },
					css = { prettier },
					scss = { prettier },
					sass = { prettier },
					less = { prettier },
					javascript = { prettier },
					typescript = { prettier },
					javascriptreact = { prettier },
					typescriptreact = { prettier },
					["javascript.jsx"] = { prettier },
					["typescript.jsx"] = { prettier },
					sh = { shfmt },
					zsh = { shfmt },
					markdown = { prettier },
					json = { prettier },
					yaml = { prettier },
					toml = { prettier },
					vue = { prettier },
					svelte = { prettier },
					python = { black },
					dockerfile = { dockfmt },
					-- No formatter for make
					make = {
						-- prettier
					},
					lua = { stylua },
					teal = { stylua },
					rust = { rustfmt },
					nix = { nixfmt },
					go = { gofmt, goimports },
					dart = { dartfmt },
					haskell = { hindent },
					purescript = { purty },
					kotlin = { ktlint },
					fennel = { fnlfmt },
					cpp = { clang_format },
					c = { clang_format },
					cs = { clang_format },
					swift = { swift_format },
					r = { styler },
					elm = { elm_format },
					elixir = { mix_format },
				},
			})

			vim.cmd([[ nnoremap <silent> <C-F> <cmd>write <bar> Format<CR>  ]])
		end,
	})

	-- require("formatter").setup({
	-- logging = false,
	-- filetype = {
	-- html = { prettier },
	-- css = { prettier },
	-- scss = { prettier },
	-- sass = { prettier },
	-- less = { prettier },
	-- javascript = { prettier },
	-- typescript = { prettier },
	-- javascriptreact = { prettier },
	-- typescriptreact = { prettier },
	-- ["javascript.jsx"] = { prettier },
	-- ["typescript.jsx"] = { prettier },
	-- sh = { shfmt },
	-- zsh = { shfmt },
	-- markdown = { prettier },
	-- json = { prettier },
	-- yaml = { prettier },
	-- toml = { prettier },
	-- vue = { prettier },
	-- svelte = { prettier },
	-- python = { black },
	-- dockerfile = { dockfmt },
	-- -- No formatter for make
	-- make = {
	-- -- prettier
	-- },
	-- lua = { stylua },
	-- teal = { stylua },
	-- rust = { rustfmt },
	-- nix = { nixfmt },
	-- go = { gofmt, goimports },
	-- dart = { dartfmt },
	-- haskell = { hindent },
	-- purescript = { purty },
	-- kotlin = { ktlint },
	-- fennel = { fnlfmt },
	-- cpp = { clang_format },
	-- c = { clang_format },
	-- cs = { clang_format },
	-- swift = { swift_format },
	-- r = { styler },
	-- elm = { elm_format },
	-- elixir = { mix_format },
	-- },
	-- })

	-- vim.cmd([[ nnoremap <silent> <C-F> <cmd>write <bar> Format<CR>  ]])
end

return { init = init }
