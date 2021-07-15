vim.api.nvim_exec(
	[[
augroup EnvFiletype
autocmd!
autocmd BufNewFile,BufRead *.env set filetype=dotenv.sh
autocmd BufNewFile,BufRead *.tl set filetype=teal
autocmd BufNewFile,BufRead *.exs,*.ex set filetype=elixir
autocmd BufNewFile,BufRead *.nix set filetype=nix
autocmd BufNewFile,BufRead *.tmux set filetype=tmux.sh
autocmd BufNewFile,BufRead *.conf set filetype=sh
autocmd BufNewFile,BufRead *.lock set filetype=sh
autocmd BufNewFile,BufRead *.purs set filetype=purescript
autocmd BufNewFile,BufRead *.hjson set filetype=hjson
autocmd BufNewFile,BufRead *.dhall set filetype=dhall
autocmd BufNewFile,BufRead *.ion set filetype=ion
autocmd BufNewFile,BufRead *.lean set filetype=lean
autocmd BufNewFile,BufRead *.ejs set filetype=ejs
autocmd BufNewFile,BufRead *.njk set filetype=nunjucks
autocmd BufNewFile,BufRead *.pug set filetype=pug
autocmd BufNewFile,BufRead *.hbs set filetype=hbs
autocmd BufNewFile,BufRead *.config set filetype=config
autocmd BufNewFile,BufRead .tmux.conf set filetype=tmux.sh
autocmd BufNewFile,BufRead Brewfile set filetype=ruby
autocmd BufNewFile,BufRead Podfile set filetype=ruby
autocmd BufNewFile,BufRead *.fish set filetype=fish
autocmd BufNewFile,BufRead package.json set filetype=packageJson.json
augroup END
]],
	true
)
