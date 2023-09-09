(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :nyngwang/nvimgelion
  :lazy false
  :priority 1000
  :dependencies [:nvim-tree/nvim-web-devicons]
  :config (fn []
            (vim.cmd "set termguicolors")
            (vim.cmd "colorscheme nvimgelion"))
  }]

