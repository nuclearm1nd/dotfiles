(module config.plugin.nvimgelion
  {autoload {nvim aniseed.nvim
             treesitter nvim-treesitter.configs}})

(def- cmd vim.api.nvim_command)

;; ColorScheme
(cmd "set termguicolors")
(cmd "colorscheme nvimgelion")

(treesitter.setup
  {:highlight
     {:enable true}})

