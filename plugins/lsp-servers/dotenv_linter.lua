local linter = {
	lintCommand = "dotenv-linter --no-color",
	lintFormats = {
		"%f:%l %m",
	},
	lintStdin = true,
	lintSource = "dotenv-linter",
	lintIgnoreExitCode = true,
}

return {
	config = linter,
}
