local config = {
	lintCommand = "vint --enable-neovim --",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
	lintSource = "vint",
}

return {
	config = config,
}
