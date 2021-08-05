local function init(paq)
	paq({
		"neovim/nvim-lspconfig",
        -- event = "CursorHold",
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

            local standard_config = { root_dir = root_dir, capabilities = capabilities, on_attach = on_attach }

			lspconfig.solargraph.setup(standard_config)
			lspconfig.vala_ls.setup(standard_config)
			lspconfig.jdtls.setup(standard_config)
			lspconfig.groovyls.setup(standard_config)
			lspconfig.html.setup(standard_config)
			lspconfig.cssls.setup(standard_config)
			lspconfig.jsonls.setup(standard_config)
			lspconfig.elixirls.setup({
				cmd = { "elixir-ls" },
				root_dir = root_dir,
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.leanls.setup(standard_config)
			lspconfig.dhall_lsp_server.setup(standard_config)
			lspconfig.hls.setup(standard_config)
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
			lspconfig.dartls.setup(standard_config)
			lspconfig.terraformls.setup(standard_config)
			lspconfig.texlab.setup(standard_config)
			lspconfig.ccls.setup(standard_config)
			lspconfig.svelte.setup(standard_config)
			lspconfig.vuels.setup(standard_config)
			lspconfig.sqls.setup({
				on_attach = on_attach,
				root_dir = root_dir,
				-- connections = require("plugins.lsp-servers.sqls-config"),
			})
			lspconfig.graphql.setup(standard_config)
			lspconfig.elmls.setup(standard_config)
			lspconfig.ocamlls.setup(standard_config)
			lspconfig.puppet.setup(standard_config)
			lspconfig.serve_d.setup(standard_config)
			lspconfig.gdscript.setup(standard_config)
			lspconfig.scry.setup(standard_config)
			lspconfig.ember.setup(standard_config)
			lspconfig.angularls.setup(standard_config)
			lspconfig.bashls.setup(standard_config)
			lspconfig.prismals.setup(standard_config)
			-- lspconfig.zeta_note.setup({ on_attach = on_attach, root_dir = root_dir })
			lspconfig.r_language_server.setup(standard_config)
			lspconfig.kotlin_language_server.setup(standard_config)
			lspconfig.cmake.setup({
				cmd = { "cmake-language-server" },
				filetypes = { "cmake" },
				on_attach = on_attach,
				root_dir = root_dir,
                capabilities = capabilities
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
			lspconfig.tsserver.setup(standard_config)
			-- lspconfig.denols.setup(standard_config)
			lspconfig.dockerls.setup(standard_config)
			lspconfig.nimls.setup(standard_config)
			lspconfig.metals.setup(standard_config)
			lspconfig.julials.setup(standard_config)
			lspconfig.purescriptls.setup(standard_config)
			lspconfig.yamlls.setup(standard_config)
			lspconfig.vimls.setup(standard_config)
			lspconfig.rnix.setup(standard_config)
			lspconfig.pyright.setup({
				on_attach = on_attach,
				root_dir = root_dir,
				cmd = { "pyright-langserver", "--stdio" },
                capabilities = capabilities
			})

			local efm_config = {
				on_attach = on_attach,
				root_dir = root_dir,
				settings = {
					languages = require("plugins.efm"),
				},
                capabilities = capabilities
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
