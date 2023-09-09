(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :vim-airline/vim-airline
  :lazy false
  :priority 1001
  :dependencies [:vim-airline/vim-airline-themes]
  :config (fn []
            (vim.cmd "set termguicolors")
            (vim.cmd "let g:airline_theme='minimalist'")
            (vim.cmd "let g:airline#extensions#tabline#enabled = 1")
            (vim.cmd "let g:airline#extensions#whitespace#checks = ['indent', 'trailing']"))}]

