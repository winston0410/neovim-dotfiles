-- https://github.com/sveltejs/language-tools/tree/master/packages/svelte-check
local linter = {
	lintCommand = "svelte-check",
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
