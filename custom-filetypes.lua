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
autocmd BufNewFile,BufRead *.purs set filetype=purescript
autocmd BufNewFile,BufRead .tmux.conf set filetype=tmux.sh
autocmd BufNewFile,BufRead Brewfile set filetype=ruby
autocmd BufNewFile,BufRead *.fish set filetype=sh
autocmd BufNewFile,BufRead package.json set filetype=packageJson.json
augroup END
]],
	true
)
