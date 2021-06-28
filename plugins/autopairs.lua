local function init(paq)
  paq{'windwp/nvim-autopairs'}
  require('nvim-autopairs').setup()
end

return {
  init = init
}


