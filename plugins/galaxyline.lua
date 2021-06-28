local function init(paq)
  paq{'glepnir/galaxyline.nvim', branch='main'}
  --require('spaceline')
  --require('plugins.siduck76')
  require('plugins.custom-statusbar')
end

return {
	init = init
}


