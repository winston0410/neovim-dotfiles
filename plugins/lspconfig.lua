local function init(paq)
	paq({
		"neovim/nvim-lspconfig",
		config = function()
			local root_dir = function()
				return vim.fn.getcwd()
			end

			local on_attach = function(client)
				require("plugins.smart_hover").setup(client)
				vim.cmd("command! LspNextDiagonistic lua vim.lsp.diagnostic.goto_next{ wrap = true }")
				vim.cmd("command! LspOpenDiagonisticList lua vim.lsp.diagnostic.set_loclist()")
				vim.cmd("command! LspShowTypeSignature lua vim.lsp.buf.type_definition()")
				vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
				vim.cmd("command! LspToDefinition lua vim.lsp.buf.definition()")
				vim.cmd("command! LspToTypeDefinition lua vim.lsp.buf.type_definition()")
				vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
				vim.cmd("command! LspFormat lua vim.lsp.buf.formatting()")
				vim.cmd("command! LspRenameSymbol lua vim.lsp.buf.rename()")
			end

			local lspconfig = require("lspconfig")

			local capabilities = vim.lsp.protocol.make_client_capabilities()

			capabilities.textDocument.completion.completionItem.snippetSupport = true

			lspconfig.java_language_server.setup({ root_dir = root_dir, capabilities = capabilities, on_attach = on_attach })
			lspconfig.groovyls.setup({ root_dir = root_dir, capabilities = capabilities, on_attach = on_attach })
			lspconfig.html.setup({ root_dir = root_dir, capabilities = capabilities, on_attach = on_attach })
			lspconfig.cssls.setup({ root_dir = root_dir, capabilities = capabilities, on_attach = on_attach })
			lspconfig.jsonls.setup({ root_dir = root_dir, capabilities = capabilities, on_attach = on_attach })
			lspconfig.elixirls.setup({
				cmd = { "elixir-ls" },
				root_dir = root_dir,
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.leanls.setup({ root_dir = root_dir, capabilities = capabilities, on_attach = on_attach })
			lspconfig.dhall_lsp_server.setup({ root_dir = root_dir, on_attach = on_attach })
			lspconfig.hls.setup({ root_dir = root_dir, on_attach = on_attach })
			lspconfig.rust_analyzer.setup({
				root_dir = root_dir,
				on_attach = on_attach,
				checkOnSave = {
					allFeatures = true,
					-- overrideCommand = {
					-- "cargo",
					-- "clippy",
					-- "--workspace",
					-- "--message-format=json",
					-- "--all-targets",
					-- "--all-features",
					-- },
				},
			})
			lspconfig.dartls.setup({ root_dir = root_dir, on_attach = on_attach })
			lspconfig.terraformls.setup({ root_dir = root_dir, on_attach = on_attach })
			lspconfig.texlab.setup({ root_dir = root_dir, on_attach = on_attach })
			lspconfig.ccls.setup({ root_dir = root_dir, on_attach = on_attach })
			lspconfig.svelte.setup({ root_dir = root_dir, on_attach = on_attach, capabilities = capabilities })
			lspconfig.vuels.setup({ root_dir = root_dir, on_attach = on_attach, capabilities = capabilities })
			lspconfig.sqls.setup({
				on_attach = on_attach,
				root_dir = root_dir,
				-- connections = require("plugins.lsp-servers.sqls-config"),
			})
			lspconfig.graphql.setup({ on_attach = on_attach, root_dir = root_dir, capabilities = capabilities })
			lspconfig.elmls.setup({ on_attach = on_attach, root_dir = root_dir, capabilities = capabilities })
			lspconfig.ocamlls.setup({ on_attach = on_attach, root_dir = root_dir, capabilities = capabilities })
			lspconfig.puppet.setup({ on_attach = on_attach, root_dir = root_dir, capabilities = capabilities })
			lspconfig.serve_d.setup({ on_attach = on_attach, root_dir = root_dir, capabilities = capabilities })
			lspconfig.gdscript.setup({ on_attach = on_attach, root_dir = root_dir, capabilities = capabilities })
			lspconfig.scry.setup({ on_attach = on_attach, root_dir = root_dir, capabilities = capabilities })
			lspconfig.ember.setup({ on_attach = on_attach, root_dir = root_dir, capabilities = capabilities })
			lspconfig.angularls.setup({ on_attach = on_attach, root_dir = root_dir, capabilities = capabilities })
			lspconfig.bashls.setup({ on_attach = on_attach, root_dir = root_dir, capabilities = capabilities })
			lspconfig.prismals.setup({ on_attach = on_attach, root_dir = root_dir, capabilities = capabilities })
			-- lspconfig.zeta_note.setup({ on_attach = on_attach, root_dir = root_dir })
			lspconfig.r_language_server.setup({ on_attach = on_attach, root_dir = root_dir, capabilities = capabilities })
			lspconfig.kotlin_language_server.setup({
				on_attach = on_attach,
				root_dir = root_dir,
			})
			lspconfig.cmake.setup({
				cmd = { "cmake-language-server" },
				filetypes = { "cmake" },
				on_attach = on_attach,
				root_dir = root_dir,
			})
			lspconfig.sumneko_lua.setup({
				cmd = { "lua-language-server" },
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
							path = vim.split(package.path, ";"),
						},
						completion = { enable = true, callSnippet = "Both" },
						diagnostics = {
							enable = true,
							globals = { "vim", "describe" },
							disable = { "lowercase-global" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
								[vim.fn.expand("/usr/share/awesome/lib")] = true,
							},
							-- adjust these two values if your performance is not optimal
							maxPreload = 2000,
							preloadFileSize = 1000,
						},
					},
				},
				on_attach = on_attach,
			})
			lspconfig.tsserver.setup({ root_dir = root_dir, on_attach = on_attach, capabilities = capabilities })
			-- lspconfig.denols.setup {on_attach = on_attach, root_dir = root_dir}
			lspconfig.dockerls.setup({ on_attach = on_attach, root_dir = root_dir, capabilities = capabilities })
			lspconfig.nimls.setup({ on_attach = on_attach, root_dir = root_dir })
			lspconfig.metals.setup({ on_attach = on_attach, root_dir = root_dir })
			lspconfig.julials.setup({ on_attach = on_attach, root_dir = root_dir })
			lspconfig.purescriptls.setup({ on_attach = on_attach, root_dir = root_dir })
			lspconfig.yamlls.setup({ on_attach = on_attach, root_dir = root_dir, capabilities = capabilities })
			lspconfig.vimls.setup({ on_attach = on_attach, root_dir = root_dir, capabilities = capabilities })
			lspconfig.rnix.setup({ on_attach = on_attach, root_dir = root_dir, capabilities = capabilities })
			lspconfig.pyright.setup({
				on_attach = on_attach,
				root_dir = root_dir,
				cmd = { "pyright-langserver", "--stdio" },
			})

			local efm_config = {
				on_attach = on_attach,
				root_dir = root_dir,
				settings = {
					languages = require("plugins.efm"),
				},
			}

			efm_config.filetypes = vim.tbl_keys(efm_config.settings.languages)

			lspconfig.efm.setup(efm_config)

			lspconfig.gopls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = { "gopls", "serve" },
				settings = {
					gopls = { analyses = { unusedparams = true }, staticcheck = true },
				},
			})

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { focusable = false })

			-- vim.lsp.handlers["textdocument/publishdiagnostics"] =
			-- vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			-- virtual_text = true,
			-- signs = true,
			-- update_in_insert = true
			-- })
		end,
	})
end

return { init = init }
