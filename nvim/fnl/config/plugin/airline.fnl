(module config.plugin.airline
  {autoload {nvim aniseed.nvim}})

(def- cmd vim.api.nvim_command)

(cmd "let g:airline_theme='minimalist'")
(cmd "let g:airline#extensions#tabline#enabled = 1")
(cmd "let g:airline#extensions#whitespace#checks = ['indent', 'trailing']")

