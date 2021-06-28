local linter = {
  lintCommand = 'hadolint --no-color',
  lintFormats = {
	'%f:%l %m'
  },
}

return {
  config = linter
}




